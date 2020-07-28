
import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import 'package:penamahasiswa/Utils/bareir_container.dart';
import 'package:penamahasiswa/Utils/screen_config.dart';
import 'package:penamahasiswa/views/v_home.dart';
import 'package:penamahasiswa/views/v_index.dart';
import 'package:penamahasiswa/views/v_register.dart';
import 'package:pigment/pigment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ViewLogin extends StatefulWidget {
  @override
  _ViewLoginState createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {

  bool visiblePassword = true;
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<ScaffoldState> key=GlobalKey<ScaffoldState>();
  
  
  @override
  void initState() {
    super.initState();
  }

  userlogin(String username,password) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var apiLogin = "https://penamahasiswa.000webhostapp.com/login";
    var response = await http.post(apiLogin,body: {
      "username":username,
      "password":password
    });
    var jsonData = json.decode(response.body); 
    print(jsonData["status"]);
    // print(response.body);
    if(jsonData['code']==200){
      var jsonData = json.decode(response.body);      
      setState(() {
        sharedPreferences.setString("username", jsonData['username']);
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Index()));
    }else{      
      // Scaffold.of(context).showSnackBar(snackbar);
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
        key: key,
      body: Hero(
          tag: 'login',
          child: Container(
            height: ScreenConfig.screenHeight,
            width: ScreenConfig.screenWidth,
//            color: Pigment.fromString("#ff9a00"),
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -MediaQuery.of(context).size.height * .16,
                    right: -MediaQuery.of(context).size.width * .5,
                    child: BezierContainer()),
                Positioned(
                  left: 20,
                  right: 20,
                  top: -19,
                  bottom: 20,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/login.png",
                            width: ScreenConfig.blockHorizontal * 70,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Pena Mahasiswa",
                            textAlign: TextAlign.center,
                            style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenConfig.blockHorizontal * 5),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                    labelText: "Username",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: passwordController,
                                obscureText: visiblePassword,
                                textInputAction: TextInputAction.go,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: visiblePassword
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                        onPressed: () {
                                          setState(() {
                                            visiblePassword = !visiblePassword;
                                          });
                                        }),
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: FlatButton(
                          //       onPressed: () {},
                          //       child: Text("Lupa Password ?")),
                          // ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: RaisedButton(
                                onPressed:(){                                                                    
                                  userlogin(usernameController.text,passwordController.text);
                                } ,
                                splashColor: Colors.white,
                                color: Pigment.fromString("#4388ff"),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                      ScreenConfig.blockHorizontal * 4,
                                      letterSpacing: 3),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Belum punya akun ?  ",style: TextStyle(fontWeight: FontWeight.bold),),
                        InkWell(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRegister())),
                            child: Text("Daftar disini..",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),

                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          
    );
  }
}
