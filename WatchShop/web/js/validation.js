function validateEmail() {
    var email = document.getElementById("email").value;
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/;
    var emailMessageElement = document.getElementById("emailMessage");

    if (emailRegex.test(email)) {
        emailMessageElement.innerHTML = "Email hợp lệ.";
        emailMessageElement.style.color = "green";
        checkEmailExist();  // Kiểm tra email tồn tại
    } else {
        emailMessageElement.innerHTML = "Email không đúng định dạng.";
        emailMessageElement.style.color = "red";
    }
}

function validateEmails() {
    var email = document.getElementById("newEmail").value;
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/;
    var emailMessageElement = document.getElementById("emailMessage");

    if (emailRegex.test(email)) {
        emailMessageElement.innerHTML = "Email hợp lệ.";
        emailMessageElement.style.color = "green";
    } else {
        emailMessageElement.innerHTML = "Email không đúng định dạng.";
        emailMessageElement.style.color = "red";
    }
}

function validatePhoneNumber() {
    var phoneNumber = document.getElementById("phoneNumber").value;
    var phoneRegex = /^[0-9]{10,11}$/; // Giả sử số điện thoại Việt Nam có 10 hoặc 11 chữ số
    var phoneMessageElement = document.getElementById("phoneMessage");

    if (phoneRegex.test(phoneNumber)) {
        phoneMessageElement.innerHTML = "Số điện thoại hợp lệ.";
        phoneMessageElement.style.color = "green";
    } else {
        phoneMessageElement.innerHTML = "Số điện thoại không đúng định dạng.";
        phoneMessageElement.style.color = "red";
    }
}

function validateUsername() {
    var username = document.getElementById("username").value;
    var usernameMessageElement = document.getElementById("usernameMessage");

    if (username.trim() === "") {
        usernameMessageElement.innerHTML = "Tên đăng nhập không được để trống.";
        usernameMessageElement.style.color = "red";
    } else if (/\s/.test(username)) {
        usernameMessageElement.innerHTML = "Tên đăng nhập không được chứa khoảng trắng.";
        usernameMessageElement.style.color = "red";
    } else {
        usernameMessageElement.innerHTML = "";
        checkUserExist();  // Kiểm tra tên đăng nhập tồn tại
    }
}

function validatePassword() {
    var password = document.getElementById("password").value;
    var passwordMessageElement = document.getElementById("passwordMessage");

    if (password.length < 8) {
        passwordMessageElement.innerHTML = "Mật khẩu phải có ít nhất 8 ký tự.";
        passwordMessageElement.style.color = "red";
    } else if (!/[A-Z]/.test(password)) {
        passwordMessageElement.innerHTML = "Mật khẩu phải có ít nhất một chữ cái viết hoa.";
        passwordMessageElement.style.color = "red";
    } else if (!/[a-z]/.test(password)) {
        passwordMessageElement.innerHTML = "Mật khẩu phải có ít nhất một chữ cái viết thường.";
        passwordMessageElement.style.color = "red";
    } else if (!/[0-9]/.test(password)) {
        passwordMessageElement.innerHTML = "Mật khẩu phải có ít nhất một số.";
        passwordMessageElement.style.color = "red";
    } else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
        passwordMessageElement.innerHTML = "Mật khẩu phải có ít nhất một ký tự đặc biệt.";
        passwordMessageElement.style.color = "red";
    } else {
        passwordMessageElement.innerHTML = "";
    }
}

function validateRepeatPassword() {
    var password = document.getElementById("password").value;
    var repeatPassword = document.getElementById("re_pass").value;
    var repeatPasswordMessageElement = document.getElementById("repeatPasswordMessage");

    if (password !== repeatPassword) {
        repeatPasswordMessageElement.innerHTML = "Mật khẩu xác nhận không đúng.";
        repeatPasswordMessageElement.style.color = "red";
    } else {
        repeatPasswordMessageElement.innerHTML = "";
    }
}

function validateAddress() {
    var address = document.getElementById("address").value;
    var addressMessageElement = document.getElementById("addressMessage");

    if (address.trim() === "") {
        addressMessageElement.innerHTML = "Địa chỉ nhận hàng có thể để trống.";
        addressMessageElement.style.color = "red";
    } else {
        addressMessageElement.innerHTML = "";
    }
}

function validateAddressStaff() {
    var address = document.getElementById("newaddress").value;
    var addressMessageElement = document.getElementById("naddressMessage");

    if (address.trim() === "") {
        addressMessageElement.innerHTML = "Phải nhập địa chỉ.";
        addressMessageElement.style.color = "red";
    } else {
        addressMessageElement.innerHTML = "";
    }
}

function checkWhitespace() {
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var phoneNumber = document.getElementById("phoneNumber").value;
    var password = document.getElementById("password").value;
    var repeatPassword = document.getElementById("re_pass").value;
    var address = document.getElementById("address").value;

    var whitespaceMessageElement = document.getElementById("whitespaceMessage");

    if (/\s/.test(username) || /\s/.test(email) || /\s/.test(phoneNumber) || /\s/.test(password) || /\s/.test(repeatPassword) || /\s/.test(address)) {
        whitespaceMessageElement.innerHTML = "Các trường không thể chứa dấu cách.";
        whitespaceMessageElement.style.color = "red";
    } else {
        whitespaceMessageElement.innerHTML = "";
    }
}

function validateFullName() {
    var username = document.getElementById("fullname").value;
    var usernameMessageElement = document.getElementById("fullnameMessage");

    if (username.trim() === "") {
        usernameMessageElement.innerHTML = "Tên nhận hàng không được để trống.";
        usernameMessageElement.style.color = "red";
    } else {
        usernameMessageElement.innerHTML = "";
    }
}

function onSubmitForm(event) {
    validateForm();
    var errorMessageElements = document.querySelectorAll('div[id$="Message"]');
    for (var i = 0; i < errorMessageElements.length; i++) {
        if (errorMessageElements[i].style.color === "red") {
            event.preventDefault();
            return false;
        }
    }
    return true;
}

function checkUserExist() {
    var username = document.getElementById("username").value;
    var usernameMessage = document.getElementById("usernameMessage");

    if (username.trim() === "") {
        usernameMessage.textContent = "Tên đăng nhập không được để trống.";
        usernameMessage.style.color = "red";
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "checkUserEmail?type=user&value=" + encodeURIComponent(username), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.exists) {
                usernameMessage.textContent = "Tên đăng nhập đã tồn tại.";
                usernameMessage.style.color = "red";
            } else {
                usernameMessage.textContent = "";
            }
        }
    };
    xhr.send();
}

function checkEmailExist() {
    var email = document.getElementById("email").value;
    var emailMessage = document.getElementById("emailMessage");

    if (email.trim() === "") {
        emailMessage.textContent = "Email không được để trống.";
        emailMessage.style.color = "red";
        return;
    }

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        emailMessage.textContent = "Email không hợp lệ.";
        emailMessage.style.color = "red";
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "checkUserEmail?type=email&value=" + encodeURIComponent(email), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.exists) {
                emailMessage.textContent = "Email đã tồn tại.";
                emailMessage.style.color = "red";
            } else {
                emailMessage.textContent = "";
            }
        }
    };
    xhr.send();
}
