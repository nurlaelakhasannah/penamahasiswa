import 'dart:async';
import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;

import 'package:penamahasiswa/Utils/bareir_container.dart';
import 'package:penamahasiswa/Utils/screen_config.dart';
import 'package:penamahasiswa/register_mode.dart';
import 'package:penamahasiswa/views/v_index.dart';
import 'package:penamahasiswa/views/v_login.dart';
import 'package:pigment/pigment.dart';

class ViewRegister extends StatefulWidget {
  @override
  _ViewRegisterState createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  RegisterModel registerModel =null;
  bool visiblePassword = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _namalengkapController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: Stack(
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
                      style: TextStyle(
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
                          controller: _usernameController,
                          decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                          controller: _namalengkapController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Nama Lengkap",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                          obscureText: visiblePassword,
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
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
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(                          
                          onPressed: () {                            
                            RegisterModel.connectApiRegister(_usernameController.text, _emailController.text, _passwordController.text, _namalengkapController.text).then((value) {
                               registerModel = value;                              
                               setState((){});
                            });
                            if(registerModel!=null){                                
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewLogin()));
                            }
                            
                           
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Index()));                            
                          },
                          splashColor: Colors.white,
                          color: Pigment.fromString("#4388ff"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "DAFTAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenConfig.blockHorizontal * 4,
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
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sudah Punya Akun ?  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewLogin())),
                    child: Text(
                      "Login disini..",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
