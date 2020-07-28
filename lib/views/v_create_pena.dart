import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class ViewCreatePena extends StatefulWidget {
  @override
  _ViewCreatePenaState createState() => _ViewCreatePenaState();
}

class _ViewCreatePenaState extends State<ViewCreatePena> {

  ZefyrController _zefyrController;
  FocusNode focusNode=FocusNode();

  @override
  void initState() {
    final document=loadDocument();
    _zefyrController=ZefyrController(document);
    super.initState();
  }

  loadDocument(){
    final Delta delta=Delta()..insert("Tulis ceritamu disini\n");
    return NotusDocument.fromDelta(delta);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tulis Pena"),
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text("Simpan", style: TextStyle(color: Colors.white),))
        ],
      ),

      body: ZefyrScaffold(
          child: ZefyrEditor(
              padding: EdgeInsets.all(16),
              controller: _zefyrController, focusNode: focusNode)),
    );
  }
}
