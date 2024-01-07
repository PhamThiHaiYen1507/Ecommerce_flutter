import 'package:commons/commons.dart';

class LoginData extends ExtendModel {
  String? accessToken;
  String? refreshToken;

  LoginData({this.accessToken, this.refreshToken});

  LoginData.fromJson(Map<dynamic, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
