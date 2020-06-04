import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/Findjump_page/topic_detail.dart';

import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/findjump/toppicd_provider.dart';

import 'package:provider/provider.dart';

class TopicList extends StatelessWidget {
  const TopicList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Topic> topic = List<Topic>();
    topic = provider.topic;
    return ListView.builder(
      itemCount: topic.length,
      itemBuilder: (context,index){
        return Container(
          padding: EdgeInsets.only(
            top:12,
            right:8,
            bottom:12,
            left:12
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=> MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => TopicdProvider(),
                      )
                    ],
                    child: TopicDetail(),
                  ),
                )
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12)
                ),
              ),
              child:Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        "${provider.topic[index].topUrl}",
                        width: 450,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top:175,
                        left: 15,
                        child: Text(
                          "#专题",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey[200],
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 15,
                    ),
                    child:Text("${provider.topic[index].toptitle}"),
                  )
                ],
              )
            ),
          ),
        );
      }
    );
  }
}