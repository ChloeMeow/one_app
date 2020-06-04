import 'package:flutter/material.dart';


class TopicCollect extends StatelessWidget {
  const TopicCollect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: TopicShort(),
    );
  }
}

class TopicShort extends StatelessWidget {
  const TopicShort({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: List.generate(
        3, 
        (index){
          return Container(
            padding: EdgeInsets.only(left:8),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        "https://www.jiepaiw.net/wp-content/uploads/2019/11/wxsync-9948290045dda6314804ef1574593300.jpeg",
                        height: 155,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          color: Colors.black12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "VOL2768",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "05May2020",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                Container(
                  padding: EdgeInsets.only(
                    top: 5
                  ),
                  child: Text(
                      "暮雨初收，长川静、征帆夜落。临岛屿、蓼烟疏淡，苇风萧索。几许渔人飞短艇，尽载灯火归村落。遣行客、当此念回程，伤漂泊。",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}