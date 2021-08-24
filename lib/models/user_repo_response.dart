class UserRepoResponse {
  String? _fullName;

  String? get fullName => _fullName;

  UserRepoResponse({
    String? fullName}) {
    _fullName = fullName;
  }

  UserRepoResponse.fromJson(dynamic json) {
    _fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['full_name'] = _fullName;
    return map;
  }

}