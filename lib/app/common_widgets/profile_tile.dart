import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';
import 'package:super_coder_task/app/utils/app_icons.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
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
    );
  }
}
