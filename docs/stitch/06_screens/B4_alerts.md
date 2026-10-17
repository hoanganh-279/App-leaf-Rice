# B4 — Cảnh báo (`/alerts`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Cảnh báo (/alerts)
Page template: TAB_PAGE (active tab: "Cảnh báo")

Purpose:
See all alerts for my fields, clearly separating environmental risk forecasts from AI photo detections.

Components (top to bottom):
1. RiceAppBar Tab variant.
2. FilterChips: 3 chips.
3. Caption explaining the selected type (only when a type chip is selected).
4. Vertical list of alert ListCards (pull-to-refresh), each:
   - leading 40 round icon container (environment: sensors icon on secondary-tint; image: photo_camera icon on primary-tint)
   - row: AlertTypeChip + RiskBadge
   - title body/600
   - field name + summary 2 lines body-sm secondary, caption time
   - image alerts only: DiseaseSummaryChip + TextButton
5. BottomSheet for the disease guide (opened by "Xem hướng dẫn"): disease name heading-2, DiseaseSummaryChip, short summary, DiseaseActionList.

Content (Vietnamese UI text):
- App bar: "Cảnh báo"
- Chips: "Tất cả", "Cảnh báo nguy cơ", "Nhận diện từ ảnh"
- Caption environment: "Dự báo — điều kiện môi trường bất thường, chưa chắc đã có bệnh"
- Caption image: "Đã có biểu hiện — AI nhận diện trên ảnh App nông dân hoặc UAV"
- Image example: "Phát hiện: Bạc lá", RiskBadge "Trung bình", link "Xem hướng dẫn"
- Environment example: "Nguy cơ cao — độ ẩm vượt ngưỡng", RiskBadge "Nguy cơ cao"
- Guide sheet: "Các bước xử lý"

Primary action:
none (list); "Xem hướng dẫn" opens the guide sheet

Navigation:
- "Xem hướng dẫn" -> guide BottomSheet

States:
- Loading: Skeleton cards.
- Empty: EmptyState eco icon "Chưa có cảnh báo. Ruộng đang ổn!"
- No guide: Snackbar "Chưa có hướng dẫn cho bệnh này."
- Error: ErrorBanner + "Thử lại".

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. Never merge the two alert types into one chip or card style.
```
