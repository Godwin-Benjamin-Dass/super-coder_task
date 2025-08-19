import 'package:get/get.dart';
import 'package:super_coder_task/app/views/auth_flow/login_screen.dart';
import 'package:super_coder_task/app/views/onboardin_flow/splash_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/announcement_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/basic_info_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/campaign_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/category_of_intrest.dart';
import 'package:super_coder_task/app/views/profile_flow/faq_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/inquiry_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/my_info_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/profile_screen.dart';
import 'package:super_coder_task/app/views/profile_flow/set_password_screen.dart';

class AppRoutes {
  static const splashScreen = '/splash';
  static const interest = '/interest';
  static const campaign = '/campaign';
  static const myInfo = '/my-info';
  static const basicInfo = '/basic-info';
  static const profile = '/profile';
  static const password = '/password';
  static const categoryOfInterest = '/category-of-interest';
  static const announcement = '/announcement';
  static const inquiryScreen = '/inquiry-screen';
  static const faqScreen = '/faq-screen';
  static const loginScreen = '/login-screen';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.campaign,
      page: () => const CampaignScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.myInfo,
      page: () => const MyInfoScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.basicInfo,
      page: () => const BasicInfoScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.password,
      page: () => const SetPasswordScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.categoryOfInterest,
      page: () => CategoryOfInterestPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.announcement,
      page: () => const AnnouncementScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.inquiryScreen,
      page: () => const InquiryScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.faqScreen,
      page: () => const FAQScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.fade,
    ),
  ];
}
