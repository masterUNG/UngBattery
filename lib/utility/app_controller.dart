import 'package:battery/models/question_model.dart';
import 'package:battery/models/user_model.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool condition = false.obs;
  RxList<QuestionModel> questionModels = <QuestionModel>[].obs;
  RxList<QuestionModel?> chooseQuestionModels = <QuestionModel?>[null].obs;

  RxInt indexBody = 0.obs;

  RxList<UserModel> userModelLogins = <UserModel>[].obs;
}
