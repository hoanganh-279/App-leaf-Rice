# E1 — Đổi mật khẩu (SHEET, mở từ Cá nhân)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Đổi mật khẩu (bottom sheet over "Cá nhân")
Page template: SHEET

Purpose:
Change the account password without leaving the profile.

Components (top to bottom):
1. "Cá nhân" screen dimmed by scrim behind.
2. BottomSheet: drag handle, heading-2 title.
3. PasswordField x3.
4. ErrorBanner slot.
5. PrimaryButton (keyboard-aware).

Content (Vietnamese UI text):
- Title: "Đổi mật khẩu"
- Fields: "Mật khẩu cũ", "Mật khẩu mới", "Xác nhận"
- Button: "Lưu"
- Success Snackbar: "Đã đổi mật khẩu"

Primary action:
"Lưu"

Navigation:
- Success or swipe down -> back to /profile

States:
- Inline error: "Mật khẩu xác nhận không khớp".
- PrimaryButton disabled until valid; loading spinner while saving.
- Error: ErrorBanner.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
