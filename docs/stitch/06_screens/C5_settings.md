# C5 — Cài đặt (`/settings`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Cài đặt (/settings)
Page template: DETAIL_PAGE

Purpose:
Simple inline settings; changes apply immediately.

Components (top to bottom):
1. RiceAppBar Detail variant.
2. SectionHeader + RiceCard with one row: icon + title + subtitle + Switch.
3. SectionHeader + RiceCard with InfoBanner-style text (no toggle).
4. SectionHeader + RiceCard with InfoRows (proposed).

Content (Vietnamese UI text):
- App bar: "Cài đặt"
- "Thông báo": "Bật thông báo" / "Nhận cảnh báo bệnh trên máy này"
- "Ngôn ngữ": "Ngôn ngữ hiện chỉ hỗ trợ Tiếng Việt. Tuỳ chọn đa ngôn ngữ sẽ có ở bản sau."
- "Về ứng dụng" (proposed): "RiceGuardian AI", "Phiên bản" "-"

Primary action:
none — changes apply inline

Navigation:
- Back -> /profile

States:
- Switch toggled: brief Snackbar confirmation (proposed).

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
