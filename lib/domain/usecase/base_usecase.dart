import 'package:dartz/dartz.dart';
import 'package:q_pal_kiosk_app/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
