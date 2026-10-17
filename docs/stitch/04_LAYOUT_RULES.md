# 04 — LAYOUT RULES

> Mỗi prompt màn hình chỉ cần ghi `Page template: <TÊN>`; Stitch áp dụng đúng khung bên dưới. Có thể dán khối này ngay sau Component Prompt (khuyến nghị) để Stitch ghi nhớ 4 khuôn trang.

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS and COMPONENT LIBRARY.

LAYOUT RULES — every screen uses exactly one of these 4 page templates.

GLOBAL
- Frame 360 x 800 dp. Respect status bar (24) and gesture bar safe areas.
- Horizontal page padding 16. Content max one column (no multi-column except KpiCard row and SensorTile 2x2 grid).
- Vertical rhythm: SectionHeader -> 8 -> first card; card gap 12; section gap 24; last item has 24 bottom padding above nav or pinned action.
- SectionHeader = heading-3 title left + optional TextButton "Xem tất cả" right.
- Lists scroll vertically; horizontal scroll only for FilterChips and the news carousel.
- Long lists use pull-to-refresh with a primary spinner.

TEMPLATE 1 — AUTH_PAGE (Splash, Đăng nhập, Đăng ký, Quên mật khẩu, Đặt lại mật khẩu)
- Full-bleed rice-field photo background with top dark-to-transparent gradient (text readability). Splash uses the sky-to-field gradient instead.
- No RiceAppBar (Transparent variant with white back arrow allowed on secondary auth pages). No RiceBottomNav.
- Top: logo 72 + "RiceGuardian AI" heading-1 white + tagline.
- Frosted card (radius xl 24, padding 20, frosted-card token) holding the form; PrimaryButton is the last element in the card.
- Below card: secondary links (TextButton) centered. Keyboard pushes card up; card scrolls.

TEMPLATE 2 — TAB_PAGE (Trang chủ, Ruộng, Chụp ảnh, Cảnh báo, Cá nhân)
- RiceAppBar Tab variant (centered title, no back arrow).
- Scrollable content on background #F5F5F5 with pull-to-refresh.
- RiceBottomNav fixed at the bottom with the matching tab active. Nothing is ever placed below the nav.
- Snackbars appear above the nav.

TEMPLATE 3 — DETAIL_PAGE (Chi tiết ruộng, Kết quả nhận diện, Lịch sử ảnh, Thông báo, Cài đặt, Bản tin, Chi tiết bài, Sản phẩm, Câu hỏi của tôi, Chuỗi hỏi đáp)
- RiceAppBar Detail variant (back arrow left, centered title).
- NO RiceBottomNav.
- Optional pinned bottom action area: white surface, top border #E0E0E0, padding 16, one PrimaryButton (optionally + one OutlineButton stacked, 12 gap).
- Hero media (if any) directly under the app bar, inside page padding, radius lg 16.

TEMPLATE 4 — SHEET (Đổi mật khẩu, Ghi nhật ký canh tác, Đặt câu hỏi, chi tiết ảnh) and DIALOG (Xác nhận đăng xuất)
- Shown over the parent screen dimmed by scrim.
- BottomSheet: drag handle, heading-2 title, 16 padding, content, PrimaryButton at bottom, keyboard-aware; max height 90%.
- ConfirmDialog: centered, width 312, radius xl 24.

Remember these 4 templates by name: AUTH_PAGE, TAB_PAGE, DETAIL_PAGE, SHEET.
```

## Sơ đồ khuôn trang

```text
AUTH_PAGE            TAB_PAGE             DETAIL_PAGE          SHEET
┌──────────┐         ┌──────────┐         ┌──────────┐         ┌──────────┐
│  photo   │         │ AppBar   │         │← AppBar  │         │ (dimmed) │
│  logo    │         │──────────│         │──────────│         │          │
│┌────────┐│         │ content  │         │ hero     │         │┌── ─ ───┐│
││ form   ││         │ scroll   │         │ content  │         ││ title  ││
││[Button]││         │          │         │          │         ││ fields ││
│└────────┘│         │──────────│         │──────────│         ││[Button]││
│  links   │         │ BottomNav│         │[Pinned]  │         │└────────┘│
└──────────┘         └──────────┘         └──────────┘         └──────────┘
```

| Route | Template |
|---|---|
| `/splash`, `/login`, `/register`, `/forgot-password`, `/reset-password` | AUTH_PAGE |
| `/home`, `/fields`, `/camera`, `/alerts`, `/profile` | TAB_PAGE |
| `/fields/:id`, `/camera/preview`, `/photos`, `/notifications`, `/settings`, `/news`, `/news/:id`, `/product`, `/my-questions`, `/my-questions/:id` | DETAIL_PAGE |
| Đổi mật khẩu, Ghi nhật ký, Đặt câu hỏi, Xác nhận đăng xuất | SHEET / DIALOG |
