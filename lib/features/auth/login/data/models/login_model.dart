class LoginModel {
  String? status;
  String? message;
  Data? data;

  LoginModel.fromJson(Map<String,dynamic>json){

    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);

  }
}


class Data {

  String? id;
  String? name;
  String? email;
  String? phone;
  String? token;

  Data.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }
}