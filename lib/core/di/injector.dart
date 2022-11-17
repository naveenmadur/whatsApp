import 'package:kiwi/kiwi.dart';
import 'package:whats_app/data/data_sources/auth_remote_data_source.dart';
import 'package:whats_app/data/repository/auth_repository_impl.dart';
import 'package:whats_app/domain/repositories/auth_repository.dart';
import 'package:whats_app/domain/use_case/authentication/sign_up_usecase.dart';
import 'package:whats_app/domain/use_case/authentication/login_usecase.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer? container;
  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container!.resolve();

  @Register.factory(AuthBloc)
  @Register.factory(SignupUseCase)
  @Register.factory(LoginUseCase)
  @Register.factory(AuthRepository, from: AuthRepositoryImpl)
  @Register.factory(AuthRemoteDataSource, from: AuthRemoteDataSourceImpl)

  void _configure();
}
