# B5 — Cá nhân (`/profile`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Cá nhân (/profile)
Page template: TAB_PAGE (active tab: "Cá nhân")

Purpose:
View and edit personal info, open settings and my questions, log out.

Components (top to bottom):
1. RiceAppBar Tab variant, right action TextButton (white).
2. RiceCard header: AvatarInitials 80, name heading-2, role chip (primary-tint).
3. RiceCard "Thông tin" with InfoRows (icon + label + value).
4. RiceCard menu with ListCard-style rows (icon + label + chevron).
5. DestructiveOutlineButton with logout icon, 24 below the menu.

Content (Vietnamese UI text):
- App bar: "Cá nhân"; action "Sửa"
- Header: "Nguyễn Văn An", chip "Nông dân"
- Info rows: "Họ tên", "Số điện thoại", "Email"
- Menu: "Câu hỏi bản tin của tôi" (forum), "Đổi mật khẩu" (lock), "Cài đặt App" (settings)
- Button: "Đăng xuất"
- Snackbar: "Đã cập nhật hồ sơ"

Primary action:
none in view mode; "Lưu" in edit mode

Navigation:
- "Câu hỏi bản tin của tôi" -> /my-questions
- "Đổi mật khẩu" -> SHEET E1
- "Cài đặt App" -> /settings
- "Đăng xuất" -> DIALOG E3 (proposed) -> /login

States:
- Edit mode (inline): "Thông tin" card becomes RiceTextFields "Họ tên", "Số điện thoại" + TextButton "Hủy" and PrimaryButton "Lưu" (loading while saving); success Snackbar "Đã cập nhật hồ sơ".
- Error: ErrorBanner inside the card.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
