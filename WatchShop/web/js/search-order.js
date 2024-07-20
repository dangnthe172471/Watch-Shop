/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    $('#search-customer, #search-sdt, #search-address').on('keyup', function () {
        searchOrders();
    });
});

function searchOrders() {
    var searchCustomer = $("#search-customer").val().toLowerCase();
    var searchSDT = $("#search-sdt").val().toLowerCase();
    var searchAddress = $("#search-address").val().toLowerCase();

    var rows = document.querySelectorAll("tbody tr");
    rows.forEach(row => {
        var customerName = row.children[1].textContent.toLowerCase();
        var phone = row.children[2].textContent.toLowerCase();
        var address = row.children[3].textContent.toLowerCase();

        var matchCustomer = customerName.includes(searchCustomer);
        var matchSDT = phone.includes(searchSDT);
        var matchAddress = address.includes(searchAddress);

        if (matchCustomer && matchSDT && matchAddress) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}