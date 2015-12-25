function checkForm() {
    email = document.getElementById("newsletter_email").value;
    if (email == "") {
        return false;
    }
    alert("Cảm ơn bạn đã đăng ký nhận tin mới!");
    return true;
}