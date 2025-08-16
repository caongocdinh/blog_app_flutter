import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {// Defines a generic use case interface
  Future<Either<Failure, SuccessType>> call(Params params);// Method to execute the use case with given parameters
}

class NoParams {}