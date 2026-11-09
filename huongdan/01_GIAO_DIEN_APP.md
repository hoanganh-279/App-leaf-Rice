# 01. PHẦN GIAO DIỆN APP TRONG DỰ ÁN

> App: **RiceGuardian AI**, viết bằng **Flutter** (ngôn ngữ Dart). Toàn bộ giao diện nằm trong thư mục `lib/`.
> Đọc file này để biết giao diện nằm ở đâu, mỗi file làm gì, và nói gì với thầy.

## 1. Bản đồ tổng quát

```
lib/
├── main.dart                 Điểm khởi chạy app
├── app.dart                  MaterialApp: gắn theme + router
├── config/
│   ├── app_colors.dart       Bảng màu thương hiệu
│   └── app_theme.dart        ThemeData chung (chữ, nút, ô nhập, card)
├── router/app_router.dart    Danh sách trang và cách chuyển trang (go_router)
├── screens/                  22 màn hình
├── widgets/                  Thành phần giao diện dùng lại
│   ├── rice/                 "Design system" riêng của app
│   ├── auth/                 Khung giao diện đăng nhập/đăng ký
│   └── camera/               Khung chụp ảnh + vẽ khung bệnh
```

Ngoài `lib/`, phần liên quan giao diện còn có:

| Nơi | Nội dung |
|---|---|
| `img/` | Logo, ảnh splash, nền đăng nhập |
| `assets/news/` | Ảnh và dữ liệu tin tức hiển thị trong app |
| `assets/disease_catalog.json` | Nội dung mô tả bệnh và cách xử lý hiển thị cho nông dân |
| `docs/stitch/` | Bộ tài liệu thiết kế: design token, thư viện thành phần, quy tắc UX, mô tả từng màn hình |
| `docs/ui-spec/` | Đặc tả giao diện theo từng màn hình (splash, login, camera...) |
| `tools/make_splash_android12.py`, `tools/make_white_launcher_logo.py` | Script tạo ảnh splash và logo |

## 2. Màu sắc và theme (`lib/config/`)

`app_colors.dart` định nghĩa màu thương hiệu:

| Màu | Mã | Ý nghĩa |
|---|---|---|
| `primary` | `#2E7D32` | Xanh lúa, màu chính, nút chính |
| `secondary` | `#F9A825` | Vàng lúa, điểm nhấn |
| `danger` | `#C62828` | Đỏ, cảnh báo bệnh |
| `background` | `#F5F5F5` | Nền xám nhạt |

Màu nền trời/ruộng (`skyTop`, `fieldGreen`, `fieldDeep`...) dùng cho màn hình đăng nhập và splash.
`app_theme.dart` gom các màu này thành `ThemeData` để mọi màn hình đồng nhất.

**Lợi thế khi demo:** đổi một màu trong `app_colors.dart`, lưu file, giao diện trên máy ảo đổi ngay (hot reload).

## 3. Điều hướng (`lib/router/app_router.dart`)

- Màn hình không cần đăng nhập: `/splash`, `/login`, `/register`, `/forgot-password`, `/reset-password`.
- Sau đăng nhập, app có **5 tab** ở thanh dưới (khung ở `lib/screens/home/shell_screen.dart`):
  Trang chủ (`/home`), Ruộng (`/fields`), Chụp ảnh (`/camera`), Cảnh báo (`/alerts`), Cá nhân (`/profile`).
- Các trang phụ: `/photos`, `/settings`, `/news`, `/product`, `/my-questions`, thông báo, chi tiết ruộng...
- Có đoạn chuyển hướng tự động: chưa đăng nhập thì về `/login`, đã đăng nhập thì vào `/home`.

## 4. Các màn hình (`lib/screens/`)

| Nhóm | File | Nội dung |
|---|---|---|
| Đăng nhập | `auth/splash_screen.dart` | Màn hình khởi động |
| | `auth/login_screen.dart` | Đăng nhập (tài khoản demo: 0901234567 / Demo@123) |
| | `auth/register_screen.dart` | Đăng ký |
| | `auth/forgot_password_screen.dart`, `reset_password_screen.dart` | Quên và đặt lại mật khẩu |
| Trang chính | `home/shell_screen.dart` | Khung chứa 5 tab + thanh điều hướng dưới |
| | `home/dashboard_screen.dart` | Trang chủ: tổng quan ruộng, cảm biến, cảnh báo |
| Chụp ảnh AI | `camera/camera_screen.dart` | Chụp hoặc chọn ảnh, chạy AI, hiện kết quả |
| Ruộng | `fields/fields_list_screen.dart` | Danh sách thửa ruộng |
| | `fields/field_detail_screen.dart` | Chi tiết ruộng |
| | `field_log/field_log_sheet.dart` | Bảng ghi nhật ký (bottom sheet) |
| Cảnh báo | `alerts/alerts_screen.dart` | Danh sách cảnh báo |
| | `notifications/notifications_screen.dart` | Thông báo |
| Ảnh | `photos/photo_history_screen.dart` | Lịch sử ảnh đã chẩn đoán |
| Tin tức | `news/news_list_screen.dart`, `article_detail_screen.dart` | Tin tức, bài viết |
| | `news/product_detail_screen.dart` | Chi tiết sản phẩm |
| | `news/my_questions_screen.dart`, `question_thread_screen.dart` | Hỏi đáp |
| | `news/site_news_body.dart` | Phần nội dung tin tức |
| Cá nhân | `profile/profile_screen.dart` | Hồ sơ |
| | `settings/settings_screen.dart` | Cài đặt |

Ba file dài nhất, nhiều nội dung nhất: `camera_screen.dart` (~580 dòng), `field_detail_screen.dart` (~560), `dashboard_screen.dart` (~470).

## 5. Thành phần dùng lại (`lib/widgets/`)

`widgets/rice/` là bộ thành phần riêng của app (nhờ vậy các màn hình trông giống nhau):

| File | Thành phần |
|---|---|
| `rice_buttons.dart` | Nút bấm |
| `rice_card.dart` | Thẻ (card) |
| `rice_chips.dart` | Nhãn / chip |
| `rice_text_field.dart` | Ô nhập liệu |
| `rice_layout.dart` | Bố cục chung |
| `rice_empty_error.dart` | Giao diện khi trống / lỗi |
| `rice_feedback.dart` | Thông báo, hộp thoại phản hồi |
| `rice_field_background.dart` | Nền hình ruộng lúa |
| `rice_domain.dart`, `disease_widgets.dart` | Thành phần riêng của nghiệp vụ (bệnh, ruộng) |
| `rice.dart` | File gom (export) tất cả cho tiện import |

Các widget khác: `alert_badge.dart` (nhãn mức cảnh báo), `app_logo.dart`, `auth/auth_chrome.dart`,
`camera/capture_viewport.dart` (khung xem ảnh), `camera/detection_overlay.dart` (**vẽ khung đỏ quanh vùng bệnh** do AI phát hiện).

## 6. Nguyên tắc thiết kế (nói với thầy)

App dành cho **nông dân**, nên giao diện theo các nguyên tắc (xem `docs/stitch/00_MASTER_PROMPT.md`, `05_UX_RULES.md`):
- Nút lớn, dễ bấm; chữ to, rõ.
- Màu có ý nghĩa: xanh = khỏe/an toàn, vàng = chú ý, đỏ = cảnh báo.
- Ít thao tác: chụp ảnh là việc chính, nằm giữa thanh điều hướng.
- Tiếng Việt, ngắn gọn.

## 7. Phần KHÔNG phải giao diện (đừng nhận nhầm)

Những thư mục này là logic, không phải việc của bạn: `lib/services/` (AI, đăng nhập, lưu dữ liệu, MQTT), `lib/models/`, `lib/providers/`, `lib/data/`, `lib/constants/`, `lib/utils/`.
Riêng `lib/services/ai_service.dart` là nơi **nạp mô hình TFLite**, liên quan phần việc thứ hai (xem `02_XUAT_MO_HINH_TFLITE.md`).

## 8. Cách trình bày với thầy (2–3 phút)

1. Chạy app trên máy ảo, đăng nhập demo, bấm lần lượt 5 tab.
2. Mở `app_colors.dart` và `app_theme.dart`: "đây là bảng màu và theme chung".
3. Mở `widgets/rice/rice_buttons.dart`: "đây là thành phần dùng lại ở mọi màn hình".
4. Mở `dashboard_screen.dart` song song với màn hình Trang chủ: "code khớp với giao diện".
5. Đổi một màu, lưu, cho thầy thấy giao diện đổi ngay (hot reload).

> Lưu ý trung thực: chỉ nhận phần bạn thực sự làm. Nếu thầy hỏi một đoạn code cụ thể, hãy mở đúng file ở bảng trên và đọc nó trước buổi demo.
