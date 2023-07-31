import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/app/app_prefs.dart';
import 'package:q_pal_kiosk_app/data/data_source/remote_data_source.dart';
import 'package:q_pal_kiosk_app/data/network/app_api.dart';
import 'package:q_pal_kiosk_app/data/network/dio_factory.dart';
import 'package:q_pal_kiosk_app/data/network/network_info.dart';
import 'package:q_pal_kiosk_app/domain/repository/repository.dart';
import 'package:q_pal_kiosk_app/domain/usecase/reservation_kiosk/create_reservation_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final appPreferencesProvider = FutureProvider<AppPreferences>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return AppPreferences(sharedPreferences);
});

final networkInfoProvider = Provider<NetWorkInfo>((ref) {
  return NetWorkInfoImpl(DataConnectionChecker());
});

final dioFactoryProvider = FutureProvider<DioFactory>((ref) async {
  final appPreferences = await ref.watch(appPreferencesProvider.future);
  return DioFactory(appPreferences);
});

final appServiceClientProvider = FutureProvider<AppServiceClient>((ref) async {
  final dioFactory = await ref.read(dioFactoryProvider.future);
  return AppServiceClient(await dioFactory.getDio());
});

final remoteDataSourceProvider = FutureProvider<RemoteDataSource>((ref) async {
  final appServiceClient = await ref.read(appServiceClientProvider.future);
  return RemoteDataSourceImplementer(appServiceClient);
});

final repositoryProvider = FutureProvider<Repository>((ref) async {
  final remoteDataSource = await ref.read(remoteDataSourceProvider.future);
  final networkInfo = ref.read(networkInfoProvider);
  return RepositoryImpl(remoteDataSource, networkInfo);
});

final createReservationUseCaseProvider =
    FutureProvider<CreateReservationUseCase>((ref) async {
  final repository = await ref.read(repositoryProvider.future);
  return CreateReservationUseCase(repository);
});

//
// final loginViewModelProvider =
//     StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
//   return LoginViewModel(ref);
// });
//
// final onBoardingViewModelProvider =
//     StateNotifierProvider.autoDispose<OnBoardingViewModel, OnBoardingState>(
//         (ref) {
//   return OnBoardingViewModel();
// });
//
// final baseViewModelProvider =
//     StateNotifierProvider<BaseViewModel, FlowState>((ref) => BaseViewModel());

//
// final forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
//   final repository = ref.read(repositoryProvider);
//   return ForgotPasswordUseCase(repository);
// });
//
// final forgotPasswordViewModelProvider =
//     StateNotifierProvider<ForgotPasswordViewModel, ForgotPasswordViewState>(
//         (ref) {
//   return ForgotPasswordViewModel(ref.read);
// });
