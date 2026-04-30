final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

final password = RegExp(
  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
);

String? usernameValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Username is required";
  } else if (value.length < 2) {
    return "Username must be at least 2 characters";
  }
  return null;
}

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Email is required";
  } else if (!emailRegex.hasMatch(value)) {
    return "Invalid email address";
  }
  return null;
}

String? phoneValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number is required";
  } else if (value.length > 15 || value.length < 6) {
    return "Invalid phone number";
  }
  return null;
}

String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  } else if (!password.hasMatch(value)) {
    return "Password must contain at least 8 characters, one uppercase, one lowercase, one number and one special character";
  }
  return null;
}

String? confirmPasswordValidation(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return "Confirm password is required";
  } else if (value != password) {
    return "Passwords do not match";
  }
  return null;
}

String? emailLoginValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Email is required";
  }
  return null;
}

String? passwordLoginValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }
  return null;
}