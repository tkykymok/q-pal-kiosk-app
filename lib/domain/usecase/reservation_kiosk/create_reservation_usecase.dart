import 'package:dartz/dartz.dart';
import 'package:q_pal_kiosk_app/data/network/failure.dart';
import 'package:q_pal_kiosk_app/data/request/create_reservation.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/domain/repository/repository.dart';
import 'package:q_pal_kiosk_app/domain/usecase/base_usecase.dart';

class CreateReservationUseCase extends BaseUseCase {
  final Repository _repository;
  CreateReservationUseCase(this._repository);

  @override
  Future<Either<Failure, CreatedReservation>> execute(input) async {
    final request = CreateReservationRequest(input);
    return await _repository.createReservation(request);
  }
}
