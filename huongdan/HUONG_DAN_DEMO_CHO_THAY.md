# HƯỚNG DẪN DEMO CHO THẦY: GIAO DIỆN APP + XUẤT MÔ HÌNH TFLITE

> Dự án: **RiceGuardian AI** (app Flutter chẩn đoán bệnh lúa, AI chạy offline trên máy).
> Việc của bạn: (1) giao diện app, (2) xuất mô hình TFLite.

## 0. Đọc trước: vì sao dùng máy ảo Android?

- Bạn dùng **iPhone** và máy tính **Windows**. Máy ảo iPhone (iOS Simulator) **chỉ chạy trên Mac**, nên Windows không làm được.
- Thầy đã nói file APK chạy trên Android, nên bạn dùng **máy ảo Android (Android Emulator)** ngay trên laptop. Không cần điện thoại thật.
- Trên máy bạn hiện **chưa cài** Flutter và Android SDK (đã kiểm tra). Phải cài trước, mục 1 bên dưới. Máy bạn có khoảng 19 GB RAM nên chạy máy ảo ổn.
- Làm phần cài đặt **trước buổi demo ít nhất một ngày**. Tải và build lần đầu mất 30–60 phút.

---

> **Cập nhật:** Flutter, Android SDK và máy ảo đã được cài sẵn ở `D:\dev` trên máy bạn. Chỉ cần bấm đúp `CHAY_APP.bat`. Chi tiết xem `03_HUONG_DAN_XUAT_TFLITE_VA_CHAY_GIA_LAP.md`. Mục 1–2 dưới đây chỉ cần khi cài lại trên máy khác (lưu ý: dự án cần Flutter 3.41.x).

## 1. Cài đặt (làm một lần)

### 1.1 Cài Android Studio (lấy máy ảo + Android SDK)
1. Tải: https://developer.android.com/studio rồi cài, chọn **Standard** khi được hỏi.
2. Mở Android Studio lần đầu và chờ nó tải SDK xong.
3. Vào **More Actions → SDK Manager → tab SDK Tools**, tích:
   - Android SDK Command-line Tools (latest)
   - Android SDK Platform-Tools
   - Android Emulator
   Bấm **Apply**.

### 1.2 Cài Flutter
1. Tải Flutter SDK cho Windows: https://docs.flutter.dev/get-started/install/windows/mobile
2. Giải nén vào `C:\src\flutter` (đừng để trong thư mục có dấu cách hay Program Files).
3. Thêm `C:\src\flutter\bin` vào biến môi trường **Path** (Windows: gõ "Edit environment variables").
4. Mở PowerShell **mới** và chạy:

```powershell
flutter doctor --android-licenses
```

Gõ `y` cho tất cả câu hỏi. Sau đó:

```powershell
flutter doctor
```

Cần dòng **Flutter** và **Android toolchain** có dấu tích xanh. Dòng Visual Studio, Chrome không bắt buộc, bỏ qua.

### 1.3 Cài VS Code + extension
Mở VS Code, cài hai extension: **Flutter** (tự kéo theo Dart) và **Python** (nếu muốn chạy script).

---

## 2. Tạo máy ảo Android (làm một lần)

1. Android Studio → **More Actions → Virtual Device Manager → Create Device**.
2. Chọn **Phone → Pixel 7**, bấm Next.
3. Chọn system image **API 34 (UpsideDownCake)**, bấm mũi tên tải về nếu chưa có, rồi Next.
4. Bấm **Show Advanced Settings** và đặt:
   - Back camera: **VirtualScene**
   - RAM: **4096 MB**
5. Finish, rồi bấm nút **▶** để bật máy ảo. Chờ tới khi thấy màn hình chính Android.

> Nếu máy ảo không bật được và báo lỗi ảo hóa: bật **Virtualization (VT-x / SVM)** trong BIOS, và bật tính năng Windows **Windows Hypervisor Platform**.

---

## 3. Chạy app trên máy ảo

```powershell
cd D:\Nhom14_Source\App-leaf-Rice
flutter pub get
flutter run
```

Hoặc dùng VS Code: mở thư mục dự án, góc dưới bên phải chọn thiết bị là máy ảo (ví dụ `sdk gphone64 ... emulator-5554`), nhấn **F5** (cấu hình `RiceGuardian (offline)` đã có sẵn trong `.vscode/launch.json`).

Lần build đầu tiên rất lâu (tải Gradle, khoảng 10–20 phút). Các lần sau chỉ vài chục giây.

- **Đăng nhập demo** (app chạy offline, không cần server): số điện thoại `0901234567`, mật khẩu `Demo@123`.
- **Hot reload:** sửa code, nhấn **Ctrl+S** (hoặc nhấn `r` trong terminal) thì giao diện đổi ngay. Thầy thường thích thấy cái này, nên thử đổi một màu trong `lib/config/app_colors.dart`.

