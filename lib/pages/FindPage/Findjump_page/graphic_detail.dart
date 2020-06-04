import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/imgdetails.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/notessquare.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/onenotes.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/sharepage.dart';

import 'package:one_app/pages/providers/article_provider.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:provider/provider.dart';

class GraphicDetail extends StatelessWidget {
  const GraphicDetail({Key key}) : super(key: key);

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
          title: Text("2020/05/19"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.redo),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => SharePage(),
                  )
                );
              }
            )
          ],
        ),
        body: Graphic(),
      );
  }
}

class Graphic extends StatelessWidget {
  const Graphic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticleProvider provider = Provider.of<ArticleProvider>(context);
    return Column(
      children: <Widget>[
        Container(
          height: 530,
          padding: EdgeInsets.all(12),
          child: Card(
            clipBehavior:Clip.antiAlias,
            child:Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom:10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImgDetails(),
                        )
                      );
                    },
                    child: Image.network(
                      "${provider.mainInfo.imgUrl}",
                      width: 500,
                      height: 280,
                      fit: BoxFit.fill,
                    ),
                  )
                ),
                Text(
                  "${provider.mainInfo.usrname}",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize:12
                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                    top:25,
                    right:30,
                    bottom:55,
                    left:30,
                  ),
                  child: Text(
                    "${provider.mainInfo.content}"
                  )
                ),
                Text(
                  "${provider.mainInfo.authorname}",
                  style: TextStyle(
                    color: Colors.
                    black26,fontSize:12
                  )
                ),
              ],
            )
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left:8,
            right:22,
            bottom: 15
          ),
          child: Row(
            children:<Widget>[
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                  create: (context) => FindProvider(),
                                ),
                              ],
                              child: NotesSquare(),
                            )
                          )
                        );
                      },
                      icon: Icon(
                        Icons.explore,
                        color:Colors.black,
                        size: 26,
                      ),
                      label: Text(
                        "${provider.mainInfo.userrecord}",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12
                        )
                      ),
                    )
                  ]
                ),
              ),
              //小记按钮
              Expanded(
                flex:2,
                child: IconButton(
                  icon: Icon(
                    Icons.create,
                    color:Colors.black26,
                    size: 30,
                  ), 
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => OneNotes(
                          Fluttertoast.showToast(
                            msg: "一个：您可以修改图片和文字来创建自己\n的小记",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 14,
                          )
                        ),
                      )
                    );
                  }
                )
              ),
              //笔记按钮
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: !provider.mainInfo.ifBookmark
                    ? Icon(
                        Icons.bookmark_border,
                        color:Colors.black26,
                        size: 30, 
                      )
                    : Icon(
                        Icons.bookmark,
                        color:Colors.orangeAccent,
                        size: 30, 
                      ),
                  onPressed: (){
                    provider.tapBok();
                    //弹出提示
                    /*showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("一个：已收藏至个人中心"),
                      )
                    );*/
                    /*Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => TopicCollect(),
                      )
                    );*/
                  }
                ),
              ),
              //红心收藏
              Expanded(
                flex: 3,
                child: FlatButton.icon(
                  onPressed: (){
                    provider.tapFav();
                  }, 
                  icon: !provider.mainInfo.ifFaved 
                    ? Icon(
                        Icons.favorite_border,
                        color:Colors.black26,
                        size: 30,
                      ) 
                    : Icon(
                        Icons.favorite,
                        color:Colors.redAccent,
                        size: 30,
                      ),
                  label: Text(
                    "${provider.mainInfo.mainfav}",
                    style: TextStyle(
                      color: Colors.black26,
                    )
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                  Icons.repeat,
                  color:Colors.black26,
                  size: 30,
                ), 
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => SharePage(),
                      )
                    );
                  }
                )
              ),
            ]
          ),
        )
      ],
    );
  }
}