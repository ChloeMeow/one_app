import 'package:flutter/material.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/graphicList.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/imgdetails.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/notessquare.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/onenotes.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/readpage.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/sharepage.dart';
import 'package:one_app/pages/MyPage/MyKeep/GraphicColle.dart';
import 'package:one_app/pages/providers/article_provider.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:provider/provider.dart';


class SliverOnePage extends StatelessWidget {
  const SliverOnePage({Key key, int selIndex, int currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                
                MaterialPageRoute(
                  //fullscreenDialog全屏对话框
                  fullscreenDialog: true,

                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => FindProvider(),
                      ),
                    ],
                    child: GraphicList(),
                    
                  )
                )
              );
            },
            //底部弹出框
            /*onTap: (){
              showBottomSheet(
                context: context, 
                builder: (BuildContext context){
                  return GraphicList();
                }
              );
            },*/
          
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
class MainPush extends StatefulWidget {
  MainPush({Key key}) : super(key: key);

  @override
  _MainPushState createState() => _MainPushState();
}

class _MainPushState extends State<MainPush> {
  
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
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImgDetails(),
                        )
                      );
                    },
                    child: Image.network(
                      "${provider.mainInfo.imgUrl}",
                      width: 500,
                      height: 280,
                      fit: BoxFit.fill,
                    ),
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
          padding: EdgeInsets.only(
            left:8,
            right:22,
            bottom: 15
          ),
          child: Row(
            children:<Widget>[
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                  create: (context) => FindProvider(),
                                ),
                              ],
                              child: NotesSquare(),
                            )
                          )
                        );
                      },
                      icon: Icon(
                        Icons.explore,
                        color:Colors.black,
                        size: 26,
                      ),
                      label: Text(
                        "${provider.mainInfo.userrecord}",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12
                        )
                      ),
                    )
                  ]
                ),
              ),
              //小记按钮
              Expanded(
                flex:2,
                child: IconButton(
                  icon: Icon(
                    Icons.create,
                    color:Colors.black26,
                    size: 30,
                  ), 
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => OneNotes(
                          Fluttertoast.showToast(
                            msg: "一个：您可以修改图片和文字来创建自己\n的小记",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 14,
                          )
                        ),
                      )
                    );
                  }
                )
              ),
              //收藏按钮
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: !provider.mainInfo.ifBookmark
                    ? Icon(
                        Icons.bookmark_border,
                        color:Colors.black26,
                        size: 30, 
                      )
                    : Icon(
                        Icons.bookmark,
                        color:Colors.orangeAccent,
                        size: 30, 
                      ),
                  onPressed: (){
                    provider.tapBok();
                    
                    //_pushSaved();
                    //弹出提示
                    /*showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("一个：已收藏至个人中心"),
                      )
                    );*/
                    /*Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => TopicCollect(),
                      )
                    );*/
                  }
                ),
              ),
              //红心收藏
              Expanded(
                flex: 3,
                child: FlatButton.icon(
                  onPressed: (){
                    provider.tapFav();
                  }, 
                  icon: !provider.mainInfo.ifFaved 
                    ? Icon(
                        Icons.favorite_border,
                        color:Colors.black26,
                        size: 30,
                      ) 
                    : Icon(
                        Icons.favorite,
                        color:Colors.redAccent,
                        size: 30,
                      ),
                  label: Text(
                    "${provider.mainInfo.mainfav}",
                    style: TextStyle(
                      color: Colors.black26,
                    )
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                  Icons.repeat,
                  color:Colors.black26,
                  size: 30,
                ), 
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => SharePage(),
                      )
                    );
                  }
                )
              ),
            ]
          ),
        )
      ],
    );
  }

void _pushSaved(){
  Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ArticleProvider()
            ),
          ],
          child:GraphicColle(),
        )
      )
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
                child: GestureDetector(
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
                        child: ReadPage(),
                          
                        )
                      ),
                    );
                    
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "${provider.blogpost[index].postction}",
                          style:TextStyle(color: Colors.black26)
                        ),
                      ),
                      Text(
                        "${provider.blogpost[index].posttitle}",
                        
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 24,
                        )
                      ),
                      Text(
                        "${provider.blogpost[index].postname}"
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
                                FlatButton.icon(
                                  key:UniqueKey(),
                                  icon: !provider.blogpost[index].ifLike
                                    ? Icon(
                                        Icons.favorite_border,
                                        color:Colors.black26,
                                        size: 22,
                                      ) 
                                    : Icon(
                                        Icons.favorite,
                                        color:Colors.redAccent,
                                        size: 22,
                                      ), 
                                  onPressed: () { 
                                    provider.tapLike(provider.blogpost[index]); 
                                  },
                                  label:Text(
                                    "${provider.blogpost[index].postfav}",
                                    style: TextStyle(
                                      color: Colors.black26,
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
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


//点击红心收藏，数字增加
class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)), 
          onPressed: null
        )
      ],
    );
  }
}