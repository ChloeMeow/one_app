import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/findjump/notesd_provider.dart';
import 'package:provider/provider.dart';

class NotesDetail extends StatelessWidget {
 const NotesDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotesdProvider provider = Provider.of<NotesdProvider>(context);
    return Scaffold(
       backgroundColor: Colors.white,
        appBar:AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              provider.record.comeIcon,
              size: 32,
              color: Colors.black26,
            ), 
            onPressed: (){
              Navigator.of(context).pop();
            }
          ),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: (){
                provider.tapFav();
              }, 
              icon: !provider.record.ifFav
                ? Icon(
                  provider.record.notIcon,
                  color: Colors.black26,
                  size: 26,
                )
                : Icon(
                  provider.record.favIcon,
                  color: Colors.redAccent,
                  size: 26,
                ),
              label: Text(
                "${provider.record.recordFav}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black26,
                )
              )
            ),
            IconButton(
              icon: Icon(
                provider.record.downIcon,
                color: Colors.black26,
                size:26
              ), 
              onPressed: (){
                provider.tapDown();
              }
            )
          ],
        ),
        body: NotesContent(),
      );
    
  }
}

class NotesContent extends StatelessWidget {
  const NotesContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     NotesdProvider provider = Provider.of<NotesdProvider>(context);
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.network(
                "${provider.record.recordImg}",
                width: 410,
                height: 250,
                fit: BoxFit.cover,
              ),
            Positioned(
              right: 6,
              bottom: 6,
              child: Text(
                "${provider.record.recordmark}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white54
                )
              ),
            ),
          ],
        ),
       
        Container(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 60,
            left:15,
            right:15
          ),
          child: Text(
            "${provider.record.recordInfo}",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(
              height: 2,
              fontSize: 14
            ),
          ),
        ),
        
        Container(
          
          child: Text(
            "${provider.record.recordAuthor}",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38
            ),
          )
        )
      ],
    );
  }
}