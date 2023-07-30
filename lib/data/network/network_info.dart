import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetWorkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetWorkInfo {
  final DataConnectionChecker _dataConnectionChecker;
  NetWorkInfoImpl(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
