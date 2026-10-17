# 06 — SCREEN PROMPT TEMPLATE

> Dùng để viết prompt cho màn hình mới. Không chép lại design system — chỉ tham chiếu.
> Chỉ dùng component có trong [03_COMPONENT_LIBRARY.md](../03_COMPONENT_LIBRARY.md) và một template trong [04_LAYOUT_RULES.md](../04_LAYOUT_RULES.md).

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: <tên tiếng Việt> (<route>)
Page template: AUTH_PAGE | TAB_PAGE (active tab: ...) | DETAIL_PAGE | SHEET

Purpose:
<1-2 câu: người dùng làm gì ở đây>

Components (from library only, top to bottom):
1. ...
2. ...

Content (Vietnamese UI text):
- ...

Primary action:
<PrimaryButton label> (or "none — changes apply inline")

Navigation:
- <element> -> <route / sheet / dialog>

States:
- Loading: ...
- Empty: ...
- Error: ...
- <screen-specific>: ...

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. Same RiceAppBar / RiceBottomNav as "Trang chủ".
```

**Quy ước:**
- Ghi `(proposed)` sau mục là đề xuất UI mới chưa có trong app hiện tại — dev cần bổ sung logic trước khi đưa vào Flutter.
- Câu chữ tiếng Việt lấy từ `app/lib/screens/**`; nếu tự viết mới thì đánh dấu `(proposed)`.
- Mỗi lần dán 1 file màn hình; sau đó chạy [07_CONSISTENCY_CHECK.md](../07_CONSISTENCY_CHECK.md).
