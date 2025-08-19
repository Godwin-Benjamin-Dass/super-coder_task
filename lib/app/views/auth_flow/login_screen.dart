import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_button.dart';
import 'package:super_coder_task/app/common_widgets/custom_textfield.dart';
import 'package:super_coder_task/app/controllers/login_controller.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(AppColors.primary), Color(AppColors.splash)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo / App Name
            const Text(
              "My FLYN",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 30),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CustomTextFiled(
                      controller: controller.emailController,
                      isEmail: true,
                      title: '이메일',
                      hintText: 'user@email.com'),
                  CustomTextFiled(
                      controller: controller.passwordController,
                      isPassword: true,
                      title: '비밀번호',
                      hintText: 'password'),
                  CustomButton(title: '로그인', onPressed: controller.login),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Get.snackbar("Info", "비밀번호 재설정 기능은 준비 중입니다.");
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("계정이 없으신가요? ",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    Get.snackbar("Signup", "회원가입 페이지로 이동");
                  },
                  child: const Text(
                    "회원가입",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
