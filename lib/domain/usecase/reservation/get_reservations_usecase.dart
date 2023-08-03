import 'package:dartz/dartz.dart';
import 'package:q_pal_kiosk_app/data/network/failure.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/domain/repository/repository.dart';
import 'package:q_pal_kiosk_app/domain/usecase/base_usecase.dart';

class GetReservationsUseCase extends BaseUseCase {
  final Repository _repository;
  GetReservationsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Reservation>>> execute(input) async {
    return await _repository.getTodayReservations();
  }
}
