# 01 — PRODUCT CONTEXT

> Tài liệu tham khảo cho người viết/chỉnh prompt. Phần cần dán đã được tóm gọn trong mục 1 của [00_MASTER_PROMPT.md](00_MASTER_PROMPT.md).
> Nguồn: [`app/README.md`](../../README.md).

## App là gì

**RiceGuardian AI** là nền tảng AI dự báo sớm bệnh hại và quản lý canh tác lúa. App di động (Flutter, native Android) **chỉ dành cho Nông dân**.

## Người dùng

| Đặc điểm | Hệ quả thiết kế |
|---|---|
| Nông dân, không rành công nghệ | Mỗi màn 1 hành động chính, chữ to, icon có nhãn |
| Dùng ngoài đồng, nắng gắt | Tương phản cao (WCAG AA), nền sáng, tránh chữ xám nhạt |
| Tay có thể ướt/bẩn | Vùng chạm ≥ 48dp, nút chính 52dp, khoảng cách ≥ 8dp |
| Hay mất mạng | Offline-first: dữ liệu lưu trên máy, OfflineBanner rõ ràng |

Kỹ thuật viên nông nghiệp **không dùng app**; họ trả lời câu hỏi bản tin từ website quản trị.

## Việc chính (F1–F13)

| ID | Chức năng | Cấp UX | Màn |
|---|---|---|---|
| F1 | Đăng nhập (SĐT + mật khẩu, Google) | Dedicated | A2–A5 |
| F2 | Dashboard tổng quan | Chỉ xem | B1 |
| F3 | Danh sách ruộng | Chỉ xem | B2, C1 |
| F4 | Chụp ảnh & nhận diện bệnh on-device | Dedicated | B3, C2 |
| F5 | Lịch sử ảnh | Chỉ xem | C3 |
| F6 | Cảnh báo | Chỉ xem | B4 |
| F7 | Cảm biến IoT (offline: không khả dụng) | Chỉ xem | C1 |
| F8 | Ghi nhật ký canh tác | Modal (sheet) | E2 |
| F9 | Trung tâm thông báo | Chỉ xem + Inline | C4 |
| F10 | Hồ sơ cá nhân, đổi mật khẩu | Inline + Modal | B5, E1, E3 |
| F11 | Cài đặt | Inline | C5 |
| F12 | Bản tin nông dân | Dedicated + list | D1, D2, D3 |
| F13 | Hỏi đáp bản tin | Modal + Dedicated | D2, D4, D5 |

## Quy tắc nghiệp vụ ảnh hưởng UI

1. **Hai loại cảnh báo — không trộn trong cùng một phần tử UI:**

   | Loại | Nhãn | Nguồn | Ví dụ |
   |---|---|---|---|
   | Cảnh báo nguy cơ | "Cảnh báo nguy cơ" | Môi trường bất thường / dự báo | "Nguy cơ cao — độ ẩm vượt ngưỡng" |
   | Kết quả nhận diện | "Nhận diện từ ảnh" | Ảnh + AI on-device (đã có biểu hiện) | "Phát hiện: Đạo ôn lá — 87% tin cậy" |

   Gợi ý phụ: nguy cơ = "Dự báo — điều kiện môi trường bất thường, chưa chắc đã có bệnh"; ảnh = "Đã có biểu hiện — AI nhận diện trên ảnh App nông dân hoặc UAV".
2. **Số liệu hệ thống chưa có → hiển thị `-`** (KPI, diện tích, cảm biến, badge số). Không dùng 0 hay số giả.
3. **AI chạy trên máy**, không cần mạng. Kết quả: bệnh + độ tin cậy, hoặc "Khỏe mạnh", hoặc "không chắc chắn".
4. **9 nhãn bệnh:** Bạc lá, Đốm nâu, Khỏe mạnh, Hispa, Đạo ôn lá, Cháy lá, Than lá, Đốm nâu hẹp, Đạo ôn cổ bông.
5. **Mức rủi ro:** "Nguy cơ cao" / "Trung bình" / "Ổn định".
6. **Bản tin & hỏi đáp** cần mạng; offline hiển thị empty state "Cần kết nối mạng…".
