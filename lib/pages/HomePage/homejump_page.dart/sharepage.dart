import 'package:flutter/material.dart';

class SharePage extends StatelessWidget {
  const SharePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //取消自带箭头返回按钮
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close), 
            onPressed: (){
              Navigator.pop(context);
            }
            )
        ],
      ),
      body: Container(
        height: 600,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.camera,
                size: 34,
              ), 
              onPressed: (){}
            ),
            IconButton(
              icon: Icon(
                Icons.speaker_notes,
                  size: 34,
              ), 
              onPressed: (){}
            ),
            IconButton(
              icon: Icon(
                Icons.face,
                  size: 34,
              ), 
              onPressed: (){}
            ),
            IconButton(
              icon: Icon(
                Icons.visibility,
                size: 34,
              ), 
              onPressed: (){}
            ),
            IconButton(
              icon: Icon(
                Icons.insert_link,
                  size: 34,
              ), 
              onPressed: (){}
            ),
          ]
        ),
      ),
    );
  }
}