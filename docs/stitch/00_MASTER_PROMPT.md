# 00 — MASTER UI PROMPT

> Dán khối này **đầu tiên** vào project Stitch. Mọi prompt sau (Token, Component, Screen) đều mở đầu bằng *"Apply the full RiceGuardian MASTER UI PROMPT"*.
> Chi tiết mở rộng: [02_DESIGN_TOKENS.md](02_DESIGN_TOKENS.md), [03_COMPONENT_LIBRARY.md](03_COMPONENT_LIBRARY.md), [04_LAYOUT_RULES.md](04_LAYOUT_RULES.md), [05_UX_RULES.md](05_UX_RULES.md).

```text
MASTER UI PROMPT — RiceGuardian AI

You are a Senior UI/UX Designer and Design System Designer.
Design a native Android mobile app using ONE unified design system. Every screen generated in this project must look like it belongs to the same app.

========================
1. PRODUCT
========================
App name: RiceGuardian AI
App type: Native Android app (Material Design 3) for smart rice farming and early disease detection.
Users:
- Vietnamese rice farmers (primary): often not tech-savvy, used outdoors under strong sunlight, sometimes with wet hands, often offline.
- (Indirect) agricultural technicians who answer farmers' questions — they do NOT use this app.
Main goals:
- See my rice fields and their status.
- Take a photo of a rice leaf -> on-device AI detects disease -> see treatment steps -> save on the phone.
- Read alerts, clearly separating environmental risk forecasts from AI photo detections.
- Read the farmer newsletter and ask technicians questions.
Style: Modern, Clean, Professional, Minimal, Easy to use, Agricultural and trustworthy. High legibility outdoors.
Language: ALL UI text is Vietnamese with correct diacritics.

========================
2. COLOR SYSTEM
========================
Primary: #2E7D32 (rice green)
Secondary: #F9A825 (golden rice)
Background: #F5F5F5
Surface: #FFFFFF
Text Primary: #1B1B1B
Text Secondary: #616161
Text Disabled: #9E9E9E
Success: #2E7D32
Warning: #F9A825
Error: #C62828
Border: #E0E0E0
Text on Primary / Error: #FFFFFF. Text on Secondary: #1B1B1B.
Do not add new colors. Tints are only these colors at 8-12% opacity.

========================
3. TYPOGRAPHY
========================
Font: Be Vietnam Pro
H1: 24sp / Bold 700 (hero titles only)
H2: 20sp / Bold 700 (page headings, sheet titles)
H3: 18sp / SemiBold 600 (app bar title, section headers)
Body: 15sp / Regular 400, line-height 1.45
Body-sm: 14sp / Regular 400
Label: 13sp / Medium 500 (chips, buttons small, nav labels 12sp)
Caption: 12sp / Regular 400 (secondary info only)
Button text: 16sp / SemiBold 600
All screens use this same typography system. Never below 12sp.

========================
4. SPACING
========================
Base spacing: 4dp
Spacing scale: 4 / 8 / 12 / 16 / 20 / 24 / 32
Page horizontal padding 16. Gap between cards 12. Gap between sections 24.
Do not use arbitrary spacing.

========================
5. COMPONENTS (summary — full library is defined separately)
========================
Button: height 52dp, radius 12, full width; Primary = filled #2E7D32 with white text; Outline = 1dp #2E7D32 border.
Input: min height 48dp (filled white, ~56 with label), radius 12, border #E0E0E0, focus border #2E7D32 2dp, leading icon in primary.
Card: radius 16, padding 16, white, elevation 1 (soft shadow).
Chip: radius 8, height 32.
Bottom sheet / dialog: radius 24.
Bottom Navigation: fixed bottom, 5 tabs (Trang chủ | Ruộng | Chụp ảnh | Cảnh báo | Cá nhân); center "Chụp ảnh" is a raised round 56dp primary button with a 3dp #F9A825 ring.

========================
6. ICON
========================
One icon set only: Material Symbols Rounded.
Style: Outlined for inactive, Filled for active/selected. Size 24dp (20dp inside chips). Weight 400.
Never mix icon styles or other icon packs.

========================
7. GENERAL LAYOUT
========================
Mobile-first, Android frame 360 x 800 dp, respect status bar and gesture bar safe areas.
Horizontal padding: 16dp.
Header: M3 small top app bar, background #2E7D32, white title H3 18sp/600 CENTERED, white icons; back arrow on the left for detail screens; max 2 action icons on the right.
Bottom navigation: only on the 5 main tab screens; white surface, M3 pill indicator in primary tint for the active tab, labels always visible. Detail screens, auth screens and sheets have NO bottom navigation.
Page templates: AUTH_PAGE, TAB_PAGE, DETAIL_PAGE, SHEET (each screen prompt names one).

========================
8. UX PRINCIPLES
========================
- Simplicity: one primary action per screen; max 3 levels of hierarchy; remove decoration that has no purpose.
- Structure: header -> summary -> content -> actions; related info grouped in one card; section header with optional "Xem tất cả" on the right.
- Consistency: same components, same positions, same tokens on every screen.
- Feedback: ripple + pressed state on every tappable element; spinner inside buttons while working; Skeleton while lists load; Snackbar on success; pull-to-refresh on lists.
- Error prevention: inline validation; primary button disabled until form valid; ConfirmDialog for destructive actions; "Hoàn tác" in Snackbar for reversible actions; destructive buttons placed away from primary buttons; touch targets >= 48dp with >= 8dp gaps.
- Familiarity: standard Material 3 patterns only (top app bar, navigation bar, FAB-like camera button, chips, bottom sheets, dialogs, switches).
- Accessibility: WCAG AA contrast, never use color alone (always icon + text).
- Loading / Empty / Error / Offline states look identical across all screens.

========================
9. CONSISTENCY RULE
========================
NEVER:
- Change the primary color or add new brand colors.
- Change the font.
- Change border radius values (8 / 12 / 16 / 24 only).
- Change the icon style.
- Create a new component when an existing one can be reused.
- Move or restyle the app bar or the bottom navigation between screens.
- Use a layout that departs from the design system.
- Merge "Cảnh báo nguy cơ" (environmental forecast) and "Nhận diện từ ảnh" (AI photo detection) into one element — they always have separate type chips.
- Show fake numbers: when a system metric is unavailable, show "-" (a dash).
Every new screen must look like it belongs to the same application.

========================
10. REFERENCE INTERPRETATION
========================
If reference images are attached (rice-field login background, splash branding, IoT monitoring station photo, RiceGuardian logo):
- Keep the visual hierarchy and main layout structure of the reference.
- Keep important elements in the same positions.
- Do not copy irrelevant content or text from the reference.
- Translate the reference's visual language into this design system (tokens above win on conflict).
- All following screens must use the same visual language.

First output: confirm the system by generating a short "Style overview" screen (colors, type scale, one card, one button, the app bar and the bottom navigation).
```

**Ảnh tham chiếu có thể đính kèm vào Stitch** (nếu muốn giữ đúng visual hiện tại):

| Ảnh | Dùng cho |
|---|---|
| `app/img/login_background.jpg` | Nền màn Auth |
| `app/img/splash_branding.png` | Splash |
| `app/img/RICEGUARDIAN_AI_sharpened_transparent.png` / `app/img/logo_riceguardianai.png` | Logo |
| `app/img/monitoring_station.png` | Thẻ sản phẩm (Trang chủ, Sản phẩm) |
