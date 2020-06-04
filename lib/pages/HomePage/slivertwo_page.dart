import 'package:flutter/material.dart';
import 'package:one_app/main.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/graphicList.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:provider/provider.dart';


class SliverTwoPage extends StatelessWidget {
  const SliverTwoPage({Key key, int selIndex, int currentIndex}) : super(key: key);

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
              return GraphicList();
            }
          );
        },
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
              OutlineButton(
                splashColor: Colors.white,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(create: (context) => ArticleProvider(),
                        ),],
                      child:MyApp()
                    )
                    )
                  );
                },
                child: Text("今天"),
              )
            ],
          ),
      ),
      ),
      
      body:ListView(
        children:<Widget>[
          MainPush(),
          Article(),
          Container(
            color:Colors.black12,
            height: 8,
          ),
          Fundus(),
        ]
      ),
      //bottomNavigationBar: IndexPage(),    
      
    );
  }
}

class MainPush  extends StatelessWidget {
  const MainPush ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticleProvider provider = Provider.of<ArticleProvider>(context);
    return Column(
      children: <Widget>[
        Container(
          height: 530,
          padding: EdgeInsets.all(12),
          child: Card(
            clipBehavior:Clip.antiAlias,
            child:Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom:10),
                  child: Image.network(
                    "${provider.mainInfo.imgUrl}",
                    width: 500,
                    height: 280,
                    fit: BoxFit.fill,
                  )
                ),
                Text(
                  "${provider.mainInfo.usrname}",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize:12
                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                    top:25,
                    right:30,
                    bottom:55,
                    left:30,
                  ),
                  child: Text(
                    "${provider.mainInfo.content}"
                  )
                ),
                Text(
                  "${provider.mainInfo.authorname}",
                  style: TextStyle(
                    color: Colors.
                    black26,fontSize:12
                  )
                ),
              ],
            )
          ),
        ),
        Container(
          padding: EdgeInsets.only(left:20,right:15,bottom: 15),
          child: Row(
            children:<Widget>[
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.explore),
                    Text(
                      "${provider.mainInfo.userrecord}",
                      style: TextStyle(
                        color: Colors.black26
                      )
                    ),
                  ]
                ),
              ),
              Expanded(
                flex:2,
                child: Icon(
                  Icons.create,
                  color:Colors.black26,
                  size: 30,
                ),
              ),
              Expanded(
                flex: 3,
                child: Icon(
                  Icons.bookmark_border,
                  color:Colors.black26,
                  size: 30,
                )
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color:Colors.black26,
                      size: 30,
                    ),
                    Text(
                      "${provider.mainInfo.mainfav}",
                      style: TextStyle(
                        color: Colors.black26
                      )
                    ),
                  ],
                )
              ),
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.repeat,
                  color:Colors.black26,
                  size: 30,
                )
              ),
            ]
          ),
        )
      ],
    );
  }
}


class Article extends StatelessWidget {
  const Article({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticleProvider provider = Provider.of<ArticleProvider>(context);
    List<Blogpost> blogpost = List<Blogpost>();
    blogpost = provider.blogpost;
        return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: blogpost.length,
        itemBuilder: (context, index){
          return Stack(
            children:  <Widget>[
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children:<Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${provider.blogpost[index].postction}",
                        style:TextStyle(color: Colors.black26)
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "${provider.blogpost[index].posttitle}",
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 24
                        )
                      ),
                      subtitle: Text(
                        "${provider.blogpost[index].postname}"
                      ),
                    ),
                    Text(
                      "${provider.blogpost[index]. postcontent}",
                      style: TextStyle(
                        height: 1.8,
                        color:Colors.black38
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    Container(
                      width: 500,
                      height: 280,
                      padding: EdgeInsets.only(top:10,bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "${provider.blogpost[index].picUrl}",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "${provider.blogpost[index].postdate}",
                            style: TextStyle(
                              color:Colors.black26,
                            )
                          ),
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
                                "${provider.blogpost[index].postfav}",
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
                  ]
                ),
              ),
            Container(
              height: 10,
              color:Colors.black12
              ),
            ],
          );
        }
      );
    }
    
  }

class Fundus extends StatelessWidget {
  const Fundus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      
      child: FlatButton(
        onPressed: (){}, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.arrow_left,
              size:16,
              color: Colors.black26,
            ),
            Text(
              "滑动查看上一个",
              style: TextStyle(
                color: Colors.black26,
                fontSize:12
              )
            ),
          ],
        )
      ),
    );
  }
}