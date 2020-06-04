import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/%20myjump/mytop_provider.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTopProvider provider = Provider.of<MyTopProvider>(context);
    List<MesInfo> mesInfo = List<MesInfo>();
    mesInfo = provider.mesInfo;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "${provider.mesNews.newsName}",
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context,index){
          return ListTile(
            leading: Icon(mesInfo[index].mesIcon),
            title: Text("${mesInfo[index].mesType}"),
          );
          
        }, 
        separatorBuilder: (context,index){
          return Divider();
        }, 
        itemCount: mesInfo.length,
      ),
    );
  }
}