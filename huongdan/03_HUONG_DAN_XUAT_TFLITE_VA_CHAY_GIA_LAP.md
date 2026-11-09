# 03. HƯỚNG DẪN: XUẤT MÔ HÌNH TFLITE → ĐƯA VÀO APP → CHẠY TRÊN GIẢ LẬP

> Máy của bạn đã được cài sẵn Flutter, JDK 17, Android SDK và máy ảo `RiceGuardian_Pixel7` (tất cả ở `D:\dev`).
> Phần A là xuất mô hình. Phần B là chạy app. Phần C là kiểm tra mô hình đã vào app chưa.

## PHẦN A. XUẤT MÔ HÌNH TFLITE (trên Kaggle)

Phải làm trên **Kaggle (Linux + GPU)**, không làm trên Windows được vì các thư viện xuất (`onnx2tf`, `ai-edge-litert`) hay lỗi trên Windows.

### A1. Chuẩn bị
1. Tài khoản Kaggle, đã xác minh số điện thoại (để bật Internet và GPU).
2. Xin nhóm quyền xem các dataset (xem `04_CONG_VIEC_KAGGLE_CUA_TOI.md`):
   - `anhnguynthvan/dataset-rice-leaf`
   - `anhnguynthvan/session-train-b-v5` (chứa classifier đã huấn luyện, có `b_ready_for_c`)
   - `yusufmurtaza01/rice-leaf-diseases` (dữ liệu detector)
   - Cần nữa thì `anhnguynthvan/session-train-0a-v5` (YOLO đã huấn luyện, chứa `yolo_best.pt`)

### A2. Chạy notebook
1. Kaggle → **Create → New Notebook → File → Import Notebook**, chọn `rice-detect-classify-kaggle.ipynb`.
2. Panel phải → **Add Data**, thêm các dataset ở A1.
3. **Settings**: Accelerator = **GPU**, Internet = **On**.
4. Ở cell 6 (mục "1. Config"), kiểm tra:
   ```python
   TRAINING_GROUP = 'C'
   EXPORT_DET_TFLITE = True
   ALLOW_C_WITHOUT_GATE = True    # cho phép xuất bản trial dù chưa đạt gate 85%
   ```
5. **Run All** (hoặc Run từng cell từ trên xuống). Quá trình xuất nằm ở hai cell cuối (61 và 63).
   - Nếu cell 61 báo `ultralytics` quá mới: **Restart session** rồi Run All lại (cell cài đặt sẽ ghim đúng bản).
   - Nếu thiếu `det_data.yaml`: thêm dataset `yusufmurtaza01/rice-leaf-diseases`, chạy lại từ Config.

### A3. Lấy kết quả
Cuối cell 63 in ra danh sách việc. Làm theo:
1. **Save Version → Save & Run All (Commit)**, chờ chạy xong.
2. Mục **Output** của notebook → tải file `rice_pipeline_v3_mobile_trial.zip` (bản chưa qua gate) hoặc `rice_pipeline_v3_mobile.zip` (đã qua gate).
3. Giải nén. Trong zip có:
   - `rice_leaf_cls_int8.tflite` (classifier)
   - `rice_det_yolov8s_float32.tflite` hoặc tên tương tự (detector; tên chính xác theo `det_tflite_info['ship_file']`)
   - `class_indices.json`, `pipeline_config.json`
   - `training_report.json`, `classifier_best.keras` (để lưu, không cần đưa vào app)

## PHẦN B. ĐƯA VÀO APP

1. **Sao lưu** thư mục cũ (phòng khi mô hình mới lỗi):
   ```powershell
   Copy-Item D:\Nhom14_Source\App-leaf-Rice\assets\models D:\Nhom14_Source\App-leaf-Rice\assets_models_backup -Recurse
   ```
   (đổi tên hoặc xóa thư mục backup trước khi commit, vì nó không thuộc dự án.)
2. Chép các file `.tflite`, `class_indices.json`, `pipeline_config.json` vào `D:\Nhom14_Source\App-leaf-Rice\assets\models\`, ghi đè file cũ.
3. **Quan trọng:** tên file detector phải khớp trường `detector.model_file` trong `pipeline_config.json`, và tên classifier khớp `model_file`. App đọc tên file từ config, nên chép đồng bộ cả bộ, đừng chỉ chép một file.
4. Không cần sửa code. `pubspec.yaml` đã khai báo cả thư mục `assets/models/`.

## PHẦN C. CHẠY TRÊN GIẢ LẬP

### C1. Cách nhanh nhất (khuyên dùng)
Bấm đúp file **`CHAY_APP.bat`** ở thư mục gốc dự án. Nó tự:
1. Đặt các biến môi trường,
2. Bật máy ảo `RiceGuardian_Pixel7` nếu chưa bật,
3. Chờ máy ảo khởi động xong,
4. `flutter pub get` rồi `flutter run`.

Lần chạy đầu mất vài phút, các lần sau nhanh hơn. Để thoát: trong cửa sổ đen gõ `q`.

### C2. Chạy thủ công
Mở PowerShell (mới) và chạy từng dòng:
```powershell
emulator -avd RiceGuardian_Pixel7
```
(chờ máy ảo lên màn hình chính), rồi ở một cửa sổ khác:
```powershell
cd D:\Nhom14_Source\App-leaf-Rice
flutter pub get
flutter run
```
Trong VS Code: mở thư mục dự án, chọn máy ảo ở góc dưới phải, nhấn **F5**.

Phím hữu ích khi `flutter run` đang chạy: `r` hot reload, `R` khởi động lại hoàn toàn, `q` thoát.

### C3. Thử mô hình trong app
1. Đăng nhập: `0901234567` / `Demo@123`.
2. Kéo vài ảnh lá lúa từ File Explorer thả vào cửa sổ máy ảo.
3. Tab **Chụp ảnh** → chọn từ thư viện → chọn ảnh → chẩn đoán.
4. Kết quả cần có: tên bệnh, %, khung quanh vùng bệnh (nếu không phải khỏe mạnh).
5. Xem **log** trong cửa sổ `flutter run`: app in thông tin tải mô hình và kết quả mỗi lần phân loại. Nếu có lỗi nạp mô hình sẽ thấy ở đây.

### C4. Dấu hiệu mô hình mới đã vào app
- Giá trị `latency_ms_kaggle_cpu_smoke` và `gate` trong `pipeline_config.json` khớp với bản bạn vừa tải.
- Chạy `flutter run` lại (không chỉ hot reload) sau khi chép mô hình, vì tài sản (assets) được đóng gói lúc build.
- Kết quả trên ảnh quen thuộc thay đổi hợp lý so với trước.

## PHẦN D. KHI GẶP LỖI

| Lỗi | Nguyên nhân thường gặp | Cách xử lý |
|---|---|---|
| Kaggle: `ultralytics` quá mới (>= 8.4.83) | Bản mới đổi định dạng xuất | Restart session, Run All để cell cài đặt ghim lại bản cũ |
| Kaggle: `No ... .tflite after export` | `onnx2tf`/`tf_keras` không hợp với TensorFlow trên Kaggle | Đọc log "TensorFlow SavedModel/Lite" ngay phía trên; đảm bảo Internet On |
| Kaggle: thiếu `det_data.yaml` | Chưa add dataset detector | Thêm `yusufmurtaza01/rice-leaf-diseases`, chạy lại từ Config |
| App: `Failed to load model` / crash khi chẩn đoán | Chép thiếu file, tên file không khớp config | Chép đủ bộ; kiểm tra `model_file` trong `pipeline_config.json` |
| App: kết quả vô lý | Sai kích thước/tiền xử lý | Kiểm tra `img_size`, `preprocess` trong config; không tự ý đổi |
| `flutter` không nhận | Chưa mở PowerShell mới sau khi cài | Đóng và mở lại cửa sổ |
| Máy ảo không bật | Thiếu ảo hóa | Bật Virtualization trong BIOS và tính năng Windows Hypervisor Platform |
| Build Gradle báo Java home không hợp lệ | Dự án trỏ đến JDK của máy khác | Đã xử lý ở `D:\dev\gradle\gradle.properties`; không sửa `android/gradle.properties` |
| Máy ảo hiện hình nhưng bấm không được / đơ | Máy ảo cấu hình đồ họa phần mềm, RAM thấp, hoặc còn đang khởi động | Đã sửa: bật GPU, RAM 3 GB (`D:\dev\avd\RiceGuardian_Pixel7.avd\config.ini`). Chờ thấy màn hình chính Android rồi mới thao tác. Nếu vẫn đơ: đóng máy ảo và chạy lại `CHAY_APP.bat` |
| Lỗi `copyFlutterAssetsDebug` / `app.dill` / "Cannot access a file in the destination directory" | Lần build trước bị ngắt giữa chừng, hoặc 2 lần build chạy cùng lúc (VS Code + file .bat) | Đóng hết cửa sổ đang chạy, rồi `flutter clean` và chạy lại. **Chỉ chạy một nơi một lúc** |
| VS Code báo Java home không hợp lệ | VS Code mở trước khi cài, chưa nạp biến môi trường | Đã thêm `.vscode/settings.json`; đóng hẳn VS Code (File → Exit) rồi mở lại |
| Báo "Gradle version lower than Flutter's minimum" | Flutter quá mới so với dự án | Máy bạn đã ghim Flutter **3.41.9** tại `D:\dev\flutter`. Đừng chạy `flutter upgrade` |

## PHẦN E. THÔNG TIN MÔI TRƯỜNG ĐÃ CÀI TRÊN MÁY BẠN

| Thành phần | Vị trí |
|---|---|
| Flutter 3.41.9 | `D:\dev\flutter` |
| JDK 17 | `D:\dev\jdk17` |
| Android SDK | `D:\dev\android-sdk` |
| Máy ảo `RiceGuardian_Pixel7` (Pixel 7, Android 14) | `D:\dev\avd` |
| Cache Gradle / Pub | `D:\dev\gradle`, `D:\dev\pub-cache` (khoảng 4 GB trở lên) |

Đã kiểm tra thật: build APK debug thành công, cài lên máy ảo, app mở, đăng nhập demo và vào được màn Trang chủ. Chưa kiểm tra: chẩn đoán ảnh bằng AI trên máy ảo và file `CHAY_APP.bat` (chạy cuối cùng bằng tay).
