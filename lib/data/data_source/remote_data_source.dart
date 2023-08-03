import 'package:q_pal_kiosk_app/data/network/app_api.dart';
import 'package:q_pal_kiosk_app/data/request/create_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/base_response.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/create_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_waiting_info.dart';

abstract class RemoteDataSource {
  Future<BaseResponse<List<GetReservationResponse>>> getTodayReservations();
  Future<BaseResponse<GetWaitingInfoResponse>> getLineEndWaitTime();
  Future<BaseResponse<CreateReservationResponse>> createReservation(
      CreateReservationRequest request);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<BaseResponse<List<GetReservationResponse>>>
      getTodayReservations() async {
    return await _appServiceClient.getTodayReservations();
  }

  @override
  Future<BaseResponse<GetWaitingInfoResponse>> getLineEndWaitTime() async {
    return await _appServiceClient.getLineEndWaitTime();
  }

  @override
  Future<BaseResponse<CreateReservationResponse>> createReservation(
      CreateReservationRequest request) async {
    return await _appServiceClient.createReservation(request);
  }
}
