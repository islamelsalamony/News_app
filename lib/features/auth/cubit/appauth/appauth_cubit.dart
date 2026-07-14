import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:novanews/core/cache/cache_user_repo.dart';
import 'package:novanews/features/auth/data/services/auth_services.dart';

part 'appauth_state.dart';

class AppAuthCubit extends Cubit<AppAuthState> {
  final AuthServices authServices = AuthServices();
  AppAuthCubit() : super(AppAuthInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AppAuthLoading());
    try {
      await authServices.signUp(
        email: email,
        password: password,
        username: username,
      );
      emit(AppAuthSuccess());
      CacheUserRepo.login(true);
    } catch (e) {
      emit(AppAuthError(errorMessage: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AppAuthLoading());
    try {
      await authServices.login(email: email, password: password);
      emit(AppAuthSuccess());
      CacheUserRepo.login(true);
    } catch (e) {
      emit(AppAuthError(errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AppAuthLoading());
    await authServices.logout();
    CacheUserRepo.logout();
    emit(AppAuthSuccess());
  }
}
