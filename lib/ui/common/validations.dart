
//username validation for first time login
String? validateUsername(String? value) {
  if (value != null && value.isNotEmpty) {
    return null;
  } else {
    return 'Username is required';
  }
}