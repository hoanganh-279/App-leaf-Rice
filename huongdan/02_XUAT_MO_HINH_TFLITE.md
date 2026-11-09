# 02. PHẦN XUẤT MÔ HÌNH TFLITE TRONG DỰ ÁN

> TFLite là định dạng mô hình AI nhẹ để chạy **ngay trên điện thoại, không cần internet**.
> Việc của bạn: chuyển mô hình đã huấn luyện (PyTorch/Keras) sang `.tflite` và đưa vào app.

## 1. Có 2 mô hình

| | Detector (khoanh vùng bệnh) | Classifier (phân loại bệnh) |
|---|---|---|
| Việc | Tìm vị trí vùng bệnh trên lá, vẽ khung | Cho biết đó là bệnh gì và độ tin cậy |
| Mô hình gốc | YOLO (Ultralytics), file `.pt` | EfficientNetB3 (Keras), file `.keras` |
| File trong app | `assets/models/rice_det_yolov8s_float32.tflite` (~45 MB) | `assets/models/rice_leaf_cls_int8.tflite` (~12,5 MB) |
| Kiểu số | float32 (không nén) | **INT8** (nén để nhẹ và nhanh) |
| Ảnh vào | 640×640 | 300×300 |

Hai file đi kèm trong `assets/models/`:
- `pipeline_config.json`: thông số tiền xử lý, ngưỡng, kết quả đánh giá, cấu hình detector.
- `class_indices.json`: thứ tự 8 lớp của classifier.

8 lớp của classifier: Bacterial Leaf Blight (bạc lá), Brown Spot (đốm nâu), Healthy Rice Leaf (khỏe mạnh), Leaf Blast (đạo ôn), Leaf scald, Narrow Brown Leaf Spot, Rice Hispa, Sheath Blight (khô vằn).

## 2. Phần xuất nằm ở đâu

### 2.1 Nguồn chuẩn: notebook `rice-detect-classify-kaggle.ipynb`
Hai cell cuối:

| Cell | Mục | Việc |
|---|---|---|
| 61 | "16a. Group C, detector TFLite" | Gọi `YOLO(...).export(format='tflite', imgsz=640)` để ra `.tflite` float32 (có thể thêm INT8) |
| 63 | "16. Group C, TFLite INT8 + rice-v3-mobile-release" | `TFLiteConverter.from_keras_model(...)` + lượng tử hóa INT8; kiểm tra TFLite so với Keras; ghi `pipeline_config.json`; nén zip |

Chạy khi `TRAINING_GROUP = 'C'` (xem `04_CONG_VIEC_KAGGLE_CUA_TOI.md`).

Điểm đáng nói trong cell 63:
- **Lượng tử hóa INT8** với `representative_dataset`: dùng 25 ảnh mỗi lớp để hiệu chỉnh.
- Đầu vào/ra ép về `uint8` để chạy nhanh trên điện thoại.
- Nếu INT8 lỗi thì tự chuyển sang "dynamic range" (vẫn là TFLite, nén ít hơn).
- Đo lại độ chính xác của TFLite và Keras trên cùng ảnh test, in cảnh báo nếu tụt hơn 2%.

Điểm đáng nói trong cell 61:
- Ghim `ultralytics < 8.4.83` vì bản mới đổi sang định dạng LiteRT với tên file và bố cục đầu vào khác.
- Cài các thư viện cần cho việc xuất: `onnx2tf`, `onnx-graphsurgeon`, `ai-edge-litert`...
- Đường đi: `.pt` → ONNX → TensorFlow SavedModel → TFLite (do Ultralytics + onnx2tf làm).

### 2.2 Thư mục `scripts/` (CHỈ tham khảo, phần lớn là bản cũ)

