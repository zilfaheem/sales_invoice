class AppValidators {
  AppValidators._();

  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }

    final username = value.trim();

    if (username.length < 4) {
      return 'Username must be at least 4 characters';
    }

    if (username.length > 30) {
      return 'Username cannot exceed 30 characters';
    }

    final regex = RegExp(r'^[a-zA-Z0-9._]+$');

    if (!regex.hasMatch(username)) {
      return 'Only letters, numbers, . and _ are allowed';
    }

    if (username.startsWith('.') ||
        username.startsWith('_') ||
        username.endsWith('.') ||
        username.endsWith('_')) {
      return 'Username cannot start or end with . or _';
    }

    if (username.contains('..') || username.contains('__')) {
      return 'Consecutive . or _ are not allowed';
    }

    return null;
  }

  // Strong Password
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain at least one number';
    }

    if (!RegExp(r'[!@#$%^&*()_\-+=<>?/{}\[\]~|\\.,:;]').hasMatch(value)) {
      return 'Must contain at least one special character';
    }

    // Prevent spaces
    if (value.contains(' ')) {
      return 'Password cannot contain spaces';
    }

    return null;
  }
}
