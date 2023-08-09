part of sign_up_cubit;

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final SignUpStatus status;
  final String? errorMessage;

  const SignUpState({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.status,
    this.errorMessage,
  });
  factory SignUpState.initial() {
    return const SignUpState(
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
      status: SignUpStatus.initial,
    );
  }

  SignUpState copyWith(
      {String? name,
      String? email,
      String? password,
      String? confirmPassword,
      SignUpStatus? status,
      String? errorMessage}) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get emailIsValid => email.isValidEmail();
  bool get passwordEquals => password == confirmPassword;

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        confirmPassword,
        status,
        errorMessage,
      ];
}
