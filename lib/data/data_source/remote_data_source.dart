import 'package:q_pal_kiosk_app/data/network/app_api.dart';

abstract class RemoteDataSource {}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);
}
