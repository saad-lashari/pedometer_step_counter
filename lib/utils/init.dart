import 'package:cypherkicks/data/controllers/auth_controller.dart';
import 'package:cypherkicks/data/controllers/pedometer_controller.dart';
import 'package:cypherkicks/data/controllers/profile_controller.dart';
import 'package:cypherkicks/data/controllers/weight_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>((AuthController()));
    Get.put<PedometerController>(PedometerController());
    Get.put<WeightController>((WeightController()));
    Get.put<ProfileController>(ProfileController());
  }
}
