library auth_bloc;

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';
import 'package:ultra_market/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(authRepository.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    on<AuthUserChanged>(_onAuthUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequest);
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.authUser != null
        ? emit(AuthState.authenticated(event.user!))
        : emit(const AuthState.unauthenticated());
  }

  void _onLogoutRequest(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('AutoAuth', ['']);
    emit(const AuthState.unauthenticated());
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    return super.close();
  }
}
