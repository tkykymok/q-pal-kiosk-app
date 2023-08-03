import 'package:dartz/dartz.dart';
import 'package:q_pal_kiosk_app/data/network/failure.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_waiting_info.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/domain/repository/repository.dart';
import 'package:q_pal_kiosk_app/domain/usecase/base_usecase.dart';

class GetWaitingInfoUseCase extends BaseUseCase {
  final Repository _repository;
  GetWaitingInfoUseCase(this._repository);

  @override
  Future<Either<Failure, WaitingInfo>> execute(input) async {
    return await _repository.getLineEndWaitTime();
  }
}
