//tai sao dung abstract interface ma khong dung abstract class
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/comon/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password
  });
  Future<Either<Failure, User>> currentUser();
}