import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/common_widgets/custom_button.dart';
import 'package:super_coder_task/app/common_widgets/custom_textfield.dart';
import 'package:super_coder_task/app/controllers/set_password_controller.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SetPasswordController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(title: '비밀번호 설정'),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextFiled(
                    isPassword: true,
                    title: '기본 비밀번호*',
                    hintText: '8-16자리 영문, 숫자, 특수문자 조합',
                    onChanged: (val) => controller.inputCurrent.value = val,
                  ),
                  CustomTextFiled(
                    isPassword: true,
                    title: '새 비밀번호*',
                    hintText: '8-16자리 영문, 숫자, 특수문자 조합',
                    onChanged: (val) => controller.newPassword.value = val,
                  ),
                  CustomTextFiled(
                    isPassword: true,
                    title: '비밀번호 확인*',
                    hintText: '비밀번호를 재입력해 주세요.',
                    onChanged: (val) => controller.confirmPassword.value = val,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          title: 'Save',
          onPressed: () => controller.validateAndSubmit(),
        ),
      ),
    );
  }
}
