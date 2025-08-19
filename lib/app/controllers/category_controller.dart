import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoryController extends GetxController {
  final box = GetStorage();

  final categories = [
    {"icon": Icons.code, "label": "Development"},
    {"icon": Icons.design_services, "label": "Design"},
    {"icon": Icons.business_center, "label": "Business"},
    {"icon": Icons.science, "label": "Science"},
    {"icon": Icons.language, "label": "Languages"},
    {"icon": Icons.music_note, "label": "Music"},
    {"icon": Icons.sports_soccer, "label": "Sports"},
    {"icon": Icons.health_and_safety, "label": "Health"},
  ];

  var selected = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved categories if exist
    final saved = box.read<List>('interests');
    if (saved != null) selected.assignAll(saved.cast<String>());
  }

  void toggleCategory(String label) {
    if (selected.contains(label)) {
      selected.remove(label);
    } else {
      selected.add(label);
    }
  }

  void saveCategories() {
    box.write('interests', selected);
    Get.snackbar("Saved", "Your interests have been updated",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.6),
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        borderRadius: 12);
  }
}
