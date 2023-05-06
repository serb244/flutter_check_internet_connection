import 'package:get/get.dart';

import '../controller/check_connection.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
