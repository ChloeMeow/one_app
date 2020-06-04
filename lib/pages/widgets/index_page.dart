import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/find_page.dart';
import 'package:one_app/pages/HomePage/home_page.dart';

import 'package:one_app/pages/MyPage/my_page.dart';
import 'package:one_app/pages/SerialPage/serial_page.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:provider/provider.dart';

//跳转后底部导航栏消失，待解决
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
 int currentIndex = 0;
 var currentPage;
 
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      
      icon: Icon(Icons.alternate_email),
      title: Text("首页"),
      activeIcon: Icon(Icons.trip_origin),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.border_clear),
      title: Text("发现"),
      activeIcon: Icon(Icons.dashboard)
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.import_contacts),
      title: Text("连载"),
      activeIcon: Icon(Icons.local_library),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      title: Text("我的"),
      activeIcon: Icon(Icons.person),
    ),
  ];


  final List pages = [
    HomePage(),
    FindPage(),
    SerialPage(),
    MyPage(),
  ];

  @override
  void initState() {
    currentPage = pages[currentIndex];
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState((){
           // currentIndex = index;
            //currentPage = pages[currentIndex];
             switch(index){
              case 0:
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => ArticleProvider(),
                        ),
                      ],
                      child: HomePage(currentIndex: index,),
                    )
                  ), 
                  ModalRoute.withName("Home"),
              );
              break;
              case 1:
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => FindProvider(),
                        )
                      ],
                      child: FindPage(
                        currentIndex: index,
                      ),
                    )
                  ), 
                  ModalRoute.withName("FindPagee"),
              );
              break;
           } });
          
        },
      ),
      body: currentPage,
    );
  }
}

