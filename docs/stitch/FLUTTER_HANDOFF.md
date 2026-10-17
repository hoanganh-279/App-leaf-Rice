# Chuyển thiết kế Stitch sang Flutter

> Sau khi Stitch sinh xong và qua [07_CONSISTENCY_CHECK.md](07_CONSISTENCY_CHECK.md), export (Figma / HTML) và chuyển sang Flutter theo bảng dưới.
> Giữ nguyên route trong [`lib/router/app_router.dart`](../../lib/router/app_router.dart) và logic provider/service; chỉ thay lớp trình bày.

## Token → Theme

Định nghĩa tập trung tại [`lib/config/app_colors.dart`](../../lib/config/app_colors.dart) và [`lib/config/app_theme.dart`](../../lib/config/app_theme.dart).

| Token Stitch | Flutter hiện tại |
|---|---|
| primary / on-primary | `AppColors.primary` `0xFF2E7D32` → `ColorScheme.primary`; chữ trắng |
| secondary | `AppColors.secondary` `0xFFF9A825` → `ColorScheme.secondary` |
| error | `AppColors.danger` `0xFFC62828` → `ColorScheme.error` |
| background / surface | `AppColors.warmBackground` `0xFFF5F5F5` → `scaffoldBackgroundColor`; `surfaceElevated` white |
| text-primary / text-secondary | `AppColors.textPrimary` / `textSecondary` |
| text-disabled `#9E9E9E` | chưa có — thêm vào `AppColors` nếu thiết kế dùng |
| border `#E0E0E0` | `Colors.grey.shade300` trong `inputDecorationTheme.enabledBorder` |
| sky/field decorative | `AppColors.skyTop`, `skyMid`, `fieldGreen`, `fieldDeep` |
| Be Vietnam Pro | `GoogleFonts.beVietnamProTextTheme()` |
| heading-3 (app bar) 18/600 căn giữa | `appBarTheme` (`centerTitle: true`, fontSize 18, w600, elevation 0) |
| radius md 12 / height 52 | `elevatedButtonTheme`, `outlinedButtonTheme` (`minimumSize` 52) |
| radius lg 16, elevation 1 | `cardTheme` |
| radius sm 8 | `chipTheme` |
| input radius 12, focus 2dp primary | `inputDecorationTheme` |

Chưa có trong theme (cần thêm nếu áp dụng): `navigationBarTheme`, `bottomSheetTheme` (radius 24), `dialogTheme` (radius 24), `snackBarTheme`.

## Component Stitch → widget hiện có

| Component Stitch | Widget trong `lib/` |
|---|---|
| RiceCard / ListCard | `widgets/rice/rice_card.dart` (`RiceCard`) |
| KpiCard | `_MiniStat` trong `screens/home/dashboard_screen.dart` |
| PrimaryButton / OutlineButton | `widgets/rice/rice_buttons.dart` (`RicePrimaryButton`, `RiceOutlinedButton`) |
| RiceTextField / PasswordField / MultilineField | `widgets/rice/rice_text_field.dart` |
| EmptyState / ErrorBanner | `widgets/rice/rice_empty_error.dart` (`RiceEmptyState`, `RiceErrorBanner`) |
| Spinner page / network error | `widgets/common_widgets.dart` (`LoadingView`, `NetworkErrorView`) |
| AlertTypeChip / RiskBadge | `widgets/alert_badge.dart` (`AlertTypeChip`, `AlertBadge`) + nhãn `constants/alert_labels.dart` |
| DiseaseSummaryChip / DiseaseActionList | `widgets/rice/disease_widgets.dart` |
| DetectionImage / ScoreBars | `widgets/camera/detection_overlay.dart` (`DetectionImage`, `DiseaseScoreBars`) |
| CaptureViewport | `widgets/camera/capture_viewport.dart` |
| AUTH_PAGE background / frosted card / GoogleButton | `widgets/auth/auth_chrome.dart` (`AuthPhotoBackground`, `AuthFrostedCard`, `GoogleSignInCircleButton`) |
| Splash background | `widgets/rice/rice_field_background.dart` |
| Logo | `widgets/app_logo.dart` |
| RiceBottomNav | `screens/home/shell_screen.dart` — cần sửa theo [03a_BOTTOM_NAV.md](03a_BOTTOM_NAV.md): giữ nhãn khi active, nhãn 12sp, bỏ hiệu ứng nhảy lên, thêm pill 56×32 |
| Farming log sheet | `screens/field_log/field_log_sheet.dart` |

## Component chưa có widget (tạo trong `widgets/rice/` để dùng chung)

Skeleton, OfflineBanner, InfoBanner, ConfirmDialog, InfoDialog, SectionHeader, InfoRow, ExpansionRow, StatusChip, ChatBubble, SensorTile, ChoiceChipGroup, TipChip, DestructiveOutlineButton.

## Mục `(proposed)` cần thêm logic trước khi bật

| Đề xuất | Màn | Ghi chú |
|---|---|---|
| Đổi thứ tự Trang chủ (hành động chính lên trên) | B1 | Chỉ UI |
| Dòng tóm tắt "- thửa · - ha" | B2 | Chỉ UI (giá trị `-`) |
| Chip gợi ý chụp ảnh | B3 | Chỉ UI |
| Bộ lọc Có bệnh / Khỏe mạnh | C3 | Lọc local trong provider |
| Đánh dấu tất cả đã đọc + Hoàn tác, nhóm theo ngày | C4 | Cần hàm trong provider thông báo |
| Mục "Về ứng dụng", Snackbar khi bật/tắt | C5 | Phiên bản lấy từ package info (nếu có) |
| Chip chọn loại hoạt động | E2 | Thay `DropdownButtonFormField` |
| Dialog xác nhận đăng xuất | E3 | Thêm `showDialog` trước `logout` |
