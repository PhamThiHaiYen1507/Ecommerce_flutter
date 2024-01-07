import 'package:commons/commons.dart';
import 'package:nws_yenpth1_ecommerce_flutter/services/connection_service.dart';

import '../services/global_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalService());
    Get.put(ConnectionService());
  }
}
