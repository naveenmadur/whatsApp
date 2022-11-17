// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AuthBloc(
          signupUseCase: c<SignupUseCase>(),
          validateOtpUseCase: c<LoginUseCase>()))
      ..registerFactory((c) => SignupUseCase(auth: c<AuthRepository>()))
      ..registerFactory((c) => LoginUseCase(auth: c<AuthRepository>()))
      ..registerFactory<AuthRepository>((c) =>
          AuthRepositoryImpl(authRemoteDataSource: c<AuthRemoteDataSource>()))
      ..registerFactory<AuthRemoteDataSource>(
          (c) => AuthRemoteDataSourceImpl());
  }
}
