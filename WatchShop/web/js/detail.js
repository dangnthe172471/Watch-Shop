//doi anh
{
    const thumbImages = document.querySelectorAll('.thumb-img');
    const mainImage = document.getElementById('main-image');
    thumbImages.forEach(img => {
        img.addEventListener('click', function () {
            // Đổi src của ảnh chính thành src của ảnh thumb được click
            mainImage.src = this.src;
        });
    });
}

/* global grecaptcha */

function deleteFeedback(event, id, pid) {
    event.preventDefault();
    if (confirm("Bạn có chắc muốn xóa feedback này ?")) {
        window.location = "feedback?type=delete&id=" + id + "&pid=" + pid;
    } else {
    }
}


function checkCaptcha() {
    var form = document.getElementById("feedback");
    var uncheck = document.getElementById("uncheck");
    const response = grecaptcha.getResponse();
    console.log(response);
    if (response) {
        form.submit();
    } else {
        uncheck.style.display = "";
    }
}


function hideWarning() {
    var uncheck = document.getElementById("uncheck");
    uncheck.style.display = "none";
}

function addCart(id) {
    var input = document.getElementById("numInput");
    var maxValue = parseInt(input.getAttribute("max"));
    var error = document.getElementById("errCart");
    if (maxValue <= 0) {
        error.style.display = '';
        return;
    } else {
        if (parseInt(input.value) > maxValue) {
            input.value = maxValue;
        }
        // Tạo box thông báo
        var notification = document.getElementById('notification');
        notification.style.display = 'block';
        notification.style.animation = 'slide 1.6s linear';

        setTimeout(function () {
            document.f.action = "buy?id=" + id;
            document.f.submit();
        }, 1500);
    }
}

function listVoted() {
    var x = document.getElementById("listVoted");
    if (x.style.display === "") {
        x.style.display = "none";
    } else {
        x.style.display = "";
    }
}