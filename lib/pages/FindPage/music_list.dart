import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/FindPage/Findjump_page/music_detail.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/findjump/musicd_provider.dart';

import 'package:provider/provider.dart';

class MusicList extends StatelessWidget {
  const MusicList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: <Widget>[
          MusicDate(),
          MusicContent(),  
        ],
      ),
    );
  }    
}


class MusicDate extends StatelessWidget {
  const MusicDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            minTime: DateTime(2012, 10, 5),
            maxTime: DateTime(2020, 9, 7), onChanged: (date) {
              print('change $date');
            }, onConfirm: (date) {
              print('confirm $date');
            }, currentTime: DateTime.now(), locale: LocaleType.zh);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("2020年04月"),
            Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }
}

class MusicContent extends StatelessWidget {
  const MusicContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Music> music = List<Music>();
    music = provider.music;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: music.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => MusicdProvider(),
                    ),
                  ],
                  child: MusicDetail(),
                    
                  )
                ),
              );
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(200.0)),
              ),
              child:ListTile(
                title: Container(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    "${provider.music[index].musictitle}",
                    style: TextStyle(
                      height:1.5
                    ),
                  ),
                ),
                subtitle: Text(
                  "${provider.music[index].musicsubtitle}",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${provider.music[index].musicUrl}",
                    width: 70,
                    height: 120,
                    fit: BoxFit.fill,
                  )
                )
              )
            ),
          );
        }
      ),
    );
  }
}