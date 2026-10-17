# D2 — Chi tiết bài viết (`/news/:id`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Chi tiết bài viết (/news/:id)
Page template: DETAIL_PAGE (pinned bottom action)

Purpose:
Read an article comfortably and ask a question about it.

Components (top to bottom):
1. RiceAppBar Detail variant, action IconButton forum.
2. Cover image 16:9 radius lg.
3. Category chip (primary-tint), title heading-1, caption date.
4. Body text: body 15 line-height 1.6, paragraphs and heading-3 subheadings.
5. SectionHeader + ExpansionRow list inside a RiceCard for public Q&A.
6. Pinned bottom: PrimaryButton with forum icon.
7. BottomSheet "ask a question" (opened by the button): heading-2 title, MultilineField with hint, helper text and counter, TextButton "Hủy" + PrimaryButton "Gửi câu hỏi" (disabled until >= 10 characters).

Content (Vietnamese UI text):
- App bar: "Bản tin"; forum tooltip "Câu hỏi của tôi"
- Q&A section: "Câu hỏi thường gặp"
- Button: "Đặt câu hỏi về bài này"
- Sheet title: "Đặt câu hỏi về bài viết"
- Hint: "Bạn muốn hỏi gì về nội dung bài này?"
- Helper: "Kỹ thuật viên sẽ trả lời và thông báo trên App"
- Sheet buttons: "Hủy", "Gửi câu hỏi"

Primary action:
"Đặt câu hỏi về bài này"

Navigation:
- Forum icon -> /my-questions
- Button -> ask BottomSheet

States:
- Validation: Snackbar "Câu hỏi cần ít nhất 10 ký tự."
- Sent: Snackbar "Đã gửi câu hỏi. Chúng tôi sẽ thông báo khi có trả lời."
- Loading: Skeleton (cover + text lines).
- Not found: EmptyState "Không tìm thấy bài viết."
- Offline: EmptyState wifi_off "Cần kết nối mạng để đọc bản tin."

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
