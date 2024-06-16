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
    if (maxValue <= 0 || parseInt(input.value) > maxValue) {
        error.style.display = '';
        return;
    } else {
        if (parseInt(input.value) > maxValue) {
            input.value = maxValue;
        }
        // Tạo box thông báo
        var notification = document.getElementById('notification');
        notification.style.display = 'block';
        notification.style.animation = 'slide 1.1s linear';

        setTimeout(function () {
            document.f.action = "buy?id=" + id;
            document.f.submit();
        }, 1000);
    }
}

function listVoted() {
    var y = document.getElementById("icon");

    if (y.classList.contains("fa-toggle-left")) {
        y.classList.remove("fa-toggle-left");
        y.classList.add("fa-toggle-down");
    } else {
        y.classList.remove("fa-toggle-down");
        y.classList.add("fa-toggle-left");
    }

    var x = document.getElementById("listVoted");
    if (x.style.display === "") {
        x.style.display = "none";
    } else {
        x.style.display = "";
    }
}