import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/controllers/faq_controller.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FAQController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(title: 'FAQ'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.faqs.length,
                itemBuilder: (context, index) {
                  final faq = controller.faqs[index];
                  return ExpansionTile(
                    title: Text(
                      faq["question"]!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(AppColors.primary)),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(faq["answer"]!),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
