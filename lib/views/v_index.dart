import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penamahasiswa/views/v_create_pena.dart';
import 'package:penamahasiswa/views/v_home.dart';
import 'package:penamahasiswa/views/v_profile.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  selectView(){
    if(_selectedIndex==0){
      return ViewHome();
    }else if(_selectedIndex==1){
      return  ViewCreatePena();
    }else if(_selectedIndex==2){
      return ViewProfile();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectView(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                curve: Curves.bounceIn,

                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.blue,

                tabs: [
                  GButton(

                    icon: LineIcons.home,
                    text: 'Home',
                  ),

                  GButton(
                    icon: LineIcons.pencil,
                    text: 'Tulis Pena',
                  ),

                  GButton(

                    icon: LineIcons.user,
                    text: 'Profile',
                  ),

                ],
                selectedIndex: _selectedIndex,
                onTabChange: (Index) {
                  setState(() {
                    _selectedIndex = Index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}