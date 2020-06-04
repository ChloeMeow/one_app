import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/onenotes.dart';
import 'package:one_app/pages/MyPage/MyKeep/GraphicColle.dart';
import 'package:one_app/pages/MyPage/MyTop/install_page.dart';

import 'package:one_app/pages/MyPage/MyTop/message_page.dart';
import 'package:one_app/pages/MyPage/MyTop/personal_page.dart';
import 'package:one_app/pages/providers/%20myjump/mytop_provider.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: <Widget>[
          BackgroundFrame(),
          SizedBox(height:10),
          Favorites(),
          SizedBox(height:10),
          MyFocus(),
          SizedBox(height:10),
          SongList(),
          SizedBox(height:10),
          MyReward(),
        ],
      ),
    );
  }
}


class BackgroundFrame extends StatelessWidget {
  const BackgroundFrame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        Stack(
          children: <Widget>[
            Image.network(
              "https://tp.xkodm.com/d/file/bigpic/2019-11-03/23/232218693.jpg",
              width: 400,
              height: 360,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 35,
              left: 5,
              child: IconButton(
                icon: Icon(
                  Icons.filter_tilt_shift,
                  size: 28,
                  color: Colors.white,
                ), 
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MyTopProvider(),
                        ),
                      ],
                      child: InstallPage(),
                        
                      )
                    ),
                  );
                }
              )
            ),
            Positioned(
              top: 30,
              right: 5,
              child: IconButton(
                icon: Icon(
                  Icons.mail_outline,
                  size: 28,
                  color: Colors.white,
                ), 
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MyTopProvider(),
                        ),
                      ],
                      child: MessagePage(),  
                      )
                    ),
                  );
                }
              )
            ),
            Positioned(
              top: 60,
              left: 150,
              child: FlatButton(
                child: ClipOval(
                  child: Image.network(
                    "https://www.kuk8.com/uploads/allimg/170414/1-1F4121446314O.jpg",
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MyTopProvider(),
                        ),
                      ],
                      child: PersonalPage(),   
                      )
                    ),
                  );
                }
              )
            ),
            Positioned(
              top: 140,
              left: 160,
              child: Text(
                "*** **** 6032",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
              )
            ),
            Positioned(
              top: 180,
              left: 133,
              child: GestureDetector(
                onTap: (){
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
                },
                child:Container(
                  margin: EdgeInsets.all(2),
                  width: 138,
                  height: 127,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Image.network(
                            "http://jy.sccnn.com/zb_users/upload/2017/04/remoteimage2_20170413104635_38254.png",
                            width: 135,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            top: 26,
                            left: 13,
                            child: RaisedButton.icon(
                              onPressed: null, 
                              icon: Icon(
                                Icons.colorize,
                                color: Colors.white,
                                size: 22,
                              ), 
                              label: Text(
                                "制作小记",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                )
                              ),
                            )
                          ),
                        ],
                      ),
                      Text(
                        "且视他人之凝目如盏盏……",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize:12
                        ),
                      )
                    ],
                  ),
                )
              )
            )
          ],
        )
      ]
    );
  }
}

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      width: 400,
      height: 110,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom:10),
            alignment: Alignment.topLeft,
            child: Text(
              "我的收藏",
            ),
          ),
          Favoritebutton(),
        ],
      )
    );
  }
}



class Favoritebutton extends StatelessWidget {
  const Favoritebutton ({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap:(){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => ArticleProvider()
                    ),
                  ],
                  child:GraphicColle(),
                )
              )
            );
          },
          child: ButtonColumn(
            icon:Icons.library_add,
            label: "图文"
          ),
        ),
        ButtonColumn(
          icon:Icons.import_contacts,
          label:"文章"
        ),
        ButtonColumn(
          icon:Icons.music_video,
          label:"音乐"
        ),
        ButtonColumn(
          icon:Icons.slideshow,
          label:"影视"
        ),
        ButtonColumn(
          icon:Icons.radio,
          label:"电台"
        ),
      ],
    );
  }
}


class ButtonColumn extends StatelessWidget {
  const ButtonColumn({Key key,this.icon,this.label}) : super(key: key);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color:Colors.black38,
          size: 34
        ),
        Container(
          margin:EdgeInsets.only(top:8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black38,
            )
          ),
        )
      ],
    );
  }
}

class MyFocus extends StatelessWidget {
  const MyFocus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.people_outline),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("我的关注"),
            Text("1")
          ],
        ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}

class SongList extends StatelessWidget {
  const SongList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.play_circle_filled),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("歌单"),
            Text("2")
          ],
        ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}

class MyReward extends StatelessWidget {
  const MyReward({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.money_off),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("我的打赏"),
          ],
        ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}