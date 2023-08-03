import 'package:dio/dio.dart';
import 'package:q_pal_kiosk_app/app/constant.dart';
import 'package:q_pal_kiosk_app/data/request/create_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/base_response.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/create_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_waiting_info.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.BASE_API_URL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  // reservation
  @GET("/reservations")
  Future<BaseResponse<List<GetReservationResponse>>> getTodayReservations();

  @GET("/lineEndWaitTime")
  Future<BaseResponse<GetWaitingInfoResponse>> getLineEndWaitTime();

  @POST("/reservation")
  Future<BaseResponse<CreateReservationResponse>> createReservation(
      @Body() CreateReservationRequest request);
}
