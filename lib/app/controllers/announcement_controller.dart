import 'package:get/get.dart';

class AnnouncementController extends GetxController {
  var announcements = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    announcements.value = [
      {
        "title": "System Maintenance",
        "date": "18 Aug 2025",
        "description":
            "Our system will undergo maintenance from 2 AM to 4 AM. Please save your work in advance."
      },
      {
        "title": "New Feature Released",
        "date": "15 Aug 2025",
        "description":
            "We are excited to announce the new Category of Interest feature. Update your app to try it out!"
      },
      {
        "title": "Holiday Notice",
        "date": "10 Aug 2025",
        "description":
            "Our office will remain closed on Independence Day (15th August)."
      },
    ];
  }
}
