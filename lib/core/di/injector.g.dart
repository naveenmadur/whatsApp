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
          loginUseCase: c<LoginUseCase>(),
          getCurrentUserUseCase: c<GetCurrentUserUseCase>()))
      ..registerFactory(
          (c) => UsersBloc(getAllUsersUseCase: c<GetAllUsersUseCase>()))
      ..registerFactory((c) => MessageBloc(
          getMessageUseCase: c<GetMessageUseCase>(),
          postMessageUseCase: c<PostMessageUseCase>()))
      ..registerFactory((c) => SignupUseCase(auth: c<AuthRepository>()))
      ..registerFactory((c) => LoginUseCase(auth: c<AuthRepository>()))
      ..registerFactory((c) => GetCurrentUserUseCase(auth: c<AuthRepository>()))
      ..registerFactory((c) => GetAllUsersUseCase(repo: c<UsersRepository>()))
      ..registerFactory((c) => GetMessageUseCase(repo: c<MessageRepository>()))
      ..registerFactory((c) => PostMessageUseCase(repo: c<MessageRepository>()))
      ..registerFactory<AuthRepository>((c) =>
          AuthRepositoryImpl(authRemoteDataSource: c<AuthRemoteDataSource>()))
      ..registerFactory<UsersRepository>((c) => UsersRepositoryImpl(
          usersRemoteDataSource: c<UsersRemoteDataSource>()))
      ..registerFactory<MessageRepository>((c) => MessageRepositoryImpl(
          messageRemoteDataSource: c<MessageRemoteDataSource>()))
      ..registerFactory<AuthRemoteDataSource>((c) => AuthRemoteDataSourceImpl())
      ..registerFactory<UsersRemoteDataSource>(
          (c) => UsersRemoteDataSourceImpl())
      ..registerFactory<MessageRemoteDataSource>(
          (c) => MessageRemoteDataSourceImpl());
  }
}
