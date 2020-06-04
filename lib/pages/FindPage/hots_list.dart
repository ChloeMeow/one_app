import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/Findjump_page/read_detail.dart';
import 'package:one_app/pages/FindPage/reads_list.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:provider/provider.dart';

class HotsList extends StatelessWidget {
  const HotsList({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Hots> hots = List<Hots>(); 
    hots = provider.hots;
    return ListView.builder(
      itemCount: hots.length,
      itemBuilder: (context,index){
        return Container(
          padding: EdgeInsets.only(
            left:15,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${provider.hots[index].hotstitle}",
                    style: TextStyle(
                      fontSize: 16
                    )
                  ),
                  FlatButton(
                    onPressed: (){}, 
                    child: Text(
                      "完整榜单>",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize:12,
                      ),
                    )
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right:10),
                    child: GestureDetector(
                       onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (context) => FindProvider(),
                              ),
                            ],
                            child: ReadsList(),
                              
                            )
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "${provider.hots[index].hotsUrl}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            )
                          ),
                          Positioned(
                            top: 40,
                            left: 28,
                            child: Text(
                              "${provider.hots[index].hotsseal}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2
                              )
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      height: 2.5
                    ),
                    textAlign: TextAlign.start,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
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
                          child: Text(
                            "1.${provider.hots[index].hotstype1}",
                          ),
                        ),
                        GestureDetector(
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
                          child: Text(
                            "2.${provider.hots[index].hotstype2}"
                          ),
                        ),
                        GestureDetector(
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
                          child: Text(
                            "3.${provider.hots[index].hotstype3}"
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        );
      }
    );
  }
}