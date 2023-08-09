part of sign_in_cubit;

enum SignInStatus { initial, submitting, success, error }

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;
  final SignInStatus status;
  final String? errorMessage;

  const SignInState({
    required this.email,
    required this.password,
    required this.rememberMe,
    required this.status,
    this.errorMessage,
  });

  factory SignInState.initial() {
    return const SignInState(
      email: '',
      password: '',
      rememberMe: false,
      status: SignInStatus.initial,
    );
  }

  SignInState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, rememberMe, status, errorMessage];
}
