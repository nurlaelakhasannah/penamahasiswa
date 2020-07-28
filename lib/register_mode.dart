import 'dart:convert';
import 'package:http/http.dart' as http;
class RegisterModel{
  String username;
  String email;
  String password;
  String namalengkap;

  RegisterModel({this.username,this.email,this.password,this.namalengkap});

  factory RegisterModel.createRegisterModel(Map<String, dynamic> object){
    return RegisterModel(username: object['username'],email: object['email'],password: object['password'],namalengkap: object['namalengkap']);
  }
  static Future<RegisterModel> connectApiRegister(String username,String email,String password,String namalengkap) async{
    String apiUrl = "https://penamahasiswa.000webhostapp.com/register";
    var result = await http.post(apiUrl, body:{
      "username":username,
      "password":password,
      "email":email,
      "namalengkap":namalengkap
    });
    var jsonResult;
    jsonResult = json.decode(result.body);
    return RegisterModel.createRegisterModel(jsonResult);
  }

}