# 07 — CONSISTENCY CHECK

> Chạy sau **mỗi** màn hình được sinh. Đạt hết thì sinh màn tiếp theo; lệch thì dùng **Repair prompt**.

## Checklist theo 7 phần

### 1. Product Context
- [ ] Toàn bộ chữ trên UI là tiếng Việt có dấu, đúng câu chữ trong file màn hình.
- [ ] Không có tính năng/nội dung lạ ngoài file màn hình (không tự thêm search, giỏ hàng, chat...).

### 2. Design System (tokens)
- [ ] Màu chỉ thuộc token: `#2E7D32`, `#F9A825`, `#C62828`, `#F5F5F5`, `#FFFFFF`, `#1B1B1B`, `#616161`, `#9E9E9E`, `#E0E0E0` (+ tint 8–12%). Màn Auth thêm sky/field.
- [ ] Font Be Vietnam Pro; cỡ chữ thuộc thang 24 / 20 / 18 / 15 / 14 / 13 / 12; button 16/600.
- [ ] Radius chỉ 8 / 12 / 16 / 24 / full.
- [ ] Spacing thuộc thang 4 / 8 / 12 / 16 / 20 / 24 / 32; padding ngang 16.
- [ ] Icon Material Symbols Rounded, outlined/filled đúng quy ước, không trộn bộ khác.

### 3. Component Library
- [ ] Mọi phần tử là component có tên trong [03_COMPONENT_LIBRARY.md](03_COMPONENT_LIBRARY.md); không có button/card/chip kiểu mới.
- [ ] Button cao 52, input ≥ 48, card radius 16 padding 16.

### 4. Layout Rules
- [ ] Đúng page template ghi trong prompt (AUTH_PAGE / TAB_PAGE / DETAIL_PAGE / SHEET).
- [ ] `RiceAppBar` giống hệt "Trang chủ": nền primary, tiêu đề trắng 18/600 **căn giữa**.
- [ ] `RiceBottomNav` chỉ có trên 5 tab, đúng thứ tự "Trang chủ | Ruộng | Chụp ảnh | Cảnh báo | Cá nhân", tab đúng đang active, nút Chụp ảnh tròn xanh, không viền.
- [ ] Thanh menu khớp [03a_BOTTOM_NAV.md](03a_BOTTOM_NAV.md): nhãn luôn hiện 12sp, tab đang chọn có pill xanh nhạt (không nhảy lên, không mất nhãn), nền trắng có viền trên `#E0E0E0`. Lệch → dùng Repair prompt trong 03a.
- [ ] Màn DETAIL có nút Back trái và **không** có bottom nav.

### 5. UX Rules
- [ ] Đúng **1** PrimaryButton trên màn (hoặc trên sheet).
- [ ] Có đủ trạng thái liệt kê trong prompt: Loading (Skeleton/spinner trong nút), Empty (EmptyState), Error (ErrorBanner + "Thử lại"), Offline nếu có.
- [ ] Form: lỗi inline dưới ô, nút chính disabled khi chưa hợp lệ.
- [ ] Hành động nguy hiểm có ConfirmDialog; nút nguy hiểm tách xa nút chính.
- [ ] Vùng chạm ≥ 48dp, cách nhau ≥ 8dp; không trạng thái nào chỉ dùng màu.

### 6. Screen Specification
- [ ] Đủ các component theo thứ tự trong file màn hình.
- [ ] Navigation thể hiện đúng (nút/thẻ tồn tại cho từng đích).
- [ ] Mục `(proposed)` được thể hiện nhưng không lấn át nội dung gốc.

### 7. Consistency Rules (nghiệp vụ)
- [ ] "Cảnh báo nguy cơ" và "Nhận diện từ ảnh" luôn có `AlertTypeChip` riêng, không gộp.
- [ ] Số liệu hệ thống hiển thị `-`, không số giả (trừ dữ liệu mẫu như tên thửa, % độ tin cậy AI).
- [ ] Mức rủi ro dùng đúng nhãn "Nguy cơ cao" / "Trung bình" / "Ổn định" kèm icon.

## Repair prompt

Dán khi một màn bị lệch (thay `<...>` bằng điểm lệch cụ thể nếu biết):

```text
This screen drifted from the RiceGuardian design system. Without changing the content or the layout structure, restore:
- Tokens: colors, typography scale, radius (8/12/16/24), spacing (4-based) exactly as in DESIGN TOKENS.
- RiceAppBar and RiceBottomNav exactly as on the "Trang chủ" screen (centered white 18/600 title on #2E7D32; bottom nav only on the 5 tab screens).
- Components from the COMPONENT LIBRARY only (PrimaryButton 52dp radius 12, RiceCard radius 16 padding 16, FilterChips radius 8).
- Exactly one PrimaryButton on the screen.
Specific issues to fix: <e.g. "card radius is 20", "title is left-aligned", "new purple accent color">.
```

## Repair prompt — trạng thái thiếu

```text
Add the missing states for this screen using only library components, in the same layout: Loading (Skeleton matching the cards), Empty (EmptyState with the given Vietnamese message), Error (ErrorBanner + "Thử lại"). Show them as separate variants of this screen.
```
