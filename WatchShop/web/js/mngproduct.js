// Chờ cho tài liệu HTML (DOM) được tải hoàn toàn
document.addEventListener('DOMContentLoaded', function () {
    // Lấy danh sách các ảnh thumbnail
    const thumbImages = document.querySelectorAll('.thumb-img');

    // Lặp qua từng ảnh thumbnail để thêm sự kiện click
    thumbImages.forEach(img => {
        img.addEventListener('click', function () {
            // Lấy phần tử cha gần nhất chứa ảnh lớn của sản phẩm
            const khoianhDiv = this.closest('.khoianh');

            // Tìm phần tử ảnh lớn của sản phẩm trong phần tử cha
            const mainImage = khoianhDiv.querySelector('.product-image');

            // Lấy đường dẫn của ảnh thumbnail được click
            const newSrc = this.getAttribute('src');

            // Đổi src của ảnh lớn của sản phẩm thành đường dẫn của ảnh thumbnail được click
            mainImage.src = newSrc;
        });
    });
});

function checkNum(input) {
    var maxValue = parseInt(input.getAttribute("max"));
    if (input.value > maxValue) {
        input.value = maxValue;
    }
}