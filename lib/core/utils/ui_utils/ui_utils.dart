import 'package:get/get.dart';

class UiUtils {
  static snack({required String msg}) {
    Get.showSnackbar(GetSnackBar(title: msg)); // can add some customizations
  }

  // ...
}