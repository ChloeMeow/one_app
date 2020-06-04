import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/find_page.dart';
import 'package:one_app/pages/HomePage/home_page.dart';
import 'package:one_app/pages/MyPage/my_page.dart';
import 'package:one_app/pages/SerialPage/serial_page.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/serial_provider.dart';
import 'package:provider/provider.dart';

//import 'package:one_app/pages/providers/article_provider.dart';
//import 'package:one_app/pages/widgets/bottomBar.dart';
//import 'package:one_app/pages/widgets/index_page.dart';
//import 'package:provider/provider.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MaterialApp(home: MyApp()),);


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  PageController _pageController;
  
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


  final List<Widget> pages = [
    HomePage(),
    FindPage(),
    SerialPage(),
    MyPage(),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(
       brightness: Brightness.light,
       primaryColor: Colors.white,
       iconTheme: IconThemeData(color: Colors.black)
     ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ArticleProvider(),
          ),
            ChangeNotifierProvider(create: (context) => FindProvider(),
          ),
            ChangeNotifierProvider(create: (context) => SerialProvider(),
          ),
        ],
        child:Scaffold(
          body: PageView(
          controller: _pageController,
          children: pages,
          physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bottomTabs,
            currentIndex: currentIndex,
            selectedItemColor: Colors.black,
            onTap: (index){
              _pageController.jumpToPage(index);
              setState(() {
                currentIndex = index;
              });
            },
          )
        ),
      )
   );
 }


//无Icon底部导航栏写法
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor:Colors.black,
      ),
      home: Scaffold(
        body: PageView(
          controller: _controller,
        ),
      )
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ArticleProvider(),
          ),
        
        ],
        child:IndexPage(),
         Scaffold(
          body:HomePage(),
          bottomNavigationBar: IndexPage(),
          //bottomNavigationBar:BottomSafeBar(
           // selIndex: selIndex,
          //)
        )
      )
    );
  }*/
}




/*class BottomSafeBar extends StatelessWidget {
  const BottomSafeBar({Key key,@required this.selIndex}) : super(key: key);
  final int selIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: BottomAppBar(
          child:Container(
            padding: EdgeInsets.only(top:5),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 60,
            child: BottomBar(
              selectIndex: 0,
            ),
          )
        )
      ),
    );
  }
}*/
