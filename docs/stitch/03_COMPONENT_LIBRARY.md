# 03 — COMPONENT LIBRARY (Component Prompt)

> Dán **sau** Token Prompt. Kết quả: một (hoặc hai) màn "Component Library" để mọi màn sau lấy đúng Button / Input / Card thay vì tự chế.
> Tên component dùng xuyên suốt các file trong [06_screens/](06_screens/). Không tạo component mới ngoài danh sách này.

```text
Apply the full RiceGuardian MASTER UI PROMPT and DESIGN TOKENS.

COMPONENT LIBRARY — generate a "Component Library" sheet. Label each component with the exact name below. Every later screen must reuse these components only.

STATE MATRIX (show each applicable state side by side)
Default | Pressed (ripple + 8% darker overlay) | Disabled (38% opacity, no ripple) | Loading (spinner) | Error (where relevant)
Hover: not applicable (touch device). Focus: only for inputs.

------------------------
A. BUTTONS (height 52, radius md 12, label button 16/600, optional leading icon 20)
------------------------
PrimaryButton     filled primary, white label. States: default, pressed, disabled, loading (spinner 20 white replaces icon, label kept, not tappable).
TonalButton       primary-tint background, primary label (secondary emphasis actions).
OutlineButton     1dp primary border, primary label, transparent background.
TextButton        primary label, no container, min height 48 (e.g. "Xem tất cả", "Quên mật khẩu?").
DestructiveButton filled error, white label (only inside ConfirmDialog).
DestructiveOutlineButton 1dp error border, error label (e.g. "Đăng xuất" on Profile).
IconButton        48x48 touch target, 24 icon (app bar actions, eye toggle).
GoogleButton      48 round white button with Google "G" logo, 1dp border.

------------------------
B. INPUTS (radius md 12, white fill, border 1dp #E0E0E0, leading icon primary)
------------------------
RiceTextField     floating label, helper text caption. States: Default, Focus (2dp primary border), Filled, Error (2dp error border + error icon + error text below), Disabled.
PasswordField     RiceTextField + trailing eye IconButton ("Hiện mật khẩu").
MultilineField    RiceTextField 3-5 lines + character counter.
RiceDropdown      M3 outlined exposed dropdown with leading icon (e.g. "Chọn thửa ruộng").
ChoiceChipGroup   large selectable chips with icon (height 40) for 2-4 options.
TipChip           non-interactive M3 assist chip: icon 20 + label 13, border #E0E0E0, white fill (hints such as camera tips).
Checkbox / Switch M3 standard, primary when on.

------------------------
C. CARDS (white, radius lg 16, padding 16, elevation card)
------------------------
RiceCard          basic container with optional title row.
ListCard          interactive: leading (avatar 40 / thumbnail 64 radius md) + title body/600 + subtitle body-sm secondary + trailing chevron; whole card ripple.
FeaturedCard      image on top (16:9, top radius 16) + caption category + title 2 lines + meta.
KpiCard           compact, centered icon 22 in semantic color, kpi-value, caption label; tappable.
InfoRow           label (secondary) left / value (primary) right, divider between rows.
SectionHeader     heading-3 title left + optional TextButton "Xem tất cả" right.
ExpansionRow      M3 expansion tile inside a RiceCard: question body/600 + expand chevron; expanded shows answer body-sm; divider between rows.

------------------------
D. NAVIGATION
------------------------
RiceAppBar        Tab variant: no back arrow, centered white title 18/600 on primary, up to 2 white action icons.
                  Detail variant: white back arrow left, centered title (1 line, ellipsis), up to 2 actions.
                  Transparent variant: only on AUTH_PAGE (white back arrow on photo).
RiceBottomNav     white surface, height 80, 1dp #E0E0E0 top border, 5 equal slots: "Trang chủ" home, "Ruộng" eco, "Chụp ảnh" photo_camera, "Cảnh báo" warning, "Cá nhân" person.
                  Labels always visible 12sp. Active: primary-tint pill 56x32 + filled primary icon + primary label 600. Inactive: outlined #616161 icon + label 500.
                  Center "Chụp ảnh": raised round 56 primary button (12dp above bar), white camera icon, 3dp secondary ring, elevation camera; label below on the same baseline.
                  Full spec and states: see the dedicated Bottom Navigation prompt (03a).
FilterChips       horizontal scroll row of M3 filter chips (radius 8, height 32); selected = primary-tint fill + primary text + check icon.

------------------------
E. FEEDBACK
------------------------
Snackbar          dark (#1B1B1B) surface, white body-sm text, optional action "Hoàn tác" in secondary; bottom, above nav.
ErrorBanner       error-tint background, radius md, error icon + text body-sm in error, optional TextButton "Thử lại".
InfoBanner        primary-tint background, check/info icon, primary text (success messages inside forms).
OfflineBanner     background #F5F5F5 with 1dp border #E0E0E0, radius md, wifi_off icon + "Bạn đang offline — dữ liệu lưu trên máy" in text-secondary.
ConfirmDialog     radius xl 24, icon in tint circle, heading-2 title, body consequence, actions TextButton "Hủy" + DestructiveButton.
InfoDialog        same shell as ConfirmDialog, non-destructive: heading-2 title, body content (may include DiseaseActionList), single TextButton "Đóng".
BottomSheet       top radius xl 24, drag handle 32x4, heading-2 title, content, primary action pinned at bottom, keyboard-aware.
Skeleton          shimmer blocks in #E0E0E0 matching ListCard / KpiCard / FeaturedCard shapes.
Spinner           M3 circular progress in primary (full-page LoadingView = spinner + caption).
EmptyState        icon 64 in primary @ 40%, one-line body message centered, optional single OutlineButton.

------------------------
F. DOMAIN COMPONENTS
------------------------
AlertTypeChip     two variants, never merged:
                  - "Cảnh báo nguy cơ": outlined chip, secondary border/text, icon sensors (environment forecast).
                  - "Nhận diện từ ảnh": tonal chip, primary-tint fill, primary text, icon photo_camera (AI on photo).
RiskBadge         pill radius full: "Nguy cơ cao" (error), "Trung bình" (secondary), "Ổn định" (primary); icon + text.
DiseaseSummaryChip pill: disease name + confidence "Đạo ôn lá · 87%" (error tint + error text);
                  "Khỏe mạnh" (primary tint + check icon); "Chưa có kết quả" (neutral border + help icon).
DiseaseActionList title "Các bước xử lý" + 4 numbered rows, number in 24 round primary badge, body text.
ScoreBars         top 3 classes with label, horizontal bar (top bar primary, others #E0E0E0 track), percent right.
DetectionImage    photo radius lg with colored bounding boxes (2dp) and small label tags "Bạc lá 78%".
CaptureViewport   square camera frame radius lg, 4 white L-shaped corner guides, optional processing scrim with spinner + "Đang xử lý AI...".
SensorTile        icon + short name + value "-" + unit, in a 2x2 grid inside a RiceCard.
StatusChip        "Chờ trả lời" (secondary, schedule icon) / "Đã trả lời" (primary, check icon).
ChatBubble        right = primary-tint (farmer), left = white card with avatar "KTV" (technician), caption time.
AvatarInitials    round, primary-tint background, primary initials bold.

Layout of the sheet: group by A-F with section titles; show state matrix rows for Buttons, Inputs, ListCard, FilterChips, RiceBottomNav (each tab active once is not needed — show "Trang chủ" active and "Chụp ảnh" active).
```

## Ma trận trạng thái

| Component | Default | Pressed | Disabled | Loading | Error | Focus |
|---|---|---|---|---|---|---|
| PrimaryButton / Outline / Tonal | x | x | x | x | – | – |
| DestructiveButton | x | x | x | x | – | – |
| RiceTextField / PasswordField | x | – | x | – | x | x |
| RiceDropdown | x | x | x | – | x | x |
| ListCard / KpiCard / FeaturedCard | x | x | – | Skeleton | – | – |
| FilterChips / ChoiceChipGroup | x (+ selected) | x | x | – | – | – |
| RiceBottomNav item | inactive / active | x | – | – | – | – |
| BottomSheet / ConfirmDialog | x | – | – | nút bên trong loading | ErrorBanner bên trong | – |

Hover: không áp dụng (thiết bị cảm ứng).
