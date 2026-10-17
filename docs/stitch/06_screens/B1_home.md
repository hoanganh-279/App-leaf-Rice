# B1 — Trang chủ (`/home`) — MÀN THAM CHIẾU

> Sinh màn này **đầu tiên trong nhóm B** và chỉnh đến khi ưng ý. Mọi màn sau dùng *"Reference screen for style: Trang chủ"*.

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
This screen becomes the REFERENCE SCREEN for style of the whole app.

Screen name: Trang chủ (/home)
Page template: TAB_PAGE (active tab: "Trang chủ")

Purpose:
At a glance: greeting, my numbers, the main action (photo disease check), my fields, latest alerts, newsletter and product.

Components (top to bottom):
1. RiceAppBar Tab variant, action: IconButton bell with small secondary badge.
2. Greeting row: AvatarInitials 52 + caption + name heading-2.
3. SectionHeader + row of 3 KpiCard.
4. PrimaryButton with camera icon.
5. SectionHeader with "Xem tất cả" + up to 3 ListCard (leading round field thumbnail or grass icon).
6. SectionHeader with "Xem tất cả" + 2 alert ListCards: title + RiskBadge, AlertTypeChip, field name + summary (2 lines). Show one "Nhận diện từ ảnh" card and one "Cảnh báo nguy cơ" card (the environment one adds the hint caption).
7. SectionHeader with "Xem tất cả" + horizontal carousel of FeaturedCard 240 wide (cover 100 high).
8. SectionHeader + one FeaturedCard for the IoT monitoring station, ending with a TextButton link with chevron.
9. OutlineButton with photo_library icon.

Content (Vietnamese UI text):
- App bar: "Trang chủ"; badge value "-"
- Greeting: "Xin chào," + "Nguyễn Văn An" (initials "NA")
- "Thống kê của bạn": KpiCard grass/primary "-" "Thửa"; bell/secondary "-" "Chưa đọc"; warning/error "-" "Cảnh báo"
- Button: "Chụp ảnh kiểm bệnh"
- "Thửa của tôi": e.g. "Thửa A1 - Cánh đồng Đông", subtitle "- · OM5451"
- "Cảnh báo mới nhất": e.g. "Phát hiện: Đạo ôn lá" (RiskBadge "Nguy cơ cao", chip "Nhận diện từ ảnh"); "Nguy cơ cao — độ ẩm vượt ngưỡng" (chip "Cảnh báo nguy cơ", hint "Dự báo — điều kiện môi trường bất thường, chưa chắc đã có bệnh")
- "Bản tin mới nhất": category caption + 2-line title
- "Sản phẩm RiceGuardian": "Trạm giám sát RiceGuardian AI", "Trạm IoT cấp nguồn mặt trời, đo vi khí hậu phục vụ cảnh báo sớm bệnh lúa trên App.", link "Xem chi tiết"
- Bottom button: "Lịch sử ảnh đã chụp"

Primary action:
"Chụp ảnh kiểm bệnh"

Navigation:
- Bell / KpiCard "Chưa đọc" -> /notifications
- KpiCard "Cảnh báo" / alert cards / "Xem tất cả" alerts -> /alerts
- "Chụp ảnh kiểm bệnh" -> /camera
- Field card -> /fields/:id; "Xem tất cả" fields -> /fields
- Article card -> /news/:id; "Xem tất cả" news -> /news
- Product card -> /product
- "Lịch sử ảnh đã chụp" -> /photos

States:
- Loading: Skeleton for KPI row, field cards, alert cards, carousel.
- Empty: fields -> EmptyState "Chưa có thửa được gán."; alerts -> EmptyState eco icon "Chưa có cảnh báo mới. Ruộng đang ổn!"; news -> EmptyState "Chưa có bản tin."
- Offline news: EmptyState wifi_off "Cần kết nối mạng để xem bản tin."
- Error: ErrorBanner + "Thử lại".

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```

> Ghi chú: trong code hiện tại thứ tự là Bản tin → Sản phẩm → Thống kê → nút chụp → Thửa → Cảnh báo. Thứ tự trên đưa hành động chính lên trước **(proposed)**.
