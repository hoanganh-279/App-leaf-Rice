# D1 — Bản tin (`/news`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Bản tin (/news)
Page template: DETAIL_PAGE

Purpose:
Browse published farmer articles by category and open one.

Components (top to bottom):
1. RiceAppBar Detail variant, action IconButton forum.
2. FilterChips by category.
3. First article as FeaturedCard (cover 16:9, category caption, title heading-3 2 lines, date caption).
4. List of compact ListCards: thumbnail 88 radius md left, category caption, title 2 lines body/600, date caption.

Content (Vietnamese UI text):
- App bar: "Bản tin"; forum tooltip "Câu hỏi của tôi"
- Chips: "Tất cả" + categories from data (sample: "Kỹ thuật canh tác", "Sâu bệnh", "Thị trường")

Primary action:
none (list)

Navigation:
- Article -> /news/:id
- Forum icon -> /my-questions

States:
- Loading: Skeleton (one FeaturedCard + 3 ListCards).
- Empty: EmptyState newspaper icon "Chưa có bản tin."
- Offline: EmptyState wifi_off "Cần kết nối mạng để xem bản tin." + OutlineButton "Thử lại".

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
