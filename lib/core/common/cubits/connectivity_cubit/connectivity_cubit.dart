import 'package:asroo_ecommerce/core/services/connectivity_service.dart';
import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());
  final concetivityService = ConnectivityService.instance;
  void listenForConnectivity() {
    concetivityService.listenToInternetChanges((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          print("Connected");
          emit(Connected());
          break;

        case InternetStatus.disconnected:
          print("Not connected");
          emit(NotConnected());
          break;
      }
    });
  }
}
