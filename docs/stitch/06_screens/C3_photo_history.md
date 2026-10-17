# C3 — Lịch sử ảnh (`/photos`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Lịch sử ảnh (/photos)
Page template: DETAIL_PAGE

Purpose:
Review photos captured earlier and their AI results stored on the phone.

Components (top to bottom):
1. RiceAppBar Detail variant.
2. FilterChips (proposed).
3. Vertical list of ListCard: leading thumbnail 72 radius md, title = field name, DiseaseSummaryChip, caption date-time.
4. BottomSheet photo detail (on tap): large photo radius lg, DiseaseSummaryChip, field + time caption, DiseaseActionList, OutlineButton.

Content (Vietnamese UI text):
- App bar: "Lịch sử ảnh"
- Chips (proposed): "Tất cả", "Có bệnh", "Khỏe mạnh"
- Chips on cards: "Bạc lá · 78%" / "Khỏe mạnh" / "Chưa có kết quả"
- Sheet: "Các bước xử lý", button "Đóng"

Primary action:
none (list); in empty state "Chụp ảnh kiểm bệnh"

Navigation:
- Card -> photo detail BottomSheet
- Empty state button -> /camera

States:
- Loading: Skeleton rows.
- Empty: EmptyState photo_library icon "Chưa có ảnh nào. Hãy chụp và lưu trên máy." + OutlineButton "Chụp ảnh kiểm bệnh".

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
