String? credentialError(String errorCode) {
  switch (errorCode) {
    case 'account-exists-with-different-credential':
      return 'Account exists with different credentials.';
    case 'invalid-credential':
      return 'The credential received is malformed or has expired.';
    case 'operation-not-allowed':
      return 'Operation is not allowed.  Please contact support.';
    case 'user-disabled':
      return 'This user has been disabled. Please contact support for help.';
    case 'user-not-found':
      return 'Email is not found, please create an account.';
    case 'wrong-password':
      return 'Incorrect password, please try again.';
    case 'invalid-verification-code':
      return 'The credential verification code received is invalid.';
    case 'invalid-verification-id':
      return 'The credential verification ID received is invalid.';
    default:
      return 'Unknown error occurred';
  }
}

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String message;
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('Email already in use');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation not allowed');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Weak password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  final String message;
  const LogInWithEmailAndPasswordFailure([
    this.message = 'Unknown error occurred',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Email is not valid');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'This user has been disabled');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure('Email is not register');
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure('Incorrect password');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}

class LogInWithGoogleFailure implements Exception {
  final String? message;
  const LogInWithGoogleFailure([this.message]);

  factory LogInWithGoogleFailure.fromCode(code) {
    return LogInWithGoogleFailure(credentialError(code));
  }
}

class LogInWithFacebookFailure implements Exception {
  final String? message;
  const LogInWithFacebookFailure([this.message]);

  factory LogInWithFacebookFailure.fromCode(String code) {
    return LogInWithFacebookFailure(credentialError(code));
  }
}

class LogInWithAppleFailure implements Exception {
  final String? message;
  const LogInWithAppleFailure([this.message]);

  factory LogInWithAppleFailure.fromCode(String code) {
    return LogInWithAppleFailure(credentialError(code));
  }
}

class LogOutFailure implements Exception {}
