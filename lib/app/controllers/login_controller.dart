import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordHidden = true.obs;

  void togglePassword() => isPasswordHidden.value = !isPasswordHidden.value;

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Login Failed", "이메일과 비밀번호를 입력하세요.");
    } else {
      Get.snackbar("Welcome", "환영합니다, $email 님!");
      Get.offAndToNamed(AppRoutes.profile);
    }
  }
}
