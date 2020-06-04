import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/HomePage/sliverone_page.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:provider/provider.dart';

class GraphicList extends StatelessWidget {
  const GraphicList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(60),
        child: GestureDetector(
          onTap: (){
            showBottomSheet(
              context: context, 
              builder: (BuildContext context){
                return SliverOnePage();
              }
            );
          },
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
                title:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children:<TextSpan>[
                          TextSpan(
                            text:"16",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:Colors.black
                            ),
                          ),
                          TextSpan(
                            text: "Apr2020",
                            style:TextStyle(
                              fontSize:8,
                              color:Colors.black
                            ),
                          )
                        ]
                      )
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 28,
                      color: Colors.black,
                    )
                  ],
                ),
              actions: <Widget>[
                FlatButton(
                  color:Colors.transparent,
                  onPressed:(){},
                  child: Text(
                    "天河-多云 24℃",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize:12
                    )
                  ),
                )
              ],
            ),
          ),
      ),
      
    ),

      body: Column(
      mainAxisSize: MainAxisSize.min,
      children:<Widget>[
        
        GrapContent(),
        SelectDate(),
        ]
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

class GrapContent extends StatelessWidget {
  const GrapContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Graphics> graphics = List<Graphics>();
    graphics = provider.graphics;
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9
        ),
        itemCount: graphics.length,
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(12),
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
          );
        }
      ),
    );
  }
}