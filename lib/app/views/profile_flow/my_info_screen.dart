import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/routes/app_pages.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';
import 'package:super_coder_task/app/utils/app_icons.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(title: '내정보'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.basicInfo);
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              const Text(
                                '기본 정보',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(AppColors.textColor)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.arrow,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xffF2F2F2),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.password);
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              const Text(
                                '비밀번호 설정',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(AppColors.textColor)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.arrow,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xffF2F2F2),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.categoryOfInterest);
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              const Text(
                                '관심 카테고리',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(AppColors.textColor)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.arrow,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xffF2F2F2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
