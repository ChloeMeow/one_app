import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:provider/provider.dart';

class GraphicColle extends StatelessWidget {
  const GraphicColle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("图文"),
      ),
      body: GraphicKeep(),
    );
  }
}

class GraphicKeep extends StatelessWidget {
  const GraphicKeep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticleProvider provider = Provider.of<ArticleProvider>(context);
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      children: <Widget>[
        Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    "${provider.mainInfo.imgUrl}",
                    width: 190,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    width: 190,
                    bottom:0,
                    child: Container(
                      color: Colors.black26,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text(
                            "VOL2797",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          Text(
                            "03Jun2020",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        ]
                      ),
                    )
                  )
                ],
              ),
              Text(
                  "${provider.mainInfo.content}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              
            ],
          ),
        ),
      ],
    );
  }
}