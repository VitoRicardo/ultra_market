library sign_in_cubit;

import 'package:ultra_market/repositories/auth/auth_failures.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;
  SignInCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignInState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignInStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignInStatus.initial));
  }

  void rememberMeChanged(bool value) {
    emit(state.copyWith(rememberMe: value, status: SignInStatus.initial));
  }

  void signInWithCredentials() async {
    emit(state.copyWith(status: SignInStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(
        state.copyWith(status: SignInStatus.success),
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: SignInStatus.error));
    } catch (e) {
      emit(
        state.copyWith(status: SignInStatus.error),
      );
    }
  }

  void signInWithGoogle() async {
    emit(state.copyWith(status: SignInStatus.submitting));
    try {
      await _authRepository.logInWithGoogle();
      emit(
        state.copyWith(status: SignInStatus.success),
      );
      print(_authRepository.currentUser);
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(errorMessage: e.message, status: SignInStatus.error),
      );
    } catch (_) {
      emit(
        state.copyWith(status: SignInStatus.error),
      );
    }
  }
}
