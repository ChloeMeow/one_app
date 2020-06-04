import 'package:flutter/material.dart';

class ImgDetails extends StatelessWidget {
  const ImgDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body:Container(
              padding: EdgeInsets.only(
                top:120,
                left: 10,
                right: 10,
              ),
              color: Color.fromARGB(30, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "VOL.2775",
                    style: TextStyle(
                      color:Colors.white
                    ),
                    
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top:10,
                      bottom:10
                    ),
                    child: Image.network(
                      "https://www.jiepaiw.net/wp-content/uploads/2019/11/wxsync-9948290045dda6314804ef1574593300.jpeg",
                      height: 250,
                      width: 420,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "摄影|Jocky",
                    style: TextStyle(
                      color:Colors.white
                    ),
                  
                  )
                ],
              ),
            ),
          
        ),
    );
    
  }
}