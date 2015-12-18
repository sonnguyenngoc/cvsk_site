function checkForm() {
    name = document.getElementById("contact_name").value;
    email = document.getElementById("contact_email").value;
    phone = document.getElementById("contact_phone").value;
    message = document.getElementById("contact_message").value;
    if (name == "") {
        return false;
    } else if (phone == "") {
        return false;
    } else if (message == "") {
        return false;
    }
    if (!checkEmail(email)) {
        return false;
    }
    return true;
}

function checkEmail(inputvalue) {
    var pattern = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
    return pattern.test(inputvalue);
}