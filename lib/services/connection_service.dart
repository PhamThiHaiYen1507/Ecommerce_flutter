import 'package:commons/commons.dart';

import '../base/network/app_connection.dart';
import '../utils/app_logger.dart';

class ConnectionService extends GetxService {
  @override
  void onInit() {
    AppConnection.addListener(_onChangedConnection);
    super.onInit();
  }

  void _onChangedConnection(bool hasConnect) {
    if (!hasConnect) {
      logD('Disconnect to network');
    }
  }
}
