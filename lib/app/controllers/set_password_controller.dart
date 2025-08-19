import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SetPasswordController extends GetxController {
  final String defaultPassword = "1q2w3e4r!@";
  final storage = GetStorage();

  var inputCurrent = "".obs;
  var newPassword = "".obs;
  var confirmPassword = "".obs;

  String get currentPassword {
    return storage.read("user_password") ?? defaultPassword;
  }

  final passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~^%()_\-+=]).{8,16}$');

  void validateAndSubmit() {
    if (inputCurrent.value != currentPassword) {
      Get.snackbar("Error", "Current password is incorrect.");
      return;
    }

    if (newPassword.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields.");
      return;
    }

    if (!passwordRegex.hasMatch(newPassword.value)) {
      Get.snackbar(
        "Error",
        "Password must be 8–16 characters long and include letters, numbers, and special characters.",
      );
      return;
    }

    if (newPassword.value != confirmPassword.value) {
      Get.snackbar("Error", "New password and confirmation do not match.");
      return;
    }

    storage.write("user_password", newPassword.value);

    Get.snackbar("Success", "Password has been set successfully!");
  }
}
