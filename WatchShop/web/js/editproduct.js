document.addEventListener("DOMContentLoaded", function () {
    const price = document.getElementById("price");
    function formatCurrencyInput(inputElement) {
        function formatValue(value) {
            value = value.replace(/[^0-9]/g, "");
            return value === "" ? "" : parseInt(value).toLocaleString("vi-VN");
        }

        inputElement.addEventListener("input", function (e) {
            e.target.value = formatValue(e.target.value);
        });
        // Initial formatting on page load
        inputElement.value = formatValue(inputElement.value);
    }

    formatCurrencyInput(price);
});


function previewImage(event, imgNumber) {
    var input = event.target;
    var imgId = 'imgpreview' + imgNumber;
    var imgPreview = document.getElementById(imgId);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            imgPreview.src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
    }
}

function validateCode() {
    var username = document.getElementById("code").value;
    var usernameMessageElement = document.getElementById("codeMessage");
    if (username.startsWith(" ")) {
        usernameMessageElement.innerHTML = "Mã sản phẩm sai định dạng.";
        usernameMessageElement.style.color = "red";
    } else　if (username.trim() === "") {
        usernameMessageElement.innerHTML = "Mã sản phẩm không được để trống.";
        usernameMessageElement.style.color = "red";
    } else {
        usernameMessageElement.innerHTML = "";
    }
}

function validateName() {
    var username = document.getElementById("name").value;
    var usernameMessageElement = document.getElementById("nameMessage");
    if (username.startsWith(" ")) {
        usernameMessageElement.innerHTML = "Tên sản phẩm sai định dạng.";
        usernameMessageElement.style.color = "red";
    } else　if (username.trim() === "") {
        usernameMessageElement.innerHTML = "Tên sản phẩm không được để trống.";
        usernameMessageElement.style.color = "red";
    } else {
        usernameMessageElement.innerHTML = "";
    }
}