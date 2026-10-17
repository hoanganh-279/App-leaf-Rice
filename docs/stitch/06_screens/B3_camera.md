# B3 — Chụp ảnh nhận diện bệnh (`/camera`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Chụp ảnh nhận diện bệnh (/camera)
Page template: TAB_PAGE (active tab: center "Chụp ảnh")

Purpose:
Choose a field, frame a rice leaf, capture or pick from the gallery. AI runs on the phone (works offline).

Components (top to bottom):
1. RiceAppBar Tab variant (leading home IconButton allowed).
2. RiceDropdown with grass icon.
3. CaptureViewport (square, full width minus padding) showing a close-up rice leaf.
4. Caption hint centered.
5. Row of 3 TipChip (proposed) with icons light_mode, zoom_in, center_focus_strong.
6. PrimaryButton with camera icon.
7. OutlineButton with photo_library icon.

Content (Vietnamese UI text):
- App bar: "Chụp ảnh nhận diện bệnh"
- Dropdown: "Chọn thửa ruộng" (selected "Thửa A1 - Cánh đồng Đông")
- Hint: "Chụp hoặc tải ảnh cận cảnh lá lúa có biểu hiện bệnh"
- Tips (proposed): "Đủ sáng", "Chụp gần", "Lá rõ nét"
- Buttons: "Chụp và nhận diện", "Tải ảnh từ thư viện"

Primary action:
"Chụp và nhận diện"

Navigation:
- Capture or gallery pick -> AI processing -> /camera/preview
- Leading home icon -> /home

States:
- Opening camera: Spinner + caption "Đang mở camera..."
- Processing: CaptureViewport scrim + spinner + "Đang xử lý AI..."; PrimaryButton label "Đang xử lý AI..." in loading state; OutlineButton disabled.
- No field: EmptyState "Chưa có thửa ruộng được gán." and both buttons disabled.
- Camera error: ErrorBanner "Không tìm thấy camera." (gallery button stays enabled).

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
