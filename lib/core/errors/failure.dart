import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure{
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failure{
  ConnectionFailure(super.message);
}

class FirebaseFailure extends Failure{
  const FirebaseFailure(super.message);
}

class DatabaseFailure extends Failure{
  DatabaseFailure(super.message);
}