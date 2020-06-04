import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/serial_provider.dart';
import 'package:provider/provider.dart';

class SerialTwoPage extends StatelessWidget {
 const SerialTwoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SerialProvider provider = Provider.of<SerialProvider>(context);
    List<Serials> serials = List<Serials>();
    serials = provider.serials;
    return ListView.builder(
      itemCount: serials.length,
      itemBuilder: (context,index){
        return Container(
          padding: EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12)
              )
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        "${provider.serials[index].serUrl}",
                        width: 550,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Text(
                        "${provider.serials[index].sertag}",
                        style: TextStyle(
                          fontSize: 10,
                          color:Colors.white
                        ),
                      )
                    ),
                    Positioned(
                      left: 10,
                      bottom: 15,
                      child: Text(
                        "${provider.serials[index].sermark}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    )
                  ],
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "${provider.serials[index].sertitle}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${provider.serials[index].sersubtitle}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black26
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}