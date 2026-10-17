# B2 — Ruộng của tôi (`/fields`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Ruộng của tôi (/fields)
Page template: TAB_PAGE (active tab: "Ruộng")

Purpose:
Browse the fields assigned to the farmer, tell them apart at a glance, spot which field needs attention, open a field.

Components (top to bottom):
1. RiceAppBar Tab variant.
2. OfflineBanner (only when offline).
3. Summary strip RiceCard: 2 KPI cells divided by a thin border — "Số thửa" (real count) | "Tổng diện tích" ("- ha"). kpi-value in primary, label caption text-secondary.
4. Section header "Danh sách thửa" (heading-3) + caption on the right "Mùa vụ: <season>" when every field shares the same season.
5. Vertical list of FieldCard (pull-to-refresh), gap md, each:
   - Leading thumbnail 72 radius md: aerial UAV photo; fallback primary-tint tile with small grass icon + short code from the name (e.g. "P1", "K8").
   - Title body 15/600, max 2 lines.
   - Meta row (caption, text-secondary, small icons): eco + variety · square_foot + "- ha". Never start a line with a dash.
   - Status line: field has alerts -> risk badge (icon + text) + "N cảnh báo"; else check_circle primary "Ổn định".
   - Season chip (primary-tint) only when the field's season differs from the header season.
   - Trailing chevron; whole card is the tap target.

Content (Vietnamese UI text):
- App bar: "Ruộng của tôi"
- Summary: "Số thửa" "4" · "Tổng diện tích" "- ha"
- Header: "Danh sách thửa" · "Mùa vụ: Hè Thu 2026"
- Cards (sample): "Thửa P1 — giồng cát" (OM 5451), "Thửa P3 — bờ tây" (Đài Thơm 8), "Thửa kênh 8 — đầu bờ" (OM 18), "Thửa bưng — cuối kênh" (IR 50404)

Primary action:
none (view-only list; tapping a card is the main interaction)

Navigation:
- Field card -> /fields/:id

States:
- First load: skeleton summary strip + 3 skeleton cards (no full-screen spinner).
- Refresh: RefreshIndicator in primary.
- Empty: EmptyState map icon "Chưa có thửa ruộng" / "Liên hệ HTX để được gán ruộng."
- Offline: OfflineBanner "Đang xem dữ liệu đã lưu".

Data notes:
- Alerts are matched to a field by fieldName (alerts carry no field id).
- Area is a system metric and always renders "-".

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No map, no create/edit/delete field.
```
