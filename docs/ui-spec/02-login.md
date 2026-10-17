# Login — F1 Cánh đồng lúa (ảnh nền)

## Wireframe
```
┌─────────────────────────────┐
│  [Ảnh ruộng login_background]│
│      [Logo]                 │
│   RiceGuardian AI           │
│   "Chăm ruộng thông minh"   │
│  ┌─ Frosted card ─────────┐ │
│  │ Đăng nhập              │ │
│  │ Error banner           │ │
│  │ SĐT / Mật khẩu         │ │
│  │ Remember | Quên MK?    │ │
│  │ [Đăng nhập]            │ │
│  └────────────────────────┘ │
│  Hoặc đăng nhập với [G]     │
│  Chưa có TK? Đăng ký ngay   │
└─────────────────────────────┘
```

## Routes
- `/login`, `/register`, `/forgot-password`, `/reset-password`

## States
- Loading: spinner on primary button / Google disabled
- Error: RiceErrorBanner from AuthProvider.error
- Remember me off: session chỉ trong memory (không ghi SharedPreferences)

## Copy
- Tagline: Chăm ruộng thông minh
- CTA: Đăng nhập
- Social: Google only (no Facebook)
- Demo hint (offline): Tài khoản demo: 0901234567 / Demo@123

## Assets
- `img/login_background.jpg`
- Logo: `img/logo_riceguardianai.png`

## Backend
- `POST /api/auth/register`
- `POST /api/auth/google`
- `POST /api/auth/forgot-password`
- `POST /api/auth/reset-password`
