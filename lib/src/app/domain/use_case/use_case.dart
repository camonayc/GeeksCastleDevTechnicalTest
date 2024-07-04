import 'package:either_dart/either.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams{}