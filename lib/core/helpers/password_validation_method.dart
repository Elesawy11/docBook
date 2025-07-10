import '../utils/app_regex.dart';

dynamic passwordValidation(String? password) {
  if (password == null || password.isEmpty) {
    return 'The password field is required.';
  }
  if (!AppRegex.hasLowerCase(password)) {
    return 'At least 1 lowercase letter';
  }
  if (!AppRegex.hasUpperCase(password)) {
    return 'At least 1 uppercase letter';
  }
  if (!AppRegex.hasSpecialCharacter(password)) {
    return 'At least 1 special character';
  }
  if (!AppRegex.hasNumber(password)) {
    return 'At least 1 number';
  }
  if (!AppRegex.hasMinLength(password)) {
    return 'At least 9 characters long';
  }
}
