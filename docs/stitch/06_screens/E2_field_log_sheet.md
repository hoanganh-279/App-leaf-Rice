# E2 — Ghi nhật ký canh tác (SHEET, mở từ Chi tiết thửa)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Ghi nhật ký canh tác (bottom sheet over "Chi tiết thửa ruộng")
Page template: SHEET

Purpose:
Quickly record a farming activity for this field (saved on the phone).

Components (top to bottom):
1. Field detail screen dimmed by scrim behind.
2. BottomSheet: drag handle, heading-2 title.
3. Label + ChoiceChipGroup with 3 options and icons (proposed — current app uses RiceDropdown).
4. MultilineField with notes icon.
5. ErrorBanner slot.
6. PrimaryButton.

Content (Vietnamese UI text):
- Title: "Ghi nhật ký canh tác"
- Label: "Loại hoạt động"
- Options: "Bón phân" (compost), "Phun thuốc" (sanitizer / spray), "Tưới nước" (water_drop)
- Field: "Ghi chú (tùy chọn)"
- Button: "Lưu"
- Success Snackbar: "Đã ghi nhật ký canh tác"

Primary action:
"Lưu"

Navigation:
- Success or swipe down -> back to /fields/:id

States:
- Loading: spinner in PrimaryButton.
- Error: ErrorBanner.

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles.
```
