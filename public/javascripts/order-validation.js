function checkForm() {
    many_people = document.getElementById(order_many_people).value;
    order_date = document.getElementById(order_order_date).value;
    customer_name = document.getElementById(order_customer_name).value;
    message = document.getElementById(order_message).value;
    if (many_people == "") {
        return false;
    } else if (order_date == "") {
        return false;
    } else if (customer_name == "") {
        return false;
    } else if (message == "") {
        return false;
    }
    return true;
}