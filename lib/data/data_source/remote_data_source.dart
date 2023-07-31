import 'package:q_pal_kiosk_app/data/network/app_api.dart';
import 'package:q_pal_kiosk_app/data/request/create_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/create_reservation.dart';

abstract class RemoteDataSource {
  Future<BaseResponse<CreateReservationResponse>> createReservation(
      CreateReservationRequest request);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<BaseResponse<CreateReservationResponse>> createReservation(
      CreateReservationRequest request) async {
    return await _appServiceClient.createReservation(request);
  }
}
