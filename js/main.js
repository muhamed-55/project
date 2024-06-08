// form-validation

function validateForm() {
    var name = document.getElementById("customer-name").value;
    var checkInDate = document.getElementById("check-in-date").value;
    var checkOutDate = document.getElementById("check-out-date").value;
    var numberOfPeople = document.getElementById("number-of-people").value;
    var contactNumber = document.getElementById("contact-number").value;
    var email = document.getElementById("email").value;

    if (name == "" || checkInDate == "" || checkOutDate == "" || numberOfPeople == "" || contactNumber == "" || email == "") {
        alert("Please fill in all fields");
        return false;
    }

    // Email validation
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address");
        return false;
    }

    // Contact number validation
    var contactNumberPattern = /^\d{11}$/; // Assumes a 10-digit phone number
    if (!contactNumberPattern.test(contactNumber)) {
        alert("Please enter a valid contact number (10 digits)");
        return false;
    }

    return true;
}
