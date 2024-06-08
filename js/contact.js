function validateForm2() {
    var name = document.getElementById("myName").value.trim();
    var email = document.getElementById("myEmail").value.trim();
    var message = document.getElementById("myMessage").value.trim();

    let isValid = true;

    // Reset error messages
    document.getElementById("nameError").textContent = "";
    document.getElementById("emailError").textContent = "";
    document.getElementById("messageError").textContent = "";

    // Validate name
    if (name === "") {
        document.getElementById("nameError").textContent = "Name is required";
        isValid = false;
    }

    // Validate email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        document.getElementById("emailError").textContent = "Invalid email address";
        isValid = false;
    }

    // Validate message
    if (message === "") {
        document.getElementById("messageError").textContent = "Message is required";
        isValid = false;
    }
    return true;
}




