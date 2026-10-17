# E3 — Xác nhận đăng xuất (DIALOG, mở từ Cá nhân) — (proposed)

> App hiện tại đăng xuất ngay khi bấm; dialog này là đề xuất phòng lỗi (Error Prevention).

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Xác nhận đăng xuất (dialog over "Cá nhân")
Page template: SHEET (dialog variant)

Purpose:
Prevent accidental logout.

Components:
1. "Cá nhân" screen dimmed by scrim behind.
2. ConfirmDialog: logout icon in error-tint circle, heading-2 title, body text, actions TextButton (left) + DestructiveButton (right).

Content (Vietnamese UI text) (proposed):
- Title: "Đăng xuất?"
- Body: "Bạn sẽ cần đăng nhập lại để tiếp tục sử dụng ứng dụng. Dữ liệu đã lưu trên máy vẫn được giữ."
- Actions: "Hủy", "Đăng xuất"

Primary action:
"Đăng xuất" (destructive)

Navigation:
- "Hủy" -> close dialog
- "Đăng xuất" -> /login

States:
- Loading: spinner in DestructiveButton.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
