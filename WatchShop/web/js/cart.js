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
