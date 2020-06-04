import 'package:flutter/material.dart';
import 'package:one_app/pages/HomePage/sliverfour_page.dart';
import 'package:one_app/pages/HomePage/sliverone_page.dart';
import 'package:one_app/pages/HomePage/sliverthree_page.dart';
import 'package:one_app/pages/HomePage/slivertwo_page.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, int currentIndex, selIndex}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController =  PageController();
  final List pages = [
    SliverOnePage(),
    SliverTwoPage(),
    SliverThreePage(),
    SliverFourPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context,index){
          return pages[index];
        }
      )
    );
  }
}