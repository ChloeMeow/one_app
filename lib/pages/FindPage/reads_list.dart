import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/FindPage/Findjump_page/read_detail.dart';

import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:provider/provider.dart';

class ReadsList extends StatelessWidget {
  const ReadsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SelectDate(),
          ReadsContent(),  
        ],
      ),
    );
  }
}

class SelectDate extends StatelessWidget {
  const SelectDate({Key key}) : super(key: key);

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

class ReadsContent extends StatelessWidget {
  const ReadsContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Reads> reads = List<Reads>();
    reads = provider.reads;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reads.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => ReadProvider(),
                    ),
                  ],
                  child: ReadDetail(),
                    
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
                    "${provider.reads[index].readtitle}"
                  ),
                ),
                subtitle: Text(
                  "${provider.reads[index].readsubtitle}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black26
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${provider.reads[index].readUrl}",
                    width: 80,
                    height: 80,
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