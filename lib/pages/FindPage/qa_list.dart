import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/FindPage/Findjump_page/read_detail.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:provider/provider.dart';

class QaList extends StatelessWidget {
  const QaList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: <Widget>[
          QaDate(),
          QaContent(),  
        ],
      ),
    );
  }    
}


class QaDate extends StatelessWidget {
  const QaDate({Key key}) : super(key: key);

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

class QaContent extends StatelessWidget {
  const QaContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Qa> qa = List<Qa>();
    qa = provider.qa;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: qa.length,
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
                  padding: EdgeInsets.only(
                    bottom: 12
                  ),
                  child: Text(
                    "${provider.qa[index].qatitle}",
                    style: TextStyle(
                      height:1.5
                    ),
                  ),
                ),
                subtitle: Text(
                  "${provider.qa[index].qasubtitle}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black26
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${provider.qa[index].qaUrl}",
                    width: 80,
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