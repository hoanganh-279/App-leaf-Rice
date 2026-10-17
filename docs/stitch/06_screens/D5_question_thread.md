# D5 — Chuỗi hỏi đáp (`/my-questions/:id`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Câu hỏi (/my-questions/:id)
Page template: DETAIL_PAGE

Purpose:
Read my question and the technician's answer.

Components (top to bottom):
1. RiceAppBar Detail variant.
2. Compact ListCard linking to the article (thumbnail + title + chevron).
3. ChatBubble right (farmer) with label caption and time.
4. ChatBubble left (technician) with AvatarInitials "KTV", label caption and time.
5. Waiting state: InfoBanner in secondary tint with schedule icon instead of the answer bubble.

Content (Vietnamese UI text):
- App bar: "Câu hỏi"
- Farmer label: "Câu hỏi của bạn"
- Technician label (proposed): "Kỹ thuật viên"
- Waiting: "Đang chờ trả lời"

Primary action:
none

Navigation:
- Article card -> /news/:id

States:
- Loading: Skeleton bubbles.
- Waiting: banner "Đang chờ trả lời".
- Not found: EmptyState "Không tìm thấy câu hỏi."
- Offline: ErrorBanner "Cần kết nối mạng."

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
