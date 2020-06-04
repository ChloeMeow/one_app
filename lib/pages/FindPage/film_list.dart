import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:one_app/pages/FindPage/Findjump_page/film_detail.dart';

import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/findjump/filmd_provider.dart';
import 'package:provider/provider.dart';

class FilmList extends StatelessWidget {
  const FilmList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: <Widget>[
          FilmDate(),
          FilmContent(),  
        ],
      ),
    );
  }    
}


class FilmDate extends StatelessWidget {
  const FilmDate({Key key}) : super(key: key);

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

class FilmContent extends StatelessWidget {
  const FilmContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Film> film = List<Film>();
    film = provider.film;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: film.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => FilmdProvider(),
                    ),
                  ],
                  child: FilmDetail(),
                    
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
                    "${provider.film[index].filmtitle}",
                    style: TextStyle(
                      height:1.5
                    ),
                  ),
                ),
                subtitle: Text(
                  "${provider.film[index].filmsubtitle}",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${provider.film[index].filmUrl}",
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