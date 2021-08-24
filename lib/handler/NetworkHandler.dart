import 'package:api_test/models/user_repo_response.dart';
import 'package:dio/dio.dart';

class NetworkHandler {
  static Dio? _dioNetwork;

  NetworkHandler() {
    _dioNetwork = Dio();
  }

  static Dio getDioInstance() {
    if (_dioNetwork == null) return _dioNetwork = Dio();
    return _dioNetwork!;
  }

  static Future<List<UserRepoResponse>> makeGetCall(String url) async {
    final response = await getDioInstance().get(url);
    List<UserRepoResponse> responseList = [];

    for (var item in response.data) {
      responseList.add(UserRepoResponse.fromJson(item));
    }
    return responseList;
  }
}
