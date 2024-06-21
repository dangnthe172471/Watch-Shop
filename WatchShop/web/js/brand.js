/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/* global modalOpen, error */

// Function to submit Add Brand Form with validation
function submitAddBrandForm() {
    validateBrandName();
    validateBrandImage();
    validateBrandDescription();

    if ($("#brandNameError").text() || $("#brandImageError").text() || $("#brandDescriptionError").text()) {
        return;
    } else {
        $("#addBrandForm").submit();
    }
}

$(document).ready(function () {
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
                    $('#update_image').val(data[2].trim());
                    $('#update_description').val(data[3].trim());
                });

                $('.deletebtn').on('click', function () {
                    var bid = $(this).data('id');
                    if (confirm('Bạn có muốn xóa Thương Hiệu này ?')) {
                        window.location = 'deletebrand?bid=' + bid;
                    }
                });

                $('#search-btn').on('click', function (e) {
                    e.preventDefault();
                    searchBrands();
                });

                $('#search-text').on('keyup', function () {
                    searchBrands();
                });

                $("#bname").blur(validateBrandName);
                $("#bimage").blur(validateBrandImage);
                $("#bdescription").blur(validateBrandDescription);
            });

            function submitAddBrandForm() {
                validateBrandName();
                validateBrandImage();
                validateBrandDescription();

                if ($("#brandNameError").text() || $("#brandImageError").text() || $("#brandDescriptionError").text()) {
                    return;
                } else {
                    $("#addBrandForm").submit();
                }
            }

            function validateBrandName() {
                var brandName = $("#bname").val();
                if (brandName.trim() === '') {
                    $("#brandNameError").text("Vui lòng nhập tên thương hiệu.");
                } else if (brandName.trim().length < 3) {
                    $("#brandNameError").text("Tên thương hiệu phải chứa nhiều hơn 3 kí tự.");
                } else {
                    $("#brandNameError").text("");
                }
            }

            function validateBrandImage() {
                var brandImage = $("#bimage").val();
                if (brandImage.trim() === '') {
                    $("#brandImageError").text("Vui lòng nhập URL ảnh.");
                } else if (!brandImage.match(/^.*\.(jpg|jpeg|png|webp)$/i)) {
                    $("#brandImageError").text("Ảnh phải theo định dạng .jpg, .jpeg, .png hoặc .webp");
                } else {
                    $("#brandImageError").text("");
                }
            }

            function validateBrandDescription() {
                var brandDescription = $("#bdescription").val();
                if (brandDescription.trim() === '') {
                    $("#brandDescriptionError").text("Vui lòng nhập miêu tả.");
                } else {
                    $("#brandDescriptionError").text("");
                }
            }

            function searchBrands() {
                var searchText = $("#search-text").val().toLowerCase();
                var rows = document.querySelectorAll("tbody tr");
                rows.forEach(row => {
                    var brandName = row.children[1].textContent.toLowerCase();
                    if (brandName.includes(searchText)) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            }
            function checkWhitespace() {
                var bname = document.getElementById("bname").value;
                var image = document.getElementById("bimage").value;
                var description = document.getElementById("bdescription").value;

                var whitespaceMessageElement = document.getElementById("whitespaceMessage");

                if (/^\s/.test(bname) || /^\s/.test(image) || /^\s/.test(description)) {
                    whitespaceMessageElement.innerHTML = "Không thể bắt đầu bằng dấu cách.";
                    whitespaceMessageElement.style.color = "red";
                } else {
                    whitespaceMessageElement.innerHTML = "";
                }
            }