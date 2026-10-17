# 03a — BOTTOM NAVIGATION (Component Prompt riêng cho thanh menu footer)

> Dán **sau** [03_COMPONENT_LIBRARY.md](03_COMPONENT_LIBRARY.md) và **trước** màn B1 Trang chủ. Kết quả: một màn "Bottom Navigation" làm chuẩn cho `RiceBottomNav` trên 5 tab chính.
> Kiểu đã chọn: **Material 3 chuẩn**. Tab đang chọn có viên thuốc (pill) xanh nhạt, nhãn luôn hiện; nút "Chụp ảnh" ở giữa là nút tròn xanh nổi nhẹ, không viền.

## Vì sao thiết kế lại

Thanh hiện tại trong app (`lib/screens/home/shell_screen.dart`) có ba vấn đề:

| Vấn đề hiện tại | Nguyên tắc bị vi phạm | Cách sửa trong prompt |
|---|---|---|
| Tab đang chọn bị **mất nhãn**, chỉ còn vòng tròn xanh nhô lên | Familiarity, Feedback | Nhãn luôn hiện; tab đang chọn dùng pill M3 |
| Nhãn 10sp, chữ xám nhạt | Accessibility (đọc ngoài nắng) | Nhãn 12sp/500; tab đang chọn 12sp/600 màu primary |
| Mỗi tab đổi kích thước/vị trí khi chọn (nhảy lên 6–10dp) | Consistency | Vị trí icon cố định; chỉ đổi màu và pill |

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS and COMPONENT LIBRARY.

COMPONENT: RiceBottomNav — the single bottom navigation bar used on the 5 main tab screens. Generate a "Bottom Navigation" sheet showing the specs and every state below, plus one full "Trang chủ" frame with the bar in context.

PURPOSE
Let farmers switch between the 5 main areas with one thumb, always knowing where they are, and reach the main action "Chụp ảnh" instantly.

STRUCTURE (frame width 360dp)
- Container: full width, white surface #FFFFFF, height 80dp + bottom gesture safe area, 1dp top border #E0E0E0, soft upward shadow (y -1, blur 4, black 6%). No rounded corners, no floating margin.
- 5 equal slots of 72dp each, in this fixed order:
  1. "Trang chủ"  — icon home
  2. "Ruộng"      — icon eco
  3. "Chụp ảnh"   — center action button (see CENTER ACTION)
  4. "Cảnh báo"   — icon warning
  5. "Cá nhân"    — icon person
- Every slot: icon area on top, label below, centered; whole slot is the touch target (min 48x48).

REGULAR ITEM (slots 1, 2, 4, 5)
- Indicator pill: 56 x 32dp, radius full, centered behind the icon, 12dp from the top of the bar.
- Icon: 24dp Material Symbols Rounded, centered in the pill.
- Label: 4dp below the pill, 12sp, single line, centered, never truncated.
- INACTIVE: no pill, outlined icon #616161, label 12sp / 500 #616161.
- ACTIVE: pill filled with primary-tint (#2E7D32 at 18%), filled icon #2E7D32, label 12sp / 600 #2E7D32.
- PRESSED: ripple clipped to the pill shape, primary at 12%.
- Icons and labels never move or resize between states — only color, fill and pill change (200ms fade).

CENTER ACTION (slot 3 "Chụp ảnh")
- Round button 48dp, filled primary #2E7D32, white filled photo_camera icon 24dp. No colored ring.
- 3dp white gap around the button so it separates from the content behind it.
- Raised slightly: the top of the button sits about 8dp above the bar's top edge; soft shadow (y 2, blur 6, primary at 20%).
- Label "Chụp ảnh" 12sp sits on the same baseline as the other labels.
- INACTIVE: button as above, label 12sp / 500 #616161.
- ACTIVE (on the camera screen): button unchanged, label 12sp / 600 #2E7D32.
- PRESSED: button darkens 8% and scales to 0.96.
- It is always visible and never replaced by the pill style.

BADGE (proposed, "Cảnh báo" and optionally "Cá nhân")
- Small dot 8dp, color error #C62828, white 1.5dp outline, at the top-right of the icon.
- Dot only, no number (system counts are unavailable; numbers would show "-").

RULES
- Shown ONLY on the 5 tab screens: Trang chủ, Ruộng, Chụp ảnh, Cảnh báo, Cá nhân. Never on detail screens, auth screens, sheets or dialogs.
- Same position, height, order, icons and labels on every tab screen. Nothing is placed below the bar.
- Snackbars appear 8dp above the bar (above the raised camera button).
- Screen content gets bottom padding = bar height + 16 so the last card is not hidden.
- Accessibility: contrast AA for #616161 and #2E7D32 on white; each item announces "<label>, tab X of 5, selected/not selected".

STATES TO SHOW ON THE SHEET (one bar per row, labelled)
1. "Trang chủ" active
2. "Ruộng" active
3. "Chụp ảnh" active
4. "Cảnh báo" active with badge dot
5. "Cá nhân" active
6. Pressed state on "Ruộng" (ripple in pill)
7. Anatomy diagram with measurements: 80dp height, 72dp slots, 56x32 pill, 24dp icon, 12sp label, 48dp center button, 3dp white gap, 8dp raise.

Then show the bar inside a full "Trang chủ" frame (360x800) with "Trang chủ" active.

Requirements:
Keep the design system. Do not create new colors, fonts, radius or icon styles. Do not use a floating/pill-shaped bar, a notch cutout, or hide labels.
```

## Repair prompt cho thanh menu

Dán trên một màn tab khi thanh menu bị lệch:

```text
The bottom navigation on this screen drifted. Replace it with the exact RiceBottomNav from the "Bottom Navigation" sheet: white bar 80dp with 1dp #E0E0E0 top border, 5 equal slots in order "Trang chủ | Ruộng | Chụp ảnh | Cảnh báo | Cá nhân", labels always visible 12sp, active tab = primary-tint pill 56x32 + filled primary icon + primary label 600, center "Chụp ảnh" = slightly raised round 48dp primary button, no ring. Active tab for this screen: <tên tab>. Do not change anything else on the screen.
```

## Thông số tóm tắt

| Thuộc tính | Giá trị |
|---|---|
| Chiều cao | 80dp + safe area |
| Nền / viền trên | `#FFFFFF` / 1dp `#E0E0E0` |
| Số slot | 5 × 72dp |
| Pill tab đang chọn | 56 × 32dp, primary 18% |
| Icon | 24dp, outlined (chưa chọn) / filled (đang chọn) |
| Nhãn | 12sp; chưa chọn 500 `#616161`, đang chọn 600 `#2E7D32` |
| Nút Chụp ảnh | 48dp, primary, icon trắng 24dp, không viền, nổi 8dp |
| Badge (proposed) | chấm đỏ 8dp, không hiện số |
