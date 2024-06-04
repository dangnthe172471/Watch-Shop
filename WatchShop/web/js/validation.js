/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function validatePassword() {
    var password = document.getElementById("password").value;
    var passwordMessageElement = document.getElementById("passwordMessage");
    
   
    if (password.length < 8) {
        passwordMessageElement.innerHTML = "Password must be at least 8 characters long.";
        passwordMessageElement.style.color = "red";
        return;
    }
    
  
    var hasUpperCase = /[A-Z]/.test(password);
    var hasLowerCase = /[a-z]/.test(password);
    var hasNumber = /\d/.test(password);
    var hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);
    
    if (!(hasUpperCase && hasLowerCase && hasNumber && hasSpecialChar)) {
        passwordMessageElement.innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.";
        passwordMessageElement.style.color = "red";
        return;
    }
    
   
    passwordMessageElement.innerHTML = "Password is strong.";
    passwordMessageElement.style.color = "green";
}


function validateEmail() {
    var email = document.getElementById("email").value;
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/;
    var emailMessageElement = document.getElementById("emailMessage");
    
    if (emailRegex.test(email)) {
        emailMessageElement.innerHTML = "Email is valid.";
        emailMessageElement.style.color = "green";
    } else {
        emailMessageElement.innerHTML = "Email is not valid.";
        emailMessageElement.style.color = "red";
    }
}

function validatePhoneNumber() {
    var phoneNumber = document.getElementById("phoneNumber").value;
    var phoneRegex = /^[0-9]{10,11}$/; 
    var phoneMessageElement = document.getElementById("phoneMessage");
    
    if (phoneRegex.test(phoneNumber)) {
        phoneMessageElement.innerHTML = "Phone number is valid.";
        phoneMessageElement.style.color = "green";
    } else {
        phoneMessageElement.innerHTML = "Phone number is not valid.";
        phoneMessageElement.style.color = "red";
    }
}

function checkEmpty() {
    var email = document.getElementById("email").value;
    var phoneNumber = document.getElementById("phoneNumber").value;
    var emptyMessageElement = document.getElementById("emptyMessage");
    
    if (email === "" || phoneNumber === "") {
        emptyMessageElement.innerHTML = "Fields cannot be empty.";
        emptyMessageElement.style.color = "red";
    } else {
        emptyMessageElement.innerHTML = "";
    }
}

function checkWhitespace() {
    var email = document.getElementById("email").value;
    var phoneNumber = document.getElementById("phoneNumber").value;
    var whitespaceMessageElement = document.getElementById("whitespaceMessage");
    
    if (/\s/.test(email) || /\s/.test(phoneNumber)) {
        whitespaceMessageElement.innerHTML = "Fields cannot contain spaces.";
        whitespaceMessageElement.style.color = "red";
    } else {
        whitespaceMessageElement.innerHTML = "";
    }
}

function validateForm() {
    validateEmail();
    validatePhoneNumber();
    checkEmpty();
    checkWhitespace();
    validatePassword();
}