| File | Tình trạng |
|---|---|
| `export_rice_classifier_tflite.py` | Bản cũ: mô hình DenseNet 224×224, trỏ đến thư mục không còn trong repo. Không dùng |
| `export_rice_leaf_tflite.py` | Bản cũ: YOLOv8, trỏ đến `model_rice_leaf_v2/`. Không dùng |
| `parity_yolo_tflite.py` | So sánh YOLO `.pt` với `.tflite` xem có cho kết quả như nhau không. Chỉ chạy được khi có file `yolo_best.pt` |
| `export_disease_catalog_json.py` | Xuất danh mục bệnh sang JSON cho app. Cần thư mục `backend` không có trong repo này |

## 3. App dùng mô hình như thế nào

```
Ảnh người dùng
   │
   ├─► Classifier INT8 (300×300), chạy 3 góc nhìn (gốc, lật ngang, lật dọc), lấy trung bình xác suất
   │       → 1 bệnh có % cao nhất; dưới ngưỡng 0,45 thì từ chối kết luận
   │
   └─► Detector float32 (640×640) → các khung quanh vùng bệnh
```

| File | Việc |
|---|---|
| `lib/services/ai_service.dart` | Nạp 2 mô hình bằng `Interpreter.fromAsset`, đọc `pipeline_config.json`, ghép kết quả |
| `lib/services/classifier_preprocess.dart` | Resize ảnh, tạo 3 góc nhìn (TTA), chọn lớp cao nhất |
| `lib/services/yolo_tflite_helper.dart` | Xử lý đầu ra của detector (bỏ khung trùng NMS, đổi toạ độ) |
| `lib/data/disease_code_map.dart` | Đổi tên lớp tiếng Anh của mô hình sang tên tiếng Việt hiển thị (ví dụ Brown Spot → Đốm nâu) |
| `pubspec.yaml` | Thư viện `tflite_flutter` và khai báo thư mục `assets/models/` |

Quy tắc hiển thị (`output_rule`): chỉ bệnh có % cao nhất được hiện; nếu cao nhất là "khỏe mạnh" thì không vẽ khung. % là **độ tin cậy của mô hình**, không phải diện tích bị bệnh.

## 4. Kết quả đo (trong `pipeline_config.json`)

| Chỉ số | Giá trị |
|---|---|
| Tốc độ classifier (CPU Kaggle, đo thử) | ~72 ms |
| Độ chính xác Keras (có TTA) | ~79,1% |
| Độ chính xác TFLite INT8 (có TTA) | ~75,9% |
| Mức tụt do INT8 | ~3,2% |
| Ngưỡng "gate" yêu cầu | 85% |
| Kết luận | **Chưa đạt gate**, nên cấu hình ghi `release_channel: "trial"` (bản thử nghiệm) |

## 5. Điều cần biết để trả lời thầy

- **Tại sao phải đổi sang TFLite?** Để chạy offline trên điện thoại, nhẹ, không cần server.
- **INT8 là gì?** Nén số từ 32 bit xuống 8 bit: file nhỏ ~4 lần, chạy nhanh hơn, đổi lại giảm một ít độ chính xác (ở đây ~3%).
- **Vì sao detector không nén INT8?** Bản đang dùng là float32 (không nén) để khung bệnh chính xác hơn. Notebook có hỗ trợ xuất INT8 cho detector, nhưng bản trong app là float32. Chỉ số mAP trong `pipeline_config.json` đang để trống (`null`), nên đừng nói đã đo độ chính xác khung.
- **Chưa đạt gate 85% thì sao?** Thành thật: đây là bản thử nghiệm. Hướng cải thiện: thêm dữ liệu, hoặc dùng float16 thay INT8, hoặc hiệu chỉnh lại bằng nhiều ảnh hơn.
- **Tên file ghi `yolov8s` nhưng notebook viết YOLO11s?** Tên file và mô tả trong notebook đang không khớp nhau; mình không xác định được nguyên nhân từ code. Hãy hỏi người huấn luyện trong nhóm xem file `.tflite` trong app xuất từ mô hình YOLO nào trước khi trả lời thầy.
- Cấu hình detector có 9 tên lớp "Rice__..." chỉ mang tính tham khảo (`labels_informational_only`); tên bệnh hiển thị lấy từ classifier.
