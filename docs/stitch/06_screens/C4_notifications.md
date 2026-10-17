# C4 — Thông báo (`/notifications`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Thông báo (/notifications)
Page template: DETAIL_PAGE

Purpose:
Read notifications; unread ones stand out; tap to read details.

Components (top to bottom):
1. RiceAppBar Detail variant, action IconButton done_all (proposed).
2. Date group captions (proposed).
3. Vertical list of compact ListCards: leading 40 round icon by type — alert (warning, error-tint), treatment (healing, primary-tint), info (info, background), article reply (forum, secondary-tint); title body/600 when unread; 2-line body-sm; caption time; unread dot primary on the right; unread rows on primary-tint background.
4. InfoDialog (on tap): title, body, DiseaseActionList for treatment notifications, TextButton "Đóng".

Content (Vietnamese UI text):
- App bar: "Thông báo"
- Groups (proposed): "Hôm nay", "Trước đó"
- Dialog: "Các bước xử lý", "Đóng"
- Snackbar (proposed): "Đã đánh dấu tất cả là đã đọc" + action "Hoàn tác"

Primary action:
none

Navigation:
- Article reply notification -> /my-questions/:id
- Other notifications -> detail dialog

States:
- Loading: Skeleton rows.
- Empty: EmptyState notifications icon "Chưa có thông báo."
- Error: ErrorBanner + "Thử lại".

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
