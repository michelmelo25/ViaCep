import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class NotFoundFailure extends Failure {
  static const String MESSAGE =
      "Conteúdo não foi encontrado ou não existe mais.";
  static NotFoundFailure instance = NotFoundFailure._();

  NotFoundFailure._() : super(MESSAGE);
}
