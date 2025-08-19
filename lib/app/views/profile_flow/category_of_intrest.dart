import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/common_widgets/custom_button.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';

import '../../controllers/category_controller.dart';

class CategoryOfInterestPage extends StatelessWidget {
  CategoryOfInterestPage({super.key});

  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(title: '관심 카테고리'),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "관심 있는 카테고리를 선택하세요",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final item = controller.categories[index];
                  return Obx(() {
                    final isSelected =
                        controller.selected.contains(item["label"]);
                    return GestureDetector(
                      onTap: () =>
                          controller.toggleCategory(item["label"] as String),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(AppColors.primary)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item["icon"] as IconData,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey.shade700),
                            const SizedBox(width: 8),
                            Text(
                              item["label"] as String,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey.shade800,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                  title: '구하다', onPressed: controller.saveCategories),
            ),
          ],
        ),
      ),
    );
  }
}
