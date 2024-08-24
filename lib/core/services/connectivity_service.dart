import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityService {
  ConnectivityService._();
  static final ConnectivityService instance = ConnectivityService._();

  void listenToInternetChanges(
      Function(InternetStatus status)? onListenFunction) {
    final listener = InternetConnection().onStatusChange.listen(onListenFunction
        // (InternetStatus status) {
        //   switch (status) {
        //     case InternetStatus.connected:
        //       break;
        //     case InternetStatus.disconnected:
        //       break;
        //   }
        // },
        );
  }
}
