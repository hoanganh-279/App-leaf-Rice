# A5 — Đặt lại mật khẩu (`/reset-password`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Đăng nhập" (same background and frosted card).

Screen name: Đặt lại mật khẩu (/reset-password)
Page template: AUTH_PAGE (Transparent RiceAppBar with white back arrow)

Purpose:
Enter the reset code and a new password.

Components (top to bottom):
1. Same rice-field photo background.
2. Frosted card:
   a. heading-2 title
   b. ErrorBanner slot
   c. RiceTextField code (icon key)
   d. PasswordField new password
   e. PasswordField confirm
   f. PrimaryButton

Content (Vietnamese UI text):
- Title: "Đặt lại mật khẩu"
- Fields: "Mã đặt lại", "Mật khẩu mới", "Xác nhận mật khẩu"
- Button: "Đặt lại mật khẩu"
- Success Snackbar: "Đặt lại mật khẩu thành công. Hãy đăng nhập."

Primary action:
"Đặt lại mật khẩu"

Navigation:
- Back arrow -> previous screen
- Success -> /login

States:
- Inline errors: "Nhập mã đặt lại", "Nhập mật khẩu mới", "Mật khẩu xác nhận không khớp".
- Loading: spinner in PrimaryButton.
- Error: ErrorBanner (invalid or expired code).

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
