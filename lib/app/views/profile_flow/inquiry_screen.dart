import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/common_widgets/custom_button.dart';
import 'package:super_coder_task/app/controllers/inquiry_controlller.dart';

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InquiryController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(title: '1:1문의'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("제목"),
                    TextField(
                      controller: controller.titleController,
                      decoration: const InputDecoration(
                        hintText: "Enter inquiry title",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("범주"),
                    Obx(() => DropdownButton<String>(
                          value: controller.selectedCategory.value,
                          items: ["General", "Payment", "Technical", "Other"]
                              .map((cat) => DropdownMenuItem(
                                  value: cat, child: Text(cat)))
                              .toList(),
                          onChanged: (val) => controller
                              .selectedCategory.value = val ?? "General",
                        )),
                    const SizedBox(height: 16),
                    const Text("메시지"),
                    TextField(
                      controller: controller.messageController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Describe your issue",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                        child: CustomButton(
                            title: '제출하다',
                            onPressed: controller.submitInquiry)),
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
