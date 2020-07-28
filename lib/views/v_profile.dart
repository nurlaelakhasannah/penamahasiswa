// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penamahasiswa/Utils/screen_config.dart';
import 'package:penamahasiswa/views/v_login.dart';
import 'package:penamahasiswa/views/v_reading_pena.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {  
  logout() async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.clear();
      sharedPreferences.commit();
  }

  @override  
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // title: Text("Tulis Pena"),
        actions: <Widget>[
          FlatButton(onPressed: (){            
            logout();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewLogin()));
          }, 
          child: Text("Logout", 
          style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 10,
              left: 0,
              right: 0,
              bottom: ScreenConfig.blockVertical * 60,
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/Logo.png",
                  height: 120,
                  width: 120,
                ),
              )),
          Positioned(
              top: ScreenConfig.blockVertical * 23,
              left: 15,
              right: 15,
              bottom: 0,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Center(child: Text("NURLAELA KHASANNAH",style: TextStyle(letterSpacing: 2,fontSize: ScreenConfig.blockHorizontal*4,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 6,),
                  Center(child: Text("Mahasiswi",style: TextStyle(letterSpacing: 2,fontSize: ScreenConfig.blockHorizontal*2.5),)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("1212",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Bacaan",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("400",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Cerita Pena",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("1M",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Followers",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(color: Colors.black,),
                  SizedBox(height: 20,),
                  Text("Tentang Saya",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2),),
                  SizedBox(height: 15,),
                  Text("Saya adalah mahasiswi semester 4 Politeknik Negeri Indramayu, Program studi D3 Teknik Informatika",style: TextStyle(letterSpacing: 1.5),),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Daftar Bacaan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenConfig.blockHorizontal * 4),
                      ),
                      Text(
                        "Lihat semua",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: ScreenConfig.blockHorizontal * 4),
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: ScreenConfig.blockHorizontal * 50,
                    width: double.infinity,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(right: 20, top: 10),
                                  child: InkWell(
                                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewReadingPena())),
                                    child: Container(
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Stack(
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/polindra.png",
                                                  width: ScreenConfig
                                                      .blockHorizontal *
                                                      25,
                                                  fit: BoxFit.cover,
                                                  height: ScreenConfig
                                                      .blockHorizontal *
                                                      25,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Flexible(
                                              child: Text(
                                                "Polindra Bisa belajar #dirumahaja",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,),
                                              )),
                                          SizedBox(height: 4,),
                                          RatingBar(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 14,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(height: 6,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(LineIcons.eye,size: 14,),
                                              SizedBox(width: 6,),
                                              Text("6.000",style: TextStyle(fontSize: 12),)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
