# A1 — Splash (`/splash`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.

Screen name: Splash (/splash)
Page template: AUTH_PAGE (splash variant: sky-to-field gradient instead of photo, no card)

Purpose:
Brand moment for 1-2 seconds while the app checks the saved session.

Components (top to bottom):
1. Full-bleed vertical gradient sky-top -> sky-mid, gentle rice-field waves at the bottom in field-green and field-deep.
2. App logo (green rice-leaf shield) 120dp, centered.
3. Wordmark heading-1 in primary, letter-spacing 1.
4. Tagline body in text-secondary.
5. Spinner (primary) near the bottom.

Content (Vietnamese UI text):
- Wordmark: "RICEGUARDIAN AI"
- Tagline: "Chăm ruộng thông minh"

Primary action:
none

Navigation:
- Session valid -> Trang chủ (/home)
- No session -> Đăng nhập (/login)

States:
- Loading only (spinner).

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No app bar, no bottom navigation.
```
