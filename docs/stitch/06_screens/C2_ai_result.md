# C2 — Kết quả nhận diện (`/camera/preview`)

```text
Apply the full RiceGuardian MASTER UI PROMPT, DESIGN TOKENS, COMPONENT LIBRARY, LAYOUT RULES and UX RULES.
Reference screen for style: "Trang chủ".

Screen name: Kết quả nhận diện (/camera/preview)
Page template: DETAIL_PAGE (pinned bottom action with 2 buttons)

Purpose:
Show what the on-device AI found and what to do; save the result on the phone or retake.

Components (top to bottom):
1. RiceAppBar Detail variant.
2. DetectionImage: captured rice-leaf photo with bounding boxes and label tags.
3. RiceCard result header: status line heading-2 with icon (error color when diseased), DiseaseSummaryChip, AlertTypeChip "Nhận diện từ ảnh", caption field + time.
4. RiceCard "Độ tin cậy" with ScoreBars (top 3).
5. RiceCard "Biết thêm về bệnh": 2-3 line summary + DiseaseActionList.
6. Pinned bottom: PrimaryButton + OutlineButton stacked, TextButton below.

Content (Vietnamese UI text):
- App bar: "Kết quả nhận diện"
- Status: "Phát hiện: Đạo ôn lá"; chip "Đạo ôn lá · 87%"
- ScoreBars: "Đạo ôn lá 87%", "Đốm nâu 8%", "Cháy lá 3%" (sample)
- Action list title: "Các bước xử lý" (4 steps)
- Buttons: "Lưu trên máy", "Chụp lại"; link "Về trang chủ"
- Saved tile: "Đã lưu trên máy"
- Possible disease names: Bạc lá, Đốm nâu, Khỏe mạnh, Hispa, Đạo ôn lá, Cháy lá, Than lá, Đốm nâu hẹp, Đạo ôn cổ bông

Primary action:
"Lưu trên máy"

Navigation:
- Back / "Chụp lại" -> /camera
- "Về trang chủ" -> /home

States:
- Healthy: status "Cây trông khỏe mạnh" in primary with check icon; DiseaseSummaryChip "Khỏe mạnh"; no action list.
- Uncertain: status "Chưa nhận diện rõ vùng bệnh" in text-secondary with help icon; tip "Thử chụp gần hơn, đủ sáng, tập trung vào vết bệnh trên lá."; primary action becomes "Chụp lại".
- Saving: PrimaryButton loading.
- Saved: InfoBanner with check "Đã lưu trên máy" replaces the save button.
- Saved but not synced: InfoBanner "Đã lưu trên máy nhưng chưa đồng bộ server. Kéo làm mới thông báo để thử lại."

Requirements:
Keep the design system. Do not create new colors, fonts, radius, icon styles, button or card styles. No bottom navigation.
```
