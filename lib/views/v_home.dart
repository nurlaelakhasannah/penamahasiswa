import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penamahasiswa/Utils/screen_config.dart';
import 'package:penamahasiswa/views/v_reading_pena.dart';

class ViewHome extends StatefulWidget {
  final String username;
 
// Receiving Email using Constructor.
 ViewHome({Key key, @required this.username}) : super(key: key);
  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 35,
              left: 10,
              right: 10,
              child: Center(
                child: Text(
                  "PENA MAHASISWA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenConfig.blockHorizontal * 5),
                ),
              )),
          Positioned(
              top: 60,
              left: 15,
              right:10,
              bottom: 10,
              child: ListView(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  Image.asset(
                    "assets/login.png",
                    width: ScreenConfig.blockHorizontal * 80,
                    fit: BoxFit.fitWidth,
                    height: 150,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pena Terbaru",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenConfig.blockHorizontal * 4),
                      ),
                      Text(
                        "lihat semua",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: ScreenConfig.blockHorizontal * 4),
                      ),
                    ],
                  ),
                  Container(
                    height: ScreenConfig.blockHorizontal * 50,
                    width: double.infinity,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 7,
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
                                                "Polindra Bisa belajar dirumah aja",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
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
                                              Icon(LineIcons.eye,size: 18,),
                                              SizedBox(width: 6,),
                                              Text("6.000",style: TextStyle(fontSize: 14),)
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
                  SizedBox(height: 20,),
                  Text("Pena Terfavorit",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Column(
                    children: <Widget>[
                      AnimationLimiter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: 5,
                          scrollDirection: Axis.vertical,

                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(right: 0, top: 10,bottom: 10),
                                    child:  Container(
                                      height: 120,

                                      child:Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: Card(

                                              )),
                                          Positioned(
                                            top: -10,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              child: Stack(
                                                children: <Widget>[
                                                  Image.asset(
                                                    "assets/polindra.png",
                                                    width: ScreenConfig
                                                        .blockHorizontal *
                                                        20,
                                                    fit: BoxFit.fitHeight,
                                                    height: ScreenConfig
                                                        .blockHorizontal *
                                                        30,
                                                  ),
                                                ],
                                              ),
                                            ),),
                                          Positioned(
                                              left: ScreenConfig.blockHorizontal*26,
                                              top: 20,
                                              bottom: 0,
                                              right: 20,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Mahasiswa Punya Cerita",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2),),
                                                  SizedBox(height: 4,),
                                                  Flexible(child: Text("Bayangkan, anda sudah membuat konten selama berjam-jam atau berhari-hari. Kemudian judulnya dibuat secara asal-asalan, sehingga hanya sedikit yang tertarik membaca.",maxLines:3,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12,letterSpacing: 1),)),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
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
                                                      Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Icon(LineIcons.eye,size: 18,),
                                                            SizedBox(width: 6,),
                                                            Text("7.000",style: TextStyle(fontSize: 14),)
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ))


                                        ],
                                      )
                                    ),

                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
