part of auth_bloc;

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? authUser;
  final UserModel? user;

  const AuthState._(
      {this.status = AuthStatus.unknown, this.user, this.authUser});

  const AuthState.unknown() : this._();

  const AuthState.authenticated({
    required auth.User authUser,
    required UserModel user,
  }) : this._(
          status: AuthStatus.authenticated,
          authUser: authUser,
          user: user,
        );

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object?> get props => [status, authUser, user];
}
