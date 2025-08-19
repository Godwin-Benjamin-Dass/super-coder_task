import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';
import 'package:super_coder_task/app/utils/app_icons.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 17,
        ),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: RotatedBox(
                quarterTurns: 2,
                child:
                    SvgPicture.asset(height: 17, width: 17, AppIcons.arrow))),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.textColor)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
