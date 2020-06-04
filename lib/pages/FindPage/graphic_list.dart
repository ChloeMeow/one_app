import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/FindPage/Findjump_page/graphic_detail.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:provider/provider.dart';

class GraphicList extends StatelessWidget {
  const GraphicList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => FindProvider(),
        ),
      ],
      child:Scaffold(
        body: Column(
          children:<Widget>[
            SelectDate(),
            GrapContent(),
          ]
        ),
      )
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

class GrapContent extends StatelessWidget {
  const GrapContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Graphics> graphics = List<Graphics>();
    graphics = provider.graphics;
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9
        ),
        itemCount: graphics.length,
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(12),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => ArticleProvider(),
                        ),
                      ],
                        child: GraphicDetail(),   
                    )
                  ),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "${provider.graphics[index].graUrl}",
                        width: 190,
                        height: 150,
                        fit: BoxFit.fill,
                      )
                    ),
                    Container(
                      padding: EdgeInsets.only(top:8),
                      child: Text(
                        "${provider.graphics[index].gradate}"
                      )
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}