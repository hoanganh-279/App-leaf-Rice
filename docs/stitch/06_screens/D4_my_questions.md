# D4 — Câu hỏi của tôi (`/my-questions`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Câu hỏi của tôi (/my-questions)
Page template: DETAIL_PAGE

Purpose:
Track the questions I asked about articles and whether technicians answered.

Components (top to bottom):
1. RiceAppBar Detail variant.
2. FilterChips: 3 chips.
3. Vertical list of ListCards: caption article title (1 line, text-secondary), my question 2 lines body/600, StatusChip, caption date, chevron.

Content (Vietnamese UI text):
- App bar: "Câu hỏi của tôi"
- Chips: "Tất cả", "Chờ trả lời", "Đã trả lời"
- StatusChip: "Chờ trả lời" / "Đã trả lời"

Primary action:
none (list); in empty state "Xem bản tin"

Navigation:
- Card -> /my-questions/:id
- Empty state button -> /news

States:
- Loading: Skeleton rows.
- Empty: EmptyState forum icon "Bạn chưa hỏi bài nào." + OutlineButton "Xem bản tin".
- Offline: ErrorBanner "Cần kết nối mạng."

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
