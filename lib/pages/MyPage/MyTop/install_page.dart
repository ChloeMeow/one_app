import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/%20myjump/mytop_provider.dart';

import 'package:provider/provider.dart';

class InstallPage extends StatelessWidget {
  const InstallPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTopProvider provider = Provider.of<MyTopProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("${provider.install.instName}"),
      ),
      body: InstList(),
    );
  }
}

class InstList extends StatelessWidget {
  InstList({Key key }) : super(key: key);
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    MyTopProvider provider = Provider.of<MyTopProvider>(context);
    List<Category> category = List<Category>(); 
    List<OptType> optType = List<OptType>();
    List<FeedBack> feedBack = List<FeedBack>();
    List <VerSion> verSion = List<VerSion>();
    
    category = provider.instSetup.category;
    optType = provider.instSetup.optType;
    feedBack = provider.instSetup.feedBack;
    verSion = provider.instSetup.verSion;

    return ListView.separated(
      itemBuilder: (context,index){
        if(index == 1 || index ==2 || index == 3 || index ==5 || index ==6 || index ==7){
          return ListTile(
            leading: Text("${optType[index].optItem}"),
            trailing: Checkbox(
              value: _switchSelected, 
              onChanged: (value){
                _checkboxSelected = value;
              }
            ),
          );
        } else if(index == 9 || index ==10 || index ==11 || index ==12 || index ==13 || index ==15){
          return ListTile(
            leading: Text("${feedBack[index].feedItem}"),
            trailing: IconButton(
              icon: Icon(feedBack[index].feedIcon), 
              onPressed: (){}
            )
          );
        } else if(index ==16) {
          return ListTile(
            leading: Text("${verSion[index].verItem}"),
            trailing: Text(
              "${verSion[index].verNumber}"
            )
          );
        } else {
          return ListTile(
            leading: Text("${provider.instSetup.quitItem}"),
          );
        }
      }, 
      separatorBuilder: (context,index){
        if (index == 0 || index ==4 || index ==8 || index ==14){
          return Container(
            padding: EdgeInsets.only(left:6),
            alignment: Alignment.centerLeft,
            height: 40,
            color:Colors.grey[200],
            child:Text(
              "${category[index].cateItem}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          );
        }else if(index ==17){
          return Container(
            height: 20,
            color: Colors.grey[200]
          );
        }
        else {
          return Divider();
        }
        
      }, 
      itemCount:17,
    );
  }
}