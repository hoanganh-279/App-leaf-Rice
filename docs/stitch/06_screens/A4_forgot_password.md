# A4 — Quên mật khẩu (`/forgot-password`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Đăng nhập" (same background and frosted card).

Screen name: Quên mật khẩu (/forgot-password)
Page template: AUTH_PAGE (Transparent RiceAppBar with white back arrow)

Purpose:
Request a password reset code.

Components (top to bottom):
1. Same rice-field photo background.
2. Frosted card:
   a. lock_reset icon 32 in a 64 primary-tint circle
   b. heading-2 title + body-sm subtitle
   c. RiceTextField (icon person)
   d. PrimaryButton
   e. TextButton
3. InfoBanner (success state) / ErrorBanner (error state) inside the card above the button.

Content (Vietnamese UI text):
- Title: "Quên mật khẩu"; subtitle: "Nhập email hoặc số điện thoại đã đăng ký"
- Field: "Email hoặc số điện thoại"
- Button: "Gửi yêu cầu"
- Link: "Tôi đã có mã đặt lại"
- Success: "Nếu tài khoản tồn tại, mã đặt lại đã được tạo."

Primary action:
"Gửi yêu cầu"

Navigation:
- Back arrow -> /login
- "Tôi đã có mã đặt lại" -> /reset-password

States:
- Inline error: "Nhập email hoặc số điện thoại".
- Loading: spinner in PrimaryButton.
- Success: InfoBanner with the success text.
- Error: ErrorBanner.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
