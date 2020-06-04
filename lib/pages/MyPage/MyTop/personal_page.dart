import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/%20myjump/mytop_provider.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTopProvider provider = Provider.of<MyTopProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:Text(
          "${provider.basic.basicName}"
        )
      ),
      body: PerData(),
    );
  }
}

class PerData extends StatelessWidget {
  const PerData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     MyTopProvider provider = Provider.of<MyTopProvider>(context);
     List<BasicInfo> basicInfo = List<BasicInfo>();
     basicInfo = provider.basicInfo;
    return ListView.separated(
      itemBuilder: (context,index){
        if (index == 1) {
          return ListTile(
            leading: Text(
              "${provider.basicInfo[1].basicType}",
            ),
            trailing: ClipOval(
              child: Image.network(
                "http://www.3tqq.com/uploadfile/2020/02/202002281100172931.jpg",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              )
            )
          );
        }else if (index == 2) {
          return ListTile(
            leading: Text(
              "${provider.basicInfo[2].basicType}",
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right), 
              onPressed:(){}
            ),
          );
        }else if(index == 3){
          return ListTile(
            leading: Text(
              "${provider.basicInfo[3].basicType}",
            ),
            title: Text(
              "*** ****6032"
            ),
          );
        }else{
          return Container();
        }
      }, 
      separatorBuilder: (context,index){
        if (index == 0){
          return Container(
            padding: EdgeInsets.only(left:6),
            color: Colors.grey[200],
            alignment: Alignment.centerLeft,
            height: 40,
            child: Text(
              "${provider.basicInfo[index].basicType}"
            ),
          );
        }else{
          return Divider();
        }
      }, 
      itemCount: basicInfo.length,
    );
  }
}
