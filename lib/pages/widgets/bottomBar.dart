import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/find_page.dart';
import 'package:one_app/pages/HomePage/home_page.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:provider/provider.dart';


//无Icon底部导航栏写法
class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.selectIndex, int currentIndex}) : super(key: key);
  final int selectIndex;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<bool> selected = List<bool>();
  List<String> selectItems = List<String>();

  @override

  @override
  void initState() { 
    super.initState();
    for (var i = 0; i < 4; i++){
      selected.add(false);
    }
    selected[widget.selectIndex] = true;
  }

  @override
  void dispose() { 
    super.dispose();
  }

  tapItem(index){
    switch(index){
      case 0:
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
            builder: (context) => HomePage(selIndex: index,), 
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
                selIndex: index,
              ),
            )
          ), 
          ModalRoute.withName("Home"),
      );
      break;
      case 2:
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
            builder: (context) => HomePage(
              selIndex: index,
            )
          ), 
          ModalRoute.withName("Home"),
      );
      break;
      case 3:
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
            builder: (context) => HomePage(
              selIndex: index,
            )
          ), 
          ModalRoute.withName("Home"),
      );
      break;
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: genBtmTextWidget(
              "首页",
              selected[0],(){tapItem(0);
            }),
          ),
          Expanded(
            flex: 1,
            child: genBtmTextWidget(
              "发现",
              selected[1],(){tapItem(1);
            }),
          ),
          Expanded(
            flex: 1,
            child:genBtmTextWidget(
              "道具",
              selected[2],(){ tapItem(2);
            }),
          ),
          Expanded(
            flex: 1,
            child:genBtmTextWidget(
              "我的",
              selected[3],(){tapItem(3);
            }),
          )
        ],
      ),
    );
  }
}
          
genBtmTextWidget(String context, bool isSelected, tapFunc) {
  return FlatButton(
    onPressed: (){
      tapFunc();
    },
    child: IconText(
      text:("$context"),
      icon: Icon(Icons.pets),
    )
  );
}

class IconText extends StatelessWidget {
  const IconText({Key key, this.icon, this.text}) : super(key: key);
  final Icon icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(
              color:Colors.black87,
              fontSize: 14
            ),
          )
        ],
      ),
    );
  }
}