import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class BasicInfoController extends GetxController {
  final box = GetStorage();

  // text controllers
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nicknameController;
  late TextEditingController instagramController;
  late TextEditingController workLink1Controller;
  final phoneRegex = RegExp(r'^010\d{8}$');

  // reactive variables
  var userId = "asdf123".obs;
  var nickName = "".obs;
  var portfolioFile = "".obs;
  var profilePhoto = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController(text: box.read('email') ?? "");
    phoneController = TextEditingController(text: box.read('phone') ?? "");
    nicknameController =
        TextEditingController(text: box.read('nickname') ?? "");
    instagramController =
        TextEditingController(text: box.read('instagram') ?? "");
    workLink1Controller =
        TextEditingController(text: box.read('workLink1') ?? "");

    portfolioFile.value = box.read('portfolioFile') ?? "";
  }

  void getUsername() {
    if (box.read('nickname') != null) {
      nickName.value = box.read('nickname');
    }
    if (box.read('profilePhoto') != null) {
      profilePhoto.value = box.read('profilePhoto');
    }
  }

  // Pick from gallery using FilePicker
  Future<void> pickFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      profilePhoto.value = result.files.single.path!;
      box.write('profilePhoto', profilePhoto.value);
    }
  }

  Future<void> pickFromCamera() async {
    if (!await Permission.camera.request().isGranted) {
      Get.snackbar("Permission Denied", "Storage permission is required.");
      return;
    }
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      profilePhoto.value = photo.path;
      box.write('profilePhoto', profilePhoto.value);
    }
  }

  void saveInfo() {
    if (emailController.text.isEmpty || nicknameController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all required fields");
      return;
    }

    // save to local storage
    box.write('email', emailController.text);
    box.write('phone', phoneController.text);
    box.write('nickname', nicknameController.text);
    box.write('instagram', instagramController.text);
    box.write('workLink1', workLink1Controller.text);
    box.write('portfolioFile', portfolioFile.value);
    nickName.value = nicknameController.text;

    Get.snackbar("Success", "Basic info saved locally!");
  }

  void changePhoneNumber() {
    final phone = phoneController.text.trim();

    if (!phoneRegex.hasMatch(phone)) {
      Get.snackbar("Error", "Phone must be in 01012341234 format.");
      return;
    }

    box.write('phone', phone);
    Get.snackbar("Success", "Phone number updated.");
  }

  Future<void> attachPortfolio() async {
    if (portfolioFile.value.isNotEmpty) {
      // Already attached, ask user what to do
      Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.remove_red_eye),
                title: const Text("View Document"),
                onTap: () {
                  Get.back();
                  OpenFile.open(portfolioFile.value);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Change Document"),
                onTap: () {
                  Get.back();
                  pickPortfolio();
                },
              ),
            ],
          ),
        ),
      );
    } else {
      pickPortfolio();
    }
  }

  Future<void> pickPortfolio() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      Get.snackbar("Permission Denied", "Storage permission is required.");
      return;
    }
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null) {
      portfolioFile.value = result.files.single.path!;
      box.write('portfolio', portfolioFile.value); // save locally
      Get.snackbar("Success", "Portfolio attached.");
    }
  }
}
