# 04. PHẦN VIỆC TRONG NOTEBOOK KAGGLE CỦA TÔI

> File: `rice-detect-classify-kaggle.ipynb` (64 cell). Tên: *RiceGuardian AI v5 — Train → TFLite On-Device*.
> Phần việc của bạn là **xuất TFLite** (hai cell cuối). Các phần huấn luyện ở trên do người khác làm trước, bạn chỉ cần hiểu để giải thích.

## 1. Toàn cảnh notebook

Notebook chạy **3 lần** trên Kaggle, mỗi lần đặt `TRAINING_GROUP` khác nhau (cell 6, mục "1. Config"):

| Lần | `TRAINING_GROUP` | Việc | Kết quả để lại |
|---|---|---|---|
| 1 | `'0A'` | Kiểm tra dữ liệu + nhãn, huấn luyện **YOLO11s** (detector, 120 epoch) | dataset `session-train-0a-v5` |
| 2 | `'B_B2'` | Huấn luyện **EfficientNetB3** (classifier 8 lớp, ~10+50 epoch) và tinh chỉnh | dataset `session-train-b-v5` |
| 3 | `'C'` | Kiểm tra "gate" + **xuất TFLite** + đóng gói | dataset `rice-v3-mobile-release` (hoặc `-trial`) |

**Bạn phụ trách Lần 3 (`'C'`)**. Notebook hiện đã đặt `TRAINING_GROUP = 'C'`, `EXPORT_DET_TFLITE = True`, `ALLOW_C_WITHOUT_GATE = True`.

## 2. Bản đồ cell (chú ý cell in đậm)

| Cell | Nội dung |
|---|---|
| 0 | Giới thiệu pipeline và quy trình 3 lần chạy |
| 1–4 | Chặn lỗi runtime, tải dataset bằng `kagglehub` |
| 6 | **Config** (toàn bộ tham số) |
| 8–11 | Cài thư viện, GPU, kiểm tra augmentation |
| 13–21 | Kiểm tra dữ liệu và nhãn (data audit, label audit) |
| 23–27 | Huấn luyện và đánh giá YOLO (chỉ nhóm `0A`) |
| 30–47 | Nạp checkpoint, huấn luyện classifier, đánh giá, tinh chỉnh (nhóm `B_B2`) |
| 49–57 | Đánh giá toàn pipeline trên tập test, tìm ngưỡng, **GATE_CHECK** |
| 59 | Xuất checkpoint nhóm B |
| **61** | **16a. Xuất detector sang TFLite** |
| **63** | **16. Xuất classifier sang TFLite INT8 + đóng gói zip** |

## 3. Việc của tôi, từng bước

### Bước 1. Config (cell 6)
- Chọn nhóm `'C'`, bật `EXPORT_DET_TFLITE`.
- `ALLOW_C_WITHOUT_GATE = True` nghĩa là cho phép xuất dù mô hình chưa đạt ngưỡng. Khi đó file zip có tên `..._trial.zip`.
- Ảnh vào: detector 640, classifier 300×300.

### Bước 2. Nạp mô hình đã huấn luyện (cell 30, 34)
Nạp `yolo_best.pt` (YOLO) và `classifier_best.keras` (EfficientNetB3) từ checkpoint của hai lần trước.

### Bước 3. Kiểm tra "gate" (cell 55–57)
Gate là các điều kiện để được gọi là bản phát hành:
- Độ chính xác (accuracy) ≥ 0,85,
- Macro-F1 ≥ 0,80,
- Recall của 3 bệnh quan trọng (Bạc lá, Đạo ôn, Đốm nâu) ≥ 0,75.

Kết quả trong dự án: accuracy ≈ 0,80 và macro-F1 ≈ 0,81, nên **chưa đạt gate** → `release_channel = "trial"`.

