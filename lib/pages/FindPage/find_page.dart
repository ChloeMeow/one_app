import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/author_list.dart';
import 'package:one_app/pages/FindPage/film_list.dart';
import 'package:one_app/pages/FindPage/graphic_list.dart';

import 'package:one_app/pages/FindPage/hots_list.dart';
import 'package:one_app/pages/FindPage/music_list.dart';
import 'package:one_app/pages/FindPage/notes_list.dart';
import 'package:one_app/pages/FindPage/qa_list.dart';
import 'package:one_app/pages/FindPage/radios_list.dart';
import 'package:one_app/pages/FindPage/reads_list.dart';
import 'package:one_app/pages/FindPage/topic_list.dart';



class FindPage extends StatefulWidget {
  FindPage({Key key,this.selIndex, int currentIndex}) : super(key: key);
  final int selIndex;
  
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> with SingleTickerProviderStateMixin{
  TabController tabController;
  final List<Tab> titleTabs = <Tab>[
    Tab(text:"阅读"),
    Tab(text:"图文"),
    Tab(text:"专题"),
    Tab(text:"热榜"),
    Tab(text:"问答"),
    Tab(text:"音乐"),
    Tab(text:"影视"),
    Tab(text:"电台"),
    Tab(text:"小记"),
    Tab(text:"作者"),
  ];


  @override
  void initState() { 
    super.initState();
    tabController = TabController(vsync: this, length: 10)
      ..addListener((){
        if(tabController.index.toDouble() == tabController.animation.value){
          switch(tabController.index){
            case 0:
              print(0);
              break;
            case 1:
              print(1);
              break;
            case 2:
              print(2);
              break;
            case 3:
              print(3);
              break;
            case 4:
              print(4);
              break;
            case 5:
              print(5);
              break;
            case 6:
              print(6);
              break;
            case 7:
              print(7);
              break;
            case 8:
              print(8);
              break;
            case 9:
              print(9);
              break;
          }
        }  
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TabBar(
          controller: tabController,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            fontSize:14
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              style:BorderStyle.none
            )
          ),
          tabs: titleTabs,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: (){}
          )
        ],
      ),
      body: TabBarView(
        children:<Widget>[
          ReadsList(),
          GraphicList(),
          TopicList(),
          HotsList(),
          QaList(),
          MusicList(),
          FilmList(),
          RadiosList(),
          NotesList(),
          AuthorList(),
        ],
        controller: tabController,
      ),
    );
  } 
}
  