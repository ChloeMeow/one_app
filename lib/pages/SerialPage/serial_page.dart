import 'package:flutter/material.dart';
import 'package:one_app/pages/SerialPage/serialfive_page.dart';
import 'package:one_app/pages/SerialPage/serialfour_page.dart';
import 'package:one_app/pages/SerialPage/serialone_page.dart';
import 'package:one_app/pages/SerialPage/serialthree_page.dart';
import 'package:one_app/pages/SerialPage/serialtwo_page.dart';


class SerialPage extends StatefulWidget {
  SerialPage({Key key}) : super(key: key);

  @override
  _SerialPageState createState() => _SerialPageState();
}

class _SerialPageState extends State<SerialPage> with SingleTickerProviderStateMixin{

  TabController tabController;
  final List<Tab> titleTabs = <Tab>[
    Tab(text:"2020"),
    Tab(text:"2019"),
    Tab(text:"2018"),
    Tab(text:"2017"),
    Tab(text:"2016"),
  ];
  
  @override
  void initState(){
    tabController = TabController(length: 5, vsync: this)
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
          }
        }
      });
  }

    @override
  Widget build(BuildContext context) { 
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: TabBar(
            controller: tabController,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              fontSize:14
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black
            ),
          tabs: titleTabs,
        ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black
              ), 
              onPressed: (){}
            )
          ],
        ),
      body: TabBarView(
        children: <Widget>[
          SerialOnePage(),
          SerialTwoPage(),
          SerialThreePage(),
          SerialFourPage(),
          SerialFivePage(),
        ],
        controller: tabController,
      ), 
    );
  }
}