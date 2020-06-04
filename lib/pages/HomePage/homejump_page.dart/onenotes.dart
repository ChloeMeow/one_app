import 'package:flutter/material.dart';

class OneNotes extends StatelessWidget {
  const OneNotes(Future<bool> showToast, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        appBar:AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left), 
            onPressed: (){
              Navigator.of(context).pop();
            }
          ),
          centerTitle: true,
          title: Text("小记"),
        ),
        body: NotesShort(),
      );
    
  }
}

class NotesShort extends StatelessWidget {
  const NotesShort({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                //Navigator.push(context, route)
              },
              child: Image.network(
                "https://www.fun-taiwan.com/Images/HousePhotos/650690.jpg",
                width: 410,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 130,
              left: 180,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius:BorderRadius.all(Radius.circular(100)),
                ),
                    child: Icon(
                  Icons.wallpaper,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ),
            Positioned(
              top: 190,
              left: 170,
              child: Text(
                "点击更改图片",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Chip(
                avatar: Icon(
                  Icons.add_location,
                  color: Colors.blueAccent
                ),
                label: Text("天河"),
              ),
              Text("罗素"),
            ],
          )
        ),
        Padding(
          padding: EdgeInsets.only(
            left:30,
            right:30),
          child: Text(
            "采薇采薇，薇亦作止。曰归曰归，岁亦莫止。 靡室靡家，猃狁之故。不遑启居，猃狁之故。采薇采薇，薇亦柔止。曰归曰归，心亦忧止。 忧心烈烈，载饥载渴。我戍未定，靡使归聘。",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(
              height: 1,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left:85,
            right:85,
            top: 170
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OutlineButton(
                shape: CircleBorder(
                  side:BorderSide(
                    style: BorderStyle.solid
                  )
                ),
                onPressed: (){}, 
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.inbox,
                        color: Colors.black26,
                      ),
                      Text(
                        "保存",
                        style: TextStyle(
                          color: Colors.black12
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              OutlineButton(
                shape: CircleBorder(
                  side:BorderSide(
                    style: BorderStyle.solid
                  )
                ),
                onPressed: (){}, 
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.black26,
                      ),
                      Text(
                        "分享",
                        style: TextStyle(
                          color: Colors.black12
                        ),
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}