function submitAddBlogForm() {
    validateTitle();
    validateImage();
    validateDate();
    validateDescription();

    if ($("#titleError").text() || $("#imageError").text() || $("#dateError").text() || $("#descriptionError").text()) {
        return;
    } else {

        $("#addBlogForm").submit();

    }

}

$(document).ready(function () {

    $("#title").blur(validateTitle);

    $("#image").blur(validateImage);

    $("#date").blur(validateDate);

    $("#description").blur(validateDescription);

});




function validateTitle() {

    var title = $("#title").val();

    if (title.trim() === '') {

        $("#titleError").text("Vui lòng nhập tên.");

    } else if (title.trim().length < 5) {

        $("#titleError").text("Tên phải chứa nhiều hơn 5 kí tự.");

    } else {

        $("#titleError").text("");

    }

}




function validateImage() {

    var image = $("#image").val();

    if (image.trim() === '') {

        $("#imageError").text("Vui lòng nhập URL ảnh.");

    } else if (!image.match(/^.*\.(jpg|jpeg|png|webp)$/i)) {

        $("#imageError").text("Ảnh phải theo định dạng .jpg, .jpeg, .png hoặc .webp");

    } else {

        $("#imageError").text("");

    }

}




function validateDate() {

    var date = $("#date").val();

    if (date.trim() === '') {

        $("#dateError").text("Vui lòng chọn thời gian.");

    } else {

        $("#dateError").text("");

    }

}




function validateDescription() {

    var description = $("#description").val();

    if (description.trim() === '') {

        $("#descriptionError").text("Vui lòng nhập nội dung.");

    } else {

        $("#descriptionError").text("");

    }

}




function submitEditBlogForm(blogId) {

    var selectedStatus = $("#statusSelect" + blogId).val();

    $("#status" + blogId).val(selectedStatus);

    $("#editBlogForm" + blogId).submit();

}

function removeBlog(id) {

    $('#confirmDeleteModal').modal('show');

    $('#confirmDeleteButton').on('click', function () {

        $.ajax({

            type: "GET",

            url: 'editblog?action=delete&id=' + id,

            success: function (data) {

                $('#confirmDeleteModal').modal('hide');

                location.reload();

            },

            error: function (data) {

                console.log("Error occurred while deleting blog.");

            }

        });

    });

}