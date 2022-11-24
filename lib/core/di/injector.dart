import 'package:kiwi/kiwi.dart';
import 'package:whats_app/data/data_sources/auth_remote_data_source.dart';
import 'package:whats_app/data/data_sources/message_remote_data_source.dart';
import 'package:whats_app/data/data_sources/users_remote_data_source.dart';
import 'package:whats_app/data/repository/auth_repository_impl.dart';
import 'package:whats_app/data/repository/message_repository_impl.dart';
import 'package:whats_app/data/repository/users_repository_impl.dart';
import 'package:whats_app/domain/repositories/auth_repository.dart';
import 'package:whats_app/domain/repositories/message_repository.dart';
import 'package:whats_app/domain/repositories/users_repository.dart';
import 'package:whats_app/domain/use_case/authentication/get_currentUser_usercase.dart';
import 'package:whats_app/domain/use_case/authentication/sign_up_usecase.dart';
import 'package:whats_app/domain/use_case/authentication/login_usecase.dart';
import 'package:whats_app/domain/use_case/get_all_users_usecase.dart';
import 'package:whats_app/domain/use_case/message/get_message_usercase.dart';
import 'package:whats_app/domain/use_case/message/post_message_usecase.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:whats_app/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:whats_app/presentation/bloc/users_bloc/users_bloc.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer? container;
  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container!.resolve();

  //! Bloc
  @Register.factory(AuthBloc)
  @Register.factory(UsersBloc)
  @Register.factory(MessageBloc)

  //! Use Case
  @Register.factory(SignupUseCase)
  @Register.factory(LoginUseCase)
  @Register.factory(GetCurrentUserUseCase)
  @Register.factory(GetAllUsersUseCase)
  @Register.factory(GetMessageUseCase)
  @Register.factory(PostMessageUseCase)

  //! Repositories
  @Register.factory(AuthRepository, from: AuthRepositoryImpl)
  @Register.factory(UsersRepository, from: UsersRepositoryImpl)
  @Register.factory(MessageRepository, from: MessageRepositoryImpl)

  //! Data Source
  @Register.factory(AuthRemoteDataSource, from: AuthRemoteDataSourceImpl)
  @Register.factory(UsersRemoteDataSource, from: UsersRemoteDataSourceImpl)
  @Register.factory(MessageRemoteDataSource, from: MessageRemoteDataSourceImpl)


  // ignore: unused_element
  void _configure();
}
