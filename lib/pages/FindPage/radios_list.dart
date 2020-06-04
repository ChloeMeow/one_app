import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/FindPage/Findjump_page/radio_detail.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/findjump/radiod_provider.dart';
import 'package:provider/provider.dart';

class RadiosList extends StatelessWidget {
  const RadiosList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RadiosDate(),
          RadiosContent(),  
        ],
      ),
    );
  }
}


class RadiosDate extends StatelessWidget {
  const RadiosDate({Key key}) : super(key: key);

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

class RadiosContent extends StatelessWidget {
  const RadiosContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Radios> radios = List<Radios>();
    radios = provider.radios;
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: radios.length,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.only(
                top:12,
                right:8,
                bottom:12,
                left:12
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => RadiodProvider(),
                      ),
                    ],
                      child: RadioDetail(),   
                      )
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12)
                    ),
                  ),
                child:Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.network(
                          "${provider.radios[index].radiosUrl}",
                          width: 450,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 8,
                          left: 10,
                          child: Text(
                            "${provider.radios[index].radioslab}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 70,
                          child: Text(
                            "${provider.radios[index].radiosper}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Positioned(
                          top:160,
                          left: 10,
                          child: Text(
                            "${provider.radios[index].radiostitle}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 160,
                          right: 10,
                          child: Icon(
                            Icons.play_circle_outline,
                            size: 30,
                            color:Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: <Widget>[
                              ClipOval(
                                child: Image.network(
                                  "${provider.radios[index].radiosavatar}",
                                  width:25,
                                  height:25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width:6),
                              Text("${provider.radios[index].radiosname}")
                            ],
                          )
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 28,
                                  color:Colors.black26
                                ), 
                                onPressed: (){}
                              ),
                              Text(
                                "${provider.radios[index].radiosfav}",
                                style: TextStyle(
                                  color:Colors.black26,
                                )
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            icon: Icon(
                              Icons.repeat,
                              color:Colors.black26,
                              size: 30,
                            ), 
                            onPressed: (){}
                          )
                        ),
                      ],
                    ),
                  ],
                )
            ),
              ),
          );
        }
      ),
    );
  }
}