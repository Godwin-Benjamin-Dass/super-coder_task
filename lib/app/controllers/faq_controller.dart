import 'package:get/get.dart';

class FAQController extends GetxController {
  final faqs = [
    {
      "question": "비밀번호를 어떻게 재설정하나요?",
      "answer": "프로필 > 설정 > 비밀번호 변경 메뉴에서 재설정할 수 있습니다."
    },
    {
      "question": "내 프로필 정보를 수정할 수 있나요?",
      "answer": "네, 프로필 페이지에서 편집 버튼을 눌러 정보를 수정할 수 있습니다."
    },
    {
      "question": "고객센터에 어떻게 문의하나요?",
      "answer": "1:1 문의 페이지를 통해 메시지를 보내실 수 있습니다."
    },
    {
      "question": "내 정보는 안전하게 보호되나요?",
      "answer": "네, 저희는 암호화 및 보안 저장소를 사용하여 데이터를 안전하게 보호합니다."
    },
  ].obs;
}
