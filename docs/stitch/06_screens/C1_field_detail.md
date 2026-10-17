# C1 — Chi tiết thửa ruộng (`/fields/:id`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Chi tiết thửa ruộng (/fields/:id)
Page template: DETAIL_PAGE (pinned bottom action)

Purpose:
Understand one field: cover image, key facts, current status, sensors, recent photos; log a farming activity.

Components (top to bottom):
1. RiceAppBar Detail variant, title = field name.
2. Hero image 16:9 radius lg: aerial UAV photo with optional semi-transparent error-colored mask over blight areas and a small pill legend.
3. Quick facts row: 3 tiles (radius md, surface, border, icon + label + value) — Giống lúa · Mùa vụ · Diện tích. Optional caption "Diện tích bệnh BLB: -" when BLB data exists.
4. RiceCard "Tình trạng": highest risk badge (icon + text) + "N cảnh báo", latest alert title + summary, TextButton "Xem cảnh báo". Empty: check_circle "Chưa có cảnh báo".
5. RiceCard "Cảm biến IoT": SensorTile 2-column grid + OfflineBanner + caption + hints.
6. RiceCard "Ảnh gần đây": SectionHeader with "Xem tất cả", up to 4 square thumbnails radius md of photos for this field. Empty: caption + outlined button "Chụp ảnh".
7. Pinned bottom area: PrimaryButton with agriculture icon.

Content (Vietnamese UI text):
- Title: "Thửa P1 — giồng cát" (sample)
- Legend pill: "BLB: -%"
- Facts: "Giống lúa" "OM 5451", "Mùa vụ" "Hè Thu 2026", "Diện tích" "- ha"
- Status empty: "Chưa có cảnh báo"
- Sensors: nhiệt độ (°C), độ ẩm không khí (%), mực nước (cm), ánh sáng (lux), độ ẩm đất (%) — all values "-"
- Offline: "Chế độ offline: dữ liệu cảm biến IoT không khả dụng trên máy này."
- Caption: "Cần kết nối mạng để xem cảm biến"
- Photos empty: "Chưa có ảnh chụp cho thửa này" + "Chụp ảnh"
- Button: "Ghi nhật ký canh tác"

Primary action:
"Ghi nhật ký canh tác"

Navigation:
- Back -> previous screen
- "Xem cảnh báo" -> /alerts (tab)
- "Xem tất cả" -> /photos
- "Chụp ảnh" -> /camera (tab)
- "Ghi nhật ký canh tác" -> SHEET E2

States:
- No cover: placeholder on primary-tint with image icon "Chưa có ảnh thửa (UAV/upload)".
- Sensors loading: skeleton block.
- Not found: EmptyState "Không tìm thấy thửa ruộng".

Data notes:
- Alerts matched by fieldName; photos matched by fieldId.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation, no map.
```
