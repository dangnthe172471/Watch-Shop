/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validateCategoryName() {
    var categoryName = $("#cname").val();
    if (categoryName.trim() === '') {
        $("#categoryNameError").text("Vui lòng nhập dòng sản phẩm.");
    } else if (categoryName.trim().length < 3) {
        $("#categoryNameError").text("Dòng sản phẩm phải chứa nhiều hơn 3 kí tự.");
    } else {
        $("#categoryNameError").text("");
    }
}

function checkWhitespace() {
    var cname = document.getElementById("cname").value;

    var whitespaceMessageElement = document.getElementById("whitespaceMessage");

    if (/^\s/.test(cname)) {
        whitespaceMessageElement.innerHTML = "Trường không thể bắt đầu bằng dấu cách.";
        whitespaceMessageElement.style.color = "red";
    } else {
        whitespaceMessageElement.innerHTML = "";
    }
}

function submitAddCategoryForm() {
    validateCategoryName();
    checkWhitespace();

    if ($("#categoryNameError").text() || $("#whitespaceMessage").text()) {
        return;
    } else {
        $("#addCategoryForm").submit();
    }
}

$(document).ready(function () {
    $("#cname").blur(validateCategoryName);

    $('.addbtn').on('click', function () {
        $('#addmodal').modal('show');
    });

    $('.editbtn').on('click', function () {
        $('#editmodal').modal('show');
        $tr = $(this).closest('tr');
        var data = $tr.children("td").map(function () {
            return $(this).text();
        }).get();
        $('#update_id').val(data[0].trim());
        $('#update_name').val(data[1].trim());
        $('#update_type').val(data[2].trim());
    });

    $('.deletebtn').on('click', function () {
        var cid = $(this).data('id');
        if (confirm('Bạn có muốn xóa thể loại này ?')) {
            window.location = 'deletecategory?cid=' + cid;
        }
    });

    $('#search-btn').on('click', function (e) {
        e.preventDefault();
        searchCategories();
    });

    $('#search-text').on('keyup', function () {
        searchCategories();
    });
});

function searchCategories() {
    var searchText = $("#search-text").val().toLowerCase();
    var rows = document.querySelectorAll("tbody tr");
    rows.forEach(row => {
        var categoryName = row.children[1].textContent.toLowerCase();
        if (categoryName.includes(searchText)) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}
