import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/common_widgets/custom_button.dart';
import 'package:super_coder_task/app/common_widgets/custom_textfield.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';
import '../../controllers/basic_info_controller.dart';

class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BasicInfoController()); // inject controller

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(title: '기본정보'),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    // User ID (non-editable, comes from obs)
                    Obx(() => CustomTextFiled(
                          title: '아이디',
                          hintText: controller.userId.value,
                          isEnabled: false,
                        )),

                    // Email field
                    CustomTextFiled(
                      title: '이메일',
                      hintText: 'enter your email',
                      controller: controller.emailController,
                      isEmail: true,
                    ),

                    // Phone field with Change button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CustomTextFiled(
                            isPhoneNo: true,
                            title: '휴대폰 번호',
                            hintText: 'enter your phone number',
                            controller: controller.phoneController,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: GestureDetector(
                            onTap: () => controller.changePhoneNumber(),
                            child: Container(
                              width: 85,
                              height: 52,
                              decoration: BoxDecoration(
                                color: const Color(AppColors.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                '변경하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Nickname
                    CustomTextFiled(
                      title: '닉네임',
                      hintText: 'enter your nick name',
                      controller: controller.nicknameController,
                    ),

                    // Instagram
                    CustomTextFiled(
                      title: '인스타그램 아이디',
                      hintText: 'enter your instagram id',
                      controller: controller.instagramController,
                    ),

                    // Work link
                    CustomTextFiled(
                      title: '대표 작업 링크',
                      hintText: 'enter your work link',
                      controller: controller.workLink1Controller,
                    ),

                    // Portfolio (observable since it may update dynamically)
                    Obx(() => InkWell(
                          onTap: () => controller.attachPortfolio(),
                          child: CustomTextFiled(
                            title: '포트폴리오',
                            hintText: controller.portfolioFile.value.isEmpty
                                ? 'Attach your portfolio'
                                : controller.portfolioFile.value,
                            isEnabled: false,
                            isAttachment: true,
                          ),
                        )),

                    const SizedBox(height: 40),

                    // Save button
                    CustomButton(
                      title: '저장하기',
                      onPressed: controller.saveInfo,
                    ),

                    const SizedBox(height: 22),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
