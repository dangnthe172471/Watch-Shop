// Get today's date in YYYY-MM-DD format
const today = new Date();
today.setDate(today.getDate() + 2);  // Add one day

const day = today.toISOString().split('T')[0];  // Format date to YYYY-MM-DD
document.getElementById('dateShip').setAttribute('min', day);

function changNum(id) {
    var input = document.getElementById("numProduct");
    var maxValue = parseInt(input.getAttribute("max"));
    var error = document.getElementById("errNum");
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
        }, 1490);
    }
}

function checkNum(input) {
    var maxValue = parseInt(input.getAttribute("max"));
    if (input.value > maxValue) {
        input.value = maxValue;
    }
}
function validateEmail() {
    var email = document.getElementById("email").value;
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/;
    var emailMessageElement = document.getElementById("emailMessage");

    if (emailRegex.test(email)) {
        emailMessageElement.innerHTML = "";
    } else {
        emailMessageElement.innerHTML = "Email không đúng định dạng.";
        emailMessageElement.style.color = "red";
    }
}

function validatePhoneNumber() {
    var phoneNumber = document.getElementById("phoneNumber").value;
    var phoneRegex = /^[0-9]{10,11}$/; // Giả sử số điện thoại Việt Nam có 10 hoặc 11 chữ số
    var phoneMessageElement = document.getElementById("phoneMessage");

    if (phoneRegex.test(phoneNumber) && phoneNumber.startsWith("0")) {
        phoneMessageElement.innerHTML = "";
    } else {
        phoneMessageElement.innerHTML = "Số điện thoại không đúng định dạng.";
        phoneMessageElement.style.color = "red";
    }
}

function validateAddress() {
    var address = document.getElementById("address").value;
    var addressMessageElement = document.getElementById("addressMessage");

    if (address.startsWith(" ")) {
        addressMessageElement.innerHTML = "Địa chỉ sai định dạng.";
        addressMessageElement.style.color = "red";
    } else if (address.trim() === "") {
        addressMessageElement.innerHTML = "Địa chỉ nhận hàng không được để trống.";
        addressMessageElement.style.color = "red";
    } else {
        addressMessageElement.innerHTML = "";
    }
}

function validateFullName() {
    var username = document.getElementById("fullname").value;
    var usernameMessageElement = document.getElementById("fullnameMessage");

    if (username.startsWith(" ")) {
        usernameMessageElement.innerHTML = "Tên nhận hàng sai định dạng.";
        usernameMessageElement.style.color = "red";
    } else if (username.trim() === "") {
        usernameMessageElement.innerHTML = "Tên nhận hàng không được để trống.";
        usernameMessageElement.style.color = "red";
    } else {
        usernameMessageElement.innerHTML = "";
    }
}
