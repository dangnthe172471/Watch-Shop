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

