function checkForm() {
    name = document.getElementById("contact_name").value;
    phone = document.getElementById("contact_phone").value;
    message = document.getElementById("contact_message").value;
    if (name == "") {
        return false;
    } else if (phone == "") {
        return false;
    } else if (message == "") {
        return false;
    }
    alert("Cảm ơn bạn đã gửi tin nhắn liên hệ!");
    return true;
}