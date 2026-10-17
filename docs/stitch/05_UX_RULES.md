# 05 — UX RULES

> Có thể dán khối dưới sau Layout Rules (khuyến nghị) hoặc dùng làm tài liệu đối chiếu khi review màn hình.

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY and LAYOUT RULES.

UX RULES — apply to every screen.

1. SIMPLICITY
- Exactly one PrimaryButton per screen (or per sheet). Other actions use OutlineButton / TextButton.
- Max 3 levels of hierarchy per card: title, supporting text, meta.
- Max 2 action icons in the app bar. No decorative illustrations except EmptyState icons and auth backgrounds.

2. STRUCTURE
- Order: header -> summary (KPI / status) -> content (lists, cards) -> actions.
- Related data lives in one card (e.g. all field info in "Thông tin thửa").
- Section headers use SectionHeader; "Xem tất cả" always on the right.

3. CONSISTENCY
- Same component for the same job everywhere (e.g. every list item is a ListCard, every filter is FilterChips).
- Same wording for the same action: "Lưu", "Hủy", "Thử lại", "Xem tất cả", "Đóng".

4. FEEDBACK (standard states — identical on every screen)
- Pressed: ripple on every tappable element.
- Action in progress: spinner inside the PrimaryButton, button disabled, label unchanged (or a progress label such as "Đang xử lý AI...").
- Loading list/page: Skeleton shapes matching the content (not a blank screen). Full-page first load may use Spinner + caption.
- Success: Snackbar (short, past tense, e.g. "Đã lưu trên máy").
- Empty: EmptyState = icon + one sentence + at most one OutlineButton.
- Error: ErrorBanner with message + TextButton "Thử lại".
- Offline: OfflineBanner at the top of the content or EmptyState with wifi_off icon "Cần kết nối mạng…".

5. ERROR PREVENTION
- Inline validation under the field as the user types / on blur; error text in error color with icon.
- PrimaryButton disabled until the form is valid.
- Destructive actions (Đăng xuất) require ConfirmDialog; destructive button uses error color and is separated (>= 24) from other actions.
- Reversible actions (mark all notifications read) show Snackbar with "Hoàn tác".
- Touch targets >= 48dp with >= 8dp gaps; no tappable elements at screen edges without padding.
- Show helpful tips before failure (e.g. camera tips "Đủ sáng", "Chụp gần", "Lá rõ nét").

6. FAMILIARITY
- Material 3 patterns only: top app bar, navigation bar, filter chips, outlined text fields, bottom sheets, dialogs, switches, snackbars.
- Back arrow top-left on every DETAIL_PAGE; system back closes sheets.

EDIT LEVELS
- Inline: one value (switch, mark as read, edit profile fields in place).
- SHEET: several fields in the same context (change password, farming log, ask a question).
- Dedicated page: independent multi-step flow (camera -> result preview).

ACCESSIBILITY
- WCAG AA contrast; body >= 14sp; never rely on color only (icon + text); icons in navigation always have labels.
```

## Chuẩn trạng thái dùng chung

| Trạng thái | Component | Câu chữ mẫu |
|---|---|---|
| Đang tải danh sách | Skeleton | — |
| Đang tải trang (lần đầu) | Spinner + caption | "Đang tải danh sách ruộng...", "Đang mở camera..." |
| Đang thao tác | PrimaryButton loading | "Đang xử lý AI..." |
| Thành công | Snackbar | "Đã lưu trên máy", "Đã đổi mật khẩu" |
| Rỗng | EmptyState | "Chưa có cảnh báo. Ruộng đang ổn!" |
| Lỗi | ErrorBanner + "Thử lại" | thông điệp từ hệ thống (không lộ stack/chi tiết kỹ thuật) |
| Offline | OfflineBanner / EmptyState wifi_off | "Cần kết nối mạng để xem bản tin." |