### Nạp ảnh lá lúa để thử AI
1. Chuẩn bị 3–5 ảnh lá lúa bệnh trên laptop (đạo ôn, đốm nâu, bạc lá...).
2. **Kéo thả** ảnh từ File Explorer vào cửa sổ máy ảo, ảnh sẽ vào thư viện của máy ảo.
3. Trong app: nút camera giữa → chọn từ thư viện → chọn ảnh → chẩn đoán.

---

## 4. Phần 1 cho thầy xem: CODE GIAO DIỆN

Toàn bộ giao diện nằm trong `lib/`. Mở VS Code, đi theo thứ tự này:

| Thứ tự | Đường dẫn | Nói gì với thầy |
|---|---|---|
| 1 | `lib/config/app_colors.dart`, `app_theme.dart` | Bảng màu thương hiệu (xanh lúa, vàng, đỏ cảnh báo) và theme chung của app |
| 2 | `lib/router/app_router.dart` | Cách chuyển giữa các màn hình |
| 3 | `lib/widgets/rice/` | Bộ thành phần dùng lại ("design system"): nút, card, chip, ô nhập, hộp thoại lỗi |
| 4 | `lib/screens/` | 22 màn hình, chia theo nhóm (xem dưới) |
| 5 | `lib/widgets/camera/detection_overlay.dart` | Vẽ khung (bounding box) quanh vùng bệnh trên ảnh |
| 6 | `docs/stitch/`, `docs/ui-spec/` | Tài liệu thiết kế: design token, quy tắc UX, mô tả từng màn hình |

Các nhóm trong `lib/screens/`:
- `auth/`: splash, đăng nhập, đăng ký, quên/đặt lại mật khẩu
- `home/`: dashboard và khung điều hướng đáy
- `camera/`: chụp ảnh và chẩn đoán
- `fields/`, `field_log/`: danh sách, chi tiết ruộng, ghi nhật ký
- `alerts/`, `notifications/`: cảnh báo, thông báo
- `photos/`: lịch sử ảnh
- `news/`: tin tức, sản phẩm, hỏi đáp
- `profile/`, `settings/`: cá nhân, cài đặt

**Gợi ý cách trình bày:** vừa mở màn hình trên máy ảo, vừa mở file tương ứng (ví dụ tab Home ↔ `lib/screens/home/dashboard_screen.dart`). Thầy sẽ thấy giao diện và code khớp nhau.

Thiết kế tuân theo nhu cầu nông dân: nút lớn, chữ rõ, ít thao tác, màu xanh/vàng/đỏ có ý nghĩa.

> Chuẩn bị trả lời: "Em làm phần nào?" → "Em làm toàn bộ giao diện trong `lib/screens` và `lib/widgets`, phần theme trong `lib/config`." (Hãy chắc chắn nói đúng với phần bạn thật sự làm với nhóm.)

---

## 5. Phần 2 cho thầy xem: XUẤT MÔ HÌNH TFLITE

### 5.1 Giải thích ngắn
App dùng **2 mô hình** chạy offline trên máy:
1. **Detector YOLO** (`assets/models/rice_det_yolov8s_float32.tflite`, khoảng 45 MB): tìm và khoanh vùng bệnh trên ảnh.
2. **Classifier EfficientNetB3** (`assets/models/rice_leaf_cls_int8.tflite`, khoảng 12,5 MB): phân loại 8 lớp (các bệnh + khỏe mạnh). Bản này đã **lượng tử hóa INT8** để nhẹ và nhanh trên điện thoại.

Hai file cấu hình đi kèm: `pipeline_config.json` (thông số tiền xử lý, ngưỡng, kết quả đánh giá) và `class_indices.json` (thứ tự các lớp).

### 5.2 Chỉ cho thầy code xuất mô hình
Mở file `rice-detect-classify-kaggle.ipynb` (VS Code với extension Jupyter, hoặc tải lên Kaggle). Hai cell cuối cùng là phần xuất TFLite:

- **Cell 61, mục "16a. detector TFLite":** gọi `YOLO(...).export(format='tflite', imgsz=640)` để chuyển mô hình YOLO sang TFLite (float32).
- **Cell 63, mục "16. TFLite INT8":**
  - `tf.lite.TFLiteConverter.from_keras_model(...)` chuyển mô hình Keras sang TFLite.
  - `converter.optimizations`, `representative_dataset` (mỗi lớp 25 ảnh để hiệu chỉnh) và `inference_input_type = tf.uint8` để lượng tử hóa INT8.
  - Sau đó chạy lại trên tập test để so TFLite với Keras, rồi ghi `pipeline_config.json` và nén tất cả thành zip.
