import 'package:flutter/material.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/readpage.dart';
import 'package:one_app/pages/providers/findjump/authord_provider.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:provider/provider.dart';

class AuthorDetail extends StatefulWidget {
  AuthorDetail({Key key}) : super(key: key);

  @override
  _AuthorDetailState createState() => _AuthorDetailState();
}

class _AuthorDetailState extends State<AuthorDetail> {
  ScrollController _scrollController = ScrollController();
  //标题开端高度
  final int _titleAlpha = 100;
  //标题高度
  final int titleHeight = 1000;
  //透明度
  double toolbarOpacity = 0.0;
  //是否显示到最顶·
  bool showToTopBtn = false;

  @override
  void initState() {
    _scrollController
      ..addListener((){
        double t = _scrollController.offset / _titleAlpha;
        if (t < 0.0){
          t = 0.0;
        } else if(t >1.0){
          t = 1.0;
        }
        setState(() {
          toolbarOpacity = t;
        });
        if(_scrollController.offset <= titleHeight && !showToTopBtn){
          setState(() {
            showToTopBtn = false;
          });
        }else if(_scrollController.offset > titleHeight && showToTopBtn){
          setState(() {
            showToTopBtn = true;
          });
        }
      print(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    AuthordProvider provider = Provider.of<AuthordProvider>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context, 
            child:  ListView(
             controller: _scrollController,
              children: <Widget>[
                TopProfile(),
                WorkList(),
              ],
            ) 
          ),
          Opacity(
            opacity: toolbarOpacity,
            child: Container(
              color: Colors.white,
              height: 80,
              padding: EdgeInsets.only(top:30),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 32,
                      color:Colors.black26,
                    ), 
                    onPressed:(){
                       Navigator.pop(context);
                    }
                  ),
                  Container(
                    padding: EdgeInsets.only(left:130),
                    child: Text(
                      "${provider.authorData.autName}",
                      style: TextStyle(
                        fontSize: 18
                      )
                    ),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopProfile extends StatelessWidget {
  const TopProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthordProvider provider = Provider.of<AuthordProvider>(context);
    return Stack(
      children: <Widget>[
        Container(
          height: 320,
          padding: EdgeInsets.only(
            top: 25,
            right: 45,
            left: 45,
            bottom: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child:Image.network(
                  "${provider.authorData.autAvatar}",
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                )
              ),
              Text(
                "${provider.authorData.autName}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "${provider.authorData.autInt}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54
                )
              ),
              Container(
                padding: EdgeInsets.only(
                  top:10,
                  bottom:10
                ),
                child: Text(
                  "${provider.authorData.autDetail}",
                  textAlign: TextAlign.center,
                ),
              ),
              OutlineButton(
                highlightColor: Colors.black26,
                onPressed: (){
                  provider.tapFollower();
                },
                child: !provider.authorData.ifFollow
                  ? Text(
                    "${provider.authorData.attention}",
                    style: TextStyle(
                      fontSize: 16,
                    )
                  )
                  : Text(
                    "${provider.authorData.followed}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    )
                  ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${provider.authorData.autFollow}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    )
                  ),
                  Text(
                    "${provider.authorData.folText}",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black38,
                    )
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 5,
          left: 3.5,
          child: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 34,
              color: Colors.black26
            ), 
            onPressed: (){
              Navigator.pop(context);
            }
          )
        )
      ],
    );
  }
}

class WorkList extends StatelessWidget {
  const WorkList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthordProvider provider = Provider.of<AuthordProvider>(context);
    List<AuthorWorks> authorWorks  =  List<AuthorWorks>();
    authorWorks = provider.authorWorks;
        return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: authorWorks.length,
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
                          "${provider.authorWorks[index].workCtion}",
                          style:TextStyle(color: Colors.black26)
                        ),
                      ),
                      Text(
                        "${provider.authorWorks[index].workTitle}",
                        
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 24,
                        )
                      ),
                      Text(
                        "${provider.authorWorks[index].workName}"
                      ),
                      Text(
                        "${provider.authorWorks[index].workContent}",
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
                            "${provider.authorWorks[index].workImg}",
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Text(
                              "${provider.authorWorks[index].workDate}",
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
                                  icon: !provider.authorWorks[index].ifLike
                                    ? Icon(
                                        provider.authorWorks[index].dislikeIcon,
                                        color:Colors.black26,
                                        size: 22,
                                      ) 
                                    : Icon(
                                        provider.authorWorks[index].likeIcon,
                                        color:Colors.redAccent,
                                        size: 22,
                                      ), 
                                  onPressed: () { 
                                    provider.tapLike(provider.authorWorks[index]); 
                                  },
                                  label:Text(
                                    "${provider.authorWorks[index].workFav}",
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
                                provider.authorWorks[index].shareIcon,
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