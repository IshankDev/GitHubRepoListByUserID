import 'package:api_test/handler/NetworkHandler.dart';
import 'package:api_test/models/user_repo_response.dart';
import 'package:api_test/utils/Utils.dart';
import 'package:api_test/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandingPageController extends GetxController {
  TextEditingController userIdController = TextEditingController();

  List<UserRepoResponse> userRepoList = [];

  void nextOnPressed() async {
    final value = userIdController.text;
    if (value.length > 0) {
      Utils.showInfoSnackBar('Fetching Repo List');
      final url = '${Const.baseUrl}$value${Const.postFix}';
      userRepoList = await NetworkHandler.makeGetCall(url);
      update();
    } else {
      Utils.showInfoSnackBar('Please enter Github UserID');
    }
  }
}
