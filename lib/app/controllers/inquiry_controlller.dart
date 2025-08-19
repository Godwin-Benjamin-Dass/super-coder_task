import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryController extends GetxController {
  final titleController = TextEditingController();
  final messageController = TextEditingController();
  var selectedCategory = "General".obs;

  void submitInquiry() {
    if (titleController.text.isEmpty || messageController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    Get.snackbar("Success", "Your inquiry has been submitted");

    titleController.clear();
    messageController.clear();
    selectedCategory.value = "General";
  }
}
