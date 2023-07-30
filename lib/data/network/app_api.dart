import 'package:dio/dio.dart';
import 'package:q_pal_kiosk_app/app/constant.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.BASE_API_URL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
}
