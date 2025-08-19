// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_coder_task/app/common_widgets/profile_tile.dart';
import 'package:super_coder_task/app/controllers/basic_info_controller.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';
import 'package:super_coder_task/app/utils/app_icons.dart';

import '../../routes/app_pages.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final BasicInfoController controller = Get.put(BasicInfoController());

  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take Photo"),
                onTap: () {
                  Navigator.pop(context);
                  controller.pickFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  controller.pickFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getUsername();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '안녕하세요,',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Obx(
                          () => Text(
                            controller.nickName.value.isEmpty
                                ? '홍길동'
                                : controller.nickName.value,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Obx(() => InkWell(
                          onTap: () => _showPhotoOptions(context),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: controller.profilePhoto.value.isNotEmpty
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(File(
                                            controller.profilePhoto.value)))
                                    : null,
                                shape: BoxShape.circle,
                                color: const Color(0xffF2F2F2)),
                            child: controller.profilePhoto.value.isNotEmpty
                                ? null
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.camera,
                                          height: 16,
                                          width: 21,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          '이미지 등록',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff878787)),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.campaign);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffF2F2F2)),
                        color: const Color(0xffFCFCFC)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                '나의 캠페인',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2E2E2E)),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.arrow,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(AppColors.primary)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '신청',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(AppColors.textColor)),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppIcons.arrow,
                                color: const Color(0xffBCBCBC),
                              ),
                              const Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(AppColors.primary)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '진행중',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(AppColors.textColor)),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppIcons.arrow,
                                color: const Color(0xffBCBCBC),
                              ),
                              const Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(AppColors.primary)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '완료',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(AppColors.textColor)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ProfileTile(
                  icon: AppIcons.user,
                  onTap: () {
                    Get.toNamed(AppRoutes.myInfo);
                  },
                  title: '내 정보',
                ),
                ProfileTile(
                  icon: AppIcons.note,
                  onTap: () {
                    Get.toNamed(AppRoutes.announcement);
                  },
                  title: '공지사항',
                ),
                ProfileTile(
                  icon: AppIcons.messages,
                  onTap: () {
                    Get.toNamed(AppRoutes.inquiryScreen);
                  },
                  title: '1:1문의',
                ),
                ProfileTile(
                  icon: AppIcons.faq,
                  onTap: () {
                    Get.toNamed(AppRoutes.faqScreen);
                  },
                  title: 'FAQ',
                ),
                ProfileTile(
                  icon: AppIcons.logout,
                  onTap: () {
                    Get.offAndToNamed(AppRoutes.loginScreen);
                  },
                  title: '로그아웃',
                ),
                ProfileTile(
                  icon: AppIcons.deleteAccount,
                  onTap: () {
                    Get.defaultDialog(
                      title: "회원탈퇴",
                      middleText: "저장된 모든 데이터가 삭제됩니다.\n계속 진행하시겠습니까?",
                      textCancel: "취소",
                      textConfirm: "확인",
                      cancelTextColor: Colors.black,
                      confirmTextColor: Colors.white,
                      buttonColor:
                          const Color(AppColors.primary), // ✅ App theme color
                      onConfirm: () async {
                        final box = GetStorage();
                        await box.erase();
                        Get.back();
                        Get.snackbar("회원탈퇴", "모든 데이터가 삭제되었습니다.");
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                      onCancel: () => Get.back(),
                    );
                  },
                  title: '회원탈퇴',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
