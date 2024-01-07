class UesrModel {
  String? email;
  String? password;
  String? name;
  String? avatar;
  String? role;
  int? id;

  UesrModel(
      {this.email, this.password, this.name, this.avatar, this.role, this.id});

  UesrModel.fromJson(Map<dynamic, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['avatar'] = avatar;
    data['role'] = role;
    data['id'] = id;
    return data;
  }
}
