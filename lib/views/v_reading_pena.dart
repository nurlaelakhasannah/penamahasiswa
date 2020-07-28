import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penamahasiswa/Utils/screen_config.dart';

class ViewReadingPena extends StatefulWidget {
  @override
  _ViewReadingPenaState createState() => _ViewReadingPenaState();
}

class _ViewReadingPenaState extends State<ViewReadingPena> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "assets/polindra.png",
                        width: ScreenConfig.blockHorizontal * 30,
                        fit: BoxFit.fitHeight,
                        height: ScreenConfig.blockHorizontal * 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "Polindra bisa Belajar #dirumahaja",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenConfig.blockHorizontal * 5),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(LineIcons.eye,size: 18,),
                      SizedBox(width: 6,),
                      Text("6.000",style: TextStyle(fontSize: 14),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(LineIcons.star,size: 18,),
                      SizedBox(width: 6,),
                      Text("6.000",style: TextStyle(fontSize: 14),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(LineIcons.navicon,size: 18,),
                      SizedBox(width: 6,),
                      Text("6.000",style: TextStyle(fontSize: 14),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 3,),
            Divider(color: Colors.black,),
            SizedBox(height: 15,),
            Text("“Din, ada Devi tuh di depan nyariin kamu katanya, ditemuin gih. Dah nungguin dari tadi.” Sahut Devi kepada Dinda yang sedang mengerjakan tugas sekolah di rumah Dinda. \n"
    "“Bi surti, bilang aja aku gak ada, lagi keluar apa cari alasan lain gitu.” Pinta Dinda pada Bi Surti yang bekerja di rumahnya.\n"
    "“Iya, Non.”\n"
    "“Kamu kenapa kaya gitu sama Devi? Dia sudah datang jauh-jauh malah kamu gituin. Devi itu anak baik lho, Din.”\n"
    "“Iya dari memang luarnya keliatan baik, manis, ramah. Tapi apa hanya itu saja kamu mengukur sifat seseorang? Dari luar memang manis. Tapi dalamnya tuh pahit.”\n “Pahit gimana maksudnya?”"
                "\n“Devi itu sering ngomongin keburukan temannya sendiri di belakang orangnya. Banyak pokoknya, yang gak bisa aku jelasin ke kamu."
                "\n“Beda sama kamu, lihatlah kamu ini. Judes, ceplas-ceplos kalo ngomong sama aku.\n Tapi hatimu tulus, Tin, bukan baik di luar tapi dalamnya busuk. Aku gak butuh kawan yang tampilan luar orang dalam berteman.” Jelas Dinda.",)
          ],
        ),
      ),
    );
  }
}
