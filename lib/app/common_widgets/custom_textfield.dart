import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';
import 'package:super_coder_task/app/utils/app_icons.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.isEmail = false,
    this.isPassword = false,
    this.isEnabled = true,
    this.isAttachment = false,
    this.onChanged,
    this.isPhoneNo = false,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final bool isEmail;
  final bool isPassword;
  final bool isEnabled;
  final bool isAttachment;
  final bool isPhoneNo;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(AppColors.textColor),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 52,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            cursorHeight: 22,
            enabled: isEnabled,
            obscureText: isPassword,
            keyboardType: isEmail
                ? TextInputType.emailAddress
                : isPhoneNo
                    ? TextInputType.phone
                    : TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: isAttachment
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(AppIcons.attachment),
                    )
                  : null,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: Color(0xffE0E0E0), width: 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
