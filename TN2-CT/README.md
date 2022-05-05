# Giải thích thuật toán chụp cắt lớp

![Sơ đồ thuật toán](https://i.imgur.com/KruSrIX.png)

## Radon Transform

## Filterd BackProjection (FBP) - ô số 3 của thuật toán

---

### BackProjection

![Backprojection](https://i.imgur.com/itOtHB9.png)

Khi lấy 180 góc thì các ảnh này hoàn toàn không được sắc nét cho lắm vì

- Nhìn lại đồ thị Fourier $g(t)$ ở trên, những đỉnh là nơi có tầng số cao và nó được biểu thì tương tự với đồ thị nằm dưới $g(t)$ (2 màu xanh và cam):

![frequency](https://i.imgur.com/sv81es3.png)

- Quay lại vấn đề vật bị mờ là bởi vì trong quá trình xử lý ảnh thì tầng số thấp quyết định độ smooth của vật và tầng số cao quyết định độ sắc nét. Bởi vì hình 180 góc đó tầng số cao chưa được hiện thị nên nó không có sắc nét.

Bằng cách để làm rõ nét hơn vật, người ta mới cần tới Filterd (bộ lọc)

### Filterd (CHƯA HIỂU)

## [Fourier Transform](https://www.youtube.com/watch?v=spUNpyF58BY)

> Tại sao cần biết Fourier Transform?

Fourier Transform (FT) nói nôm na dễ hiểu là từ một nguồn sóng cho ban đầu, FT có thể chuyển nó về các dạng sóng đơn.

Dễ hiểu là vầy, "sóng ban đầu" là kết hợp của nhiều sóng đơn kết hợp lại với nhau. Nhưng làm sao có thể tách từ "sóng ban đầu" đó thành các sóng đơn. Từ đó FT ra đời.

### VÍ DỤ

Xem ảnh dưới đây:

![Fourier Transform](https://i.imgur.com/JB9ht9o.png)

Hãy nhìn vào độ thị trên cùng, nó là "sóng ban đầu" = tổng của 2 sóng D294 và A440. Nhiệm vụ của Fourier Transform là tách từ sóng ban đầu đó ra thành 2 sóng D294 và A440.

![Almost Fourier Transform](https://i.imgur.com/Gds8pzO.png)

Fourier Transform fomular:
$$\dot{g}(t)=\int_{t1}^{t2} g(t) e^{-2\pi ift} dt$$

- $g(t)$ là hàm theo mật độ và tần số (màu xanh lá cây)
- $\dot{g}(t)$ là hàm số ảo chỉ lấy phần thật (màu cam, chấm tròn màu cảm của đồ thị tròn.)
- Còn đồ thị màu xanh nước biển là phần ảo của đồ thị $\dot{g}(t)$

![g(t) \dot{g}(t)](https://i.imgur.com/J6h9xA5.png)

