import 'package:dartz/dartz.dart';
import 'package:q_pal_kiosk_app/data/data_source/remote_data_source.dart';
import 'package:q_pal_kiosk_app/data/mapper/mapper.dart';
import 'package:q_pal_kiosk_app/data/network/error_handler.dart';
import 'package:q_pal_kiosk_app/data/network/failure.dart';
import 'package:q_pal_kiosk_app/data/network/network_info.dart';
import 'package:q_pal_kiosk_app/data/request/create_reservation.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';

abstract class Repository {
  Future<Either<Failure, CreatedReservation>> createReservation(
      CreateReservationRequest request);
}

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetWorkInfo _netWorkInfo;

  RepositoryImpl(this._remoteDataSource, this._netWorkInfo);

  @override
  Future<Either<Failure, CreatedReservation>> createReservation(
    CreateReservationRequest request,
  ) async {
    if (await _netWorkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.createReservation(request);

        // return data
        return Right(response.data.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION));
    }
  }
}
