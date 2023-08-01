part of auth_bloc;

enum AuthStatus { unauthenticated, authenticated }

final class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel user;

  const AuthState._({required this.status, this.user = UserModel.empty});

  const AuthState.authenticated(UserModel user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