- Cuối cell 63 notebook in ra danh sách việc: Save Version, tải zip, **chép vào `assets/models/` của app**.

Sơ đồ 1 dòng để nói với thầy:

> Huấn luyện (Kaggle GPU) → mô hình `.pt` / `.keras` → chuyển sang `.tflite` → chép vào `assets/models/` → app nạp qua `lib/services/ai_service.dart` và `yolo_tflite_helper.dart`.

### 5.3 Có chạy lại trên Kaggle không?
- **Không cần chạy lại khi demo.** File `.tflite` đã có sẵn trong repo, app chạy được ngay. Chỉ cần cho thầy xem **code** và **kết quả**.
- Nếu thầy yêu cầu chạy: cần tài khoản Kaggle có quyền vào các dataset của `anhnguynthvan` (xem ô đầu notebook), bật GPU + Internet, đặt `TRAINING_GROUP = 'C'` rồi chạy. Nên hỏi bạn trong nhóm về quyền này **trước buổi demo**.

### 5.4 Kết quả đo được (lấy từ `pipeline_config.json`)
- Tốc độ classifier: khoảng 72 ms trên CPU Kaggle (đo thử).
- Độ chính xác trên tập test: Keras (có TTA) ≈ 79,1%, TFLite INT8 (có TTA) ≈ 75,9%, giảm khoảng 3,2%.
- Gate (ngưỡng chất lượng) đặt là 85%, mô hình **chưa đạt**, nên cấu hình ghi `release_channel: "trial"` (bản thử nghiệm).

> **Nói thật với thầy**: đây là bản thử nghiệm, chưa đạt gate 85%. Nếu thầy hỏi, trả lời rằng nguyên nhân là dữ liệu và lượng tử hóa INT8 làm giảm vài phần trăm, và hướng cải thiện là tăng dữ liệu hoặc dùng float16 thay INT8. Thành thật tốt hơn là bị hỏi ra.

### 5.5 Lưu ý về thư mục `scripts/`
Hai file `export_rice_classifier_tflite.py` và `export_rice_leaf_tflite.py` là **bản cũ** (DenseNet / YOLOv8), trỏ tới thư mục không còn tồn tại trong repo này. **Đừng chạy và đừng dùng làm bằng chứng.** Nguồn chuẩn là notebook ở trên. Riêng `parity_yolo_tflite.py` chỉ dùng được khi có file `yolo_best.pt`.

---

## 6. Kịch bản demo 5–7 phút

1. (30 giây) Giới thiệu: app chẩn đoán bệnh lúa, AI chạy offline. Em làm giao diện và xuất mô hình TFLite.
2. (2 phút) Chạy app trên máy ảo, đăng nhập demo, lướt dashboard, ruộng, cảnh báo, tin tức.
3. (1 phút) Mở code giao diện: `app_colors.dart`, `widgets/rice/`, một màn hình. Sửa một màu và hot reload.
4. (1,5 phút) Chụp/chọn ảnh lá lúa, chẩn đoán, hiện khung bệnh và phần trăm.
5. (1,5 phút) Mở notebook cell 61 và 63, mở thư mục `assets/models/`, giải thích quy trình và kết quả ở mục 5.4.
6. (30 giây) Trả lời câu hỏi.

**Chuẩn bị sẵn:** máy ảo đã bật, app đã build một lần, ảnh lá lúa đã kéo vào máy ảo, notebook và các file ở bước 4–5 đã mở sẵn trong các tab VS Code.

---

## 7. Lỗi thường gặp

| Lỗi | Cách xử lý |
|---|---|
| `flutter` không nhận ra | Mở lại PowerShell mới sau khi thêm Path; kiểm tra `C:\src\flutter\bin` |
| `Android license status unknown` | Chạy `flutter doctor --android-licenses` |
| Máy ảo không bật / rất chậm | Bật VT-x/SVM trong BIOS, bật Windows Hypervisor Platform; giảm RAM máy ảo xuống 2048 |
| Không thấy máy ảo trong VS Code | Bật máy ảo trước; chạy `flutter devices` để kiểm tra |
| Build Gradle lỗi tải thư viện | Kiểm tra mạng, chạy lại `flutter run`; thử `flutter clean` rồi `flutter pub get` |
| App chạy nhưng AI lỗi/đơ | Xem log trong terminal của `flutter run`; kiểm tra 2 file `.tflite` có trong `assets/models/` |
| Camera máy ảo đen | Dùng nút chọn ảnh từ thư viện thay vì chụp trực tiếp |
