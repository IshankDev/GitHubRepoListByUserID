import 'package:api_test/controller/landing_page_controller.dart';
import 'package:api_test/models/user_repo_response.dart';
import 'package:api_test/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(
      init: LandingPageController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: renderTopBlock(),
            body: renderMiddleBlock(),
            bottomNavigationBar: renderBottomBlock(),
          ),
        );
      },
    );
  }

  AppBar renderTopBlock() {
    return AppBar(
      title: Text('Github Repo List'),
      centerTitle: true,
    );
  }

  Widget renderMiddleBlock() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: getItemCount(),
      itemBuilder: (context, index) {
        if (index == 0) return renderUserIdInputView();
        return fullNameItemView(controller.userRepoList[index - 1]);
      },
    );
  }

  Widget renderBottomBlock() {
    return ElevatedButton(
        onPressed: () {
          controller.nextOnPressed();
        },
        child: Text(
          'Fetch Repo List',
        ));
  }

  int getItemCount() {
    if (controller.userRepoList.length == 0) return 1;
    return controller.userRepoList.length + 1;
  }

  Padding renderUserIdInputView() {
    return Padding(
      padding: const EdgeInsets.all(Const.PADDING_MEDIUM),
      child: TextFormField(
        controller: controller.userIdController,
        decoration: InputDecoration(hintText: 'Enter github user ID'),
      ),
    );
  }

  Widget fullNameItemView(UserRepoResponse response) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(Const.PADDING_MEDIUM),
        child: Text('=> ${response.fullName}'),
      ),
    );
  }
}
