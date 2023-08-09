library sign_up_cubit;

import 'package:ultra_market/repositories/auth/auth_failures.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignUpState.initial());

  void nameChanged(String value) {
    emit(state.copyWith(name: value, status: SignUpStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignUpStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignUpStatus.initial));
  }

  void passwordConfirmChanged(String value) {
    emit(state.copyWith(confirmPassword: value, status: SignUpStatus.initial));
  }

  void signUpWithCredentials() async {
    if (!state.emailIsValid) return;
    if (!state.passwordEquals) return;
    emit(state.copyWith(status: SignUpStatus.submitting));
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(
        state.copyWith(status: SignUpStatus.success),
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(errorMessage: e.message, status: SignUpStatus.error),
      );
    } catch (_) {
      emit(
        state.copyWith(status: SignUpStatus.error),
      );
    }
  }
}
