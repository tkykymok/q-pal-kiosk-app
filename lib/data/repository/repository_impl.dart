import 'package:dartz/dartz.dart';
import 'package:q_pal_kiosk_app/data/data_source/remote_data_source.dart';
import 'package:q_pal_kiosk_app/data/network/network_info.dart';
import 'package:q_pal_kiosk_app/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetWorkInfo _netWorkInfo;

  RepositoryImpl(this._remoteDataSource, this._netWorkInfo);
}