### Bước 4. Xuất detector (cell 61)
- Chép `yolo_best.pt` sang thư mục riêng.
- Gọi `YOLO(...).export(format='tflite', imgsz=640)`.
- Chọn file `.tflite` đúng loại (float32 hoặc int8), chép vào thư mục kết quả.
- Chạy thử một lần (smoke test) và, nếu có dataset detector, đo mAP50 và so sánh với `.pt`.

### Bước 5. Xuất classifier INT8 (cell 63)
1. Nạp `classifier_best.keras`.
2. Tạo tập hiệu chỉnh: 25 ảnh mỗi lớp từ thư mục train.
3. `TFLiteConverter.from_keras_model(...)`, bật `Optimize.DEFAULT`, `representative_dataset`, ép `uint8` ở đầu vào/ra.
4. Ghi file `rice_leaf_cls_int8.tflite`, chạy thử để đo độ trễ.
5. Đo lại trên tập test: TFLite so với Keras, có và không dùng TTA. Cảnh báo nếu tụt hơn 2%.

### Bước 6. Ghi cấu hình và đóng gói
- Ghi `pipeline_config.json` (kích thước ảnh, tiền xử lý, ngưỡng từ chối 0,45, 3 góc nhìn TTA, kết quả gate, kết quả TFLite, thông tin detector, `output_rule`).
- Ghi `class_indices.json` (thứ tự 8 lớp).
- Nén thành zip và in danh sách việc: Save Version → tải zip → chép vào `assets/models/` của Flutter.

## 4. Thuật ngữ để giải thích với thầy

| Từ | Nghĩa dễ hiểu |
|---|---|
| Detector / YOLO | Mô hình tìm vị trí vùng bệnh và vẽ khung |
| Classifier / EfficientNetB3 | Mô hình cho biết lá thuộc loại nào trong 8 lớp |
| TFLite | Định dạng mô hình nhẹ để chạy trên điện thoại |
| INT8 / lượng tử hóa | Nén số 32 bit thành 8 bit: nhẹ và nhanh hơn, giảm vài % độ chính xác |
| Representative dataset | Tập ảnh mẫu để máy "học cách nén" đúng khoảng giá trị |
| TTA | Chạy cùng ảnh ở 3 góc nhìn (gốc, lật ngang, lật dọc) rồi lấy trung bình để ổn định kết quả |
| Gate | Ngưỡng chất lượng bắt buộc đạt mới được phát hành |
| Reject threshold 0,45 | Nếu mô hình không đủ tự tin (dưới 45%) thì từ chối kết luận |
| Macro-F1 | Điểm cân bằng giữa các lớp, không bị lệch về lớp nhiều ảnh |
| Recall | Trong số lá thật sự bị bệnh, mô hình bắt được bao nhiêu phần |

## 5. Số liệu của dự án (để nói khi thầy hỏi)

- Gate: accuracy ≈ 80,2% (có TTA), macro-F1 ≈ 80,6%; mục tiêu 85% → chưa đạt.
- Keras có TTA ≈ 79,1%; TFLite INT8 có TTA ≈ 75,9%; **giảm ≈ 3,2%** vì lượng tử hóa.
- Độ trễ classifier ≈ 72 ms (CPU Kaggle, chỉ là đo thử, trên điện thoại sẽ khác).
- Kích thước: classifier ≈ 12,5 MB, detector ≈ 45 MB.

## 6. Việc cần hỏi nhóm trước buổi demo

- Bạn có quyền xem các dataset Kaggle của `anhnguynthvan` chưa? Nếu thầy muốn bạn chạy lại notebook thì rất cần.
- File YOLO trong app xuất từ mô hình nào? (notebook ghi YOLO11s nhưng tên file ghi `yolov8s`).
- Bản `.tflite` hiện có trong app là bản thử (`trial`); có bản đã qua gate không?

> Lưu ý: tôi (Claude) đã đọc code notebook và kết quả lưu sẵn, **chưa chạy lại** notebook trên Kaggle. Số liệu ở trên lấy từ `pipeline_config.json` trong dự án.
