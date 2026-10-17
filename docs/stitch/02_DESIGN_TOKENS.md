# 02 — DESIGN TOKENS (Token Prompt)

> Dán **sau** Master Prompt. Kết quả: một màn "Design Tokens" làm chuẩn cho mọi màn sau.
> Nguồn: [`lib/config/app_colors.dart`](../../lib/config/app_colors.dart), [`lib/config/app_theme.dart`](../../lib/config/app_theme.dart), [`docs/ui-spec/00-design-tokens.md`](../ui-spec/00-design-tokens.md).

```text
Apply the full RiceGuardian MASTER UI PROMPT.

DESIGN TOKENS — every screen in this project uses exactly this token set. Never use a value outside it.

COLORS
primary            = #2E7D32
on-primary         = #FFFFFF
primary-tint       = #2E7D32 @ 12%   (chips, avatar bg, icon containers, selected nav pill)
secondary          = #F9A825
on-secondary       = #1B1B1B
secondary-tint     = #F9A825 @ 12%
error              = #C62828
on-error           = #FFFFFF
error-tint         = #C62828 @ 8%    (error banner background)
success            = #2E7D32
warning            = #F9A825
background         = #F5F5F5
surface            = #FFFFFF
border             = #E0E0E0
scrim              = #000000 @ 40%

AUTH / DECORATIVE (only on Splash and Auth screens)
sky-top            = #87CEEB
sky-mid            = #B3E5FC
field-green        = #4CAF50
field-deep         = #1B5E20
frosted-card       = #FFFFFF @ 88% + background blur

RISK SEMANTICS (always icon + text, never color alone)
risk-high          = error     label "Nguy cơ cao"   icon warning
risk-medium        = secondary label "Trung bình"    icon error_outline
risk-low           = primary   label "Ổn định"       icon check_circle

TEXT
text-primary       = #1B1B1B
text-secondary     = #616161
text-disabled      = #9E9E9E
text-on-dark       = #FFFFFF

RADIUS
sm   = 8    (chips, small badges, thumbnails in rows)
md   = 12   (buttons, inputs, image thumbnails)
lg   = 16   (cards, hero images)
xl   = 24   (bottom sheets top corners, dialogs, frosted auth card)
full = 999  (avatars, pills, camera button, risk badges)

SPACING (base 4)
xs  = 4
sm  = 8
md  = 12
lg  = 16   (page horizontal padding, card padding)
xl  = 24   (section gap)
xxl = 32   (hero spacing)
Also allowed: 20 (between section header and first card on auth).

SIZE
touch-min        = 48
button-height    = 52
input-height     = 48 min (56 with floating label)
chip-height      = 32
app-bar-height   = 56
bottom-nav-height= 80
camera-button    = 56 round, ring 3 secondary
avatar           = 40 (rows) / 52 (greeting) / 80 (profile)
icon             = 24 (20 in chips)

SHADOW / ELEVATION
card     = elevation 1 (y 1, blur 3, black 8%)
sheet    = elevation 3 (y -2, blur 8, black 12%)
modal    = elevation 3
camera   = elevation 4 (y 2, blur 8, primary 30%)
app-bar  = elevation 0 (flat)

TYPOGRAPHY (Be Vietnam Pro)
heading-1  = 24 / 700 / line 1.25
heading-2  = 20 / 700 / line 1.3
heading-3  = 18 / 600 / line 1.3   (app bar title, section header)
body       = 15 / 400 / line 1.45
body-sm    = 14 / 400 / line 1.4
label      = 13 / 500
caption    = 12 / 400
button     = 16 / 600
kpi-value  = 20 / 800 (in semantic color)
nav-label  = 12 / 500

ICONS
Material Symbols Rounded, weight 400, outlined = inactive, filled = active.

Generate a "Design Tokens" sheet screen showing: color swatches with names and hex, risk semantics row, text colors, radius samples, spacing ruler, elevation samples, and the full type scale with Vietnamese sample text "Chăm ruộng thông minh".
```

## Bảng tra nhanh

| Nhóm | Token | Giá trị | Ghi chú |
|---|---|---|---|
| Màu | primary / secondary / error | `#2E7D32` / `#F9A825` / `#C62828` | Khớp `AppColors` |
| Màu | background / surface / border | `#F5F5F5` / `#FFFFFF` / `#E0E0E0` | border = `Colors.grey.shade300` trong input theme |
| Chữ | text-primary / secondary / disabled | `#1B1B1B` / `#616161` / `#9E9E9E` | disabled là token mới cho thiết kế |
| Radius | sm / md / lg / xl | 8 / 12 / 16 / 24 | chip 8, button/input 12, card 16 khớp `AppTheme` |
| Size | button-height | 52 | `minimumSize: Size(double.infinity, 52)` |
| Type | heading-3 | 18 / 600 | `appBarTheme.titleTextStyle` |
