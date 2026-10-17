# A2 — Đăng nhập (`/login`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.

Screen name: Đăng nhập (/login)
Page template: AUTH_PAGE

Purpose:
Farmer signs in with phone number and password (or Google).

Components (top to bottom):
1. Rice-field photo background with top dark gradient.
2. Logo 72 + wordmark heading-1 white + tagline white 85%.
3. Frosted card containing:
   a. heading-2 title + body-sm subtitle
   b. ErrorBanner slot (hidden by default)
   c. RiceTextField phone (icon phone, numeric keyboard)
   d. PasswordField (icon lock, eye toggle)
   e. Row: Checkbox + label (left), TextButton (right)
   f. PrimaryButton
4. Divider text caption.
5. GoogleButton (Google only, no Facebook).
6. InfoBanner (small) with demo account hint.
7. Bottom row: body text + TextButton.

Content (Vietnamese UI text):
- Wordmark: "RiceGuardian AI"; tagline: "Chăm ruộng thông minh"
- Title: "Đăng nhập"; subtitle: "Đăng nhập để tiếp tục sử dụng ứng dụng"
- Fields: "Số điện thoại", "Mật khẩu" (eye tooltip "Hiện mật khẩu")
- Checkbox: "Ghi nhớ đăng nhập"; link: "Quên mật khẩu?"
- Button: "Đăng nhập"
- Divider: "Hoặc đăng nhập với"
- Demo hint: "Tài khoản demo: 0901234567 / Demo@123"
- Bottom: "Chưa có tài khoản? " + "Đăng ký ngay"

Primary action:
"Đăng nhập"

Navigation:
- "Đăng nhập" / Google success -> Trang chủ (/home)
- "Quên mật khẩu?" -> /forgot-password
- "Đăng ký ngay" -> /register

States:
- Default: PrimaryButton disabled until both fields are filled.
- Inline errors: "Nhập số điện thoại", "Nhập mật khẩu".
- Loading: spinner in PrimaryButton, GoogleButton disabled.
- Error: ErrorBanner at top of card with server message.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
