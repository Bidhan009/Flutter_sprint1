abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({required super.message});
}