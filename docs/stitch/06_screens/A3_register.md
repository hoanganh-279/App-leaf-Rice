# A3 — Đăng ký (`/register`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Đăng nhập" (same background and frosted card).

Screen name: Đăng ký (/register)
Page template: AUTH_PAGE (Transparent RiceAppBar with white back arrow)

Purpose:
Create a farmer account.

Components (top to bottom):
1. Same rice-field photo background as "Đăng nhập".
2. Frosted card:
   a. heading-2 title + body-sm subtitle
   b. ErrorBanner slot
   c. RiceTextField full name (icon person)
   d. RiceTextField phone (icon phone)
   e. RiceTextField email (icon mail)
   f. PasswordField password
   g. PasswordField confirm
   h. PrimaryButton
3. TextButton below the card.

Content (Vietnamese UI text):
- Title: "Đăng ký"; subtitle: "Tạo tài khoản nông dân để sử dụng ứng dụng"
- Fields: "Họ và tên", "Số điện thoại", "Email", "Mật khẩu", "Xác nhận mật khẩu"
- Button: "Đăng ký"
- Link: "Đã có tài khoản? Đăng nhập"

Primary action:
"Đăng ký"

Navigation:
- Back arrow / "Đã có tài khoản? Đăng nhập" -> /login
- Success -> Trang chủ (/home)

States:
- Inline errors: "Nhập họ tên", "Nhập số điện thoại", "Nhập email", "Email không hợp lệ", "Nhập mật khẩu", "Mật khẩu xác nhận không khớp".
- PrimaryButton disabled until valid; loading spinner while submitting.
- Error: ErrorBanner with server message.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
