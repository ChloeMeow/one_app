import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/Findjump_page/read_detail.dart';
import 'package:one_app/pages/HomePage/homejump_page.dart/sharepage.dart';
import 'package:one_app/pages/providers/findjump/toppicd_provider.dart';
import 'package:one_app/pages/providers/readprovider.dart';

import 'package:provider/provider.dart';

class TopicDetail extends StatefulWidget {
  TopicDetail({Key key}) : super(key: key);

  @override
  _TopicDetailState createState() => _TopicDetailState();
}

class _TopicDetailState extends State<TopicDetail> {
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
        if(_scrollController.offset < titleHeight && showToTopBtn){
          setState(() {
            showToTopBtn = true;
          });
        }else if(_scrollController.offset >= titleHeight && !showToTopBtn){
          setState(() {
            showToTopBtn = false;
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
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            
            context: context, 
            child:  ListView(
             controller: _scrollController,
              children: <Widget>[
                TopImg(),
                IntroEarly(),
                WorkList(),
                DisList(),
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
                      Icons.arrow_back
                    ), 
                    onPressed:(){
                       Navigator.pop(context);
                    }
                  ),
                  Container(
                    padding: EdgeInsets.only(left:130),
                    child: Text(
                      "专题",
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:SafeArea(
         child: ReplyBar(),
      )
    );
  }
}


//图片
class TopImg extends StatelessWidget {
  const TopImg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopicdProvider provider = Provider.of<TopicdProvider>(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(
            "${provider.backImg.backImgUrl}",
            height: 200,
            width:420,
            fit: BoxFit.cover,
          ),
          Positioned(
            top:10,
            left:5,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:Colors.grey
              ), 
              onPressed: (){
                Navigator.pop(context);
              }
            )
          )
        ],
      ),
    );
  }
}
//介绍
class IntroEarly extends StatelessWidget {
  const IntroEarly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopicdProvider provider = Provider.of<TopicdProvider>(context);
    return Container(
      padding: EdgeInsets.only(
        top:20,
        right:15,
        bottom: 5,
        left:15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${provider.introText.introTitle}",
            style: TextStyle(
              color:Colors.yellow[100],
              fontSize: 20,
            ),
          ),
          Text(
            "${provider.introText.introDescr}",
            style: TextStyle(
              color:Colors.yellow[100],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
//内容
class WorkList extends StatelessWidget {
  const WorkList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopicdProvider provider = Provider.of<TopicdProvider>(context);
    List<Portfolio> portfolio = List<Portfolio>();
    portfolio = provider.portfolio;
    return Container(
        child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: portfolio.length,
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(15),
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
                    child: ReadDetail(),
                      
                    )
                  ),
                );
              },
              child: Card(
                child:Column(
                  children:<Widget>[
                      Stack(
                        children: <Widget>[
                          Image.network(
                            "${provider.portfolio[index].portPicUrl}",
                            width: 380,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 25,
                            bottom: 25,
                            child: Text(
                              "${provider.portfolio[index].portTitle}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              )
                            )
                          )
                        ],
                      ),
                      Container(
                        padding:EdgeInsets.all(15),
                        child: Text(
                          "${provider.portfolio[index].portDescr}",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          bottom:8,
                          left:15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${provider.portfolio[index].portAuthor}",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 14,
                              )
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton.icon(
                                  onPressed: (){
                                    provider..tapFav(provider.portfolio[index]);
                                  }, 
                                  icon: !provider.portfolio[index].ifFaved
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
                                  label: Text(
                                    "${provider.portfolio[index].portfav}",
                                    style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 14
                                    )
                                  )
                                ),
                                IconButton(
                                  icon: Icon(
                                  Icons.redo,
                                  color:Colors.black26,
                                  size: 22,
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
                              ]
                            )
                          ],
                        ),
                      )
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
class DisList extends StatelessWidget {
  const DisList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopicdProvider provider = Provider.of<TopicdProvider>(context);
     List<Discussion> discussion = List<Discussion>();
    discussion = provider.discussion;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:15),
          child: Text(
            "评论列表",
            style: TextStyle(
              height: 5,
              color: Colors.yellow[100],
            )
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: discussion.length,
            itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense:true,
                      leading: ClipOval(
                        child: Image.network(
                          "${provider.discussion[index].disImg}",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Container(
                        alignment:Alignment(-1.3,0),
                        child: Text(
                        "${provider.discussion[index].disName}",
                        style: TextStyle(
                          color: Colors.yellow[100],
                        )
                        ),
                      ),
                      trailing: Text(
                        "${provider.discussion[index].disData}",
                        style: TextStyle(
                          color: Colors.yellow[100],
                        )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:30),
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child:Text(
                        "${provider.discussion[index].disComment}",
                        style: TextStyle(
                          color: Colors.yellow[100],
                        )
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.yellow[100],
                            size:22,
                          ),
                          onPressed: (){}
                        ),
                        FlatButton.icon(
                          key:UniqueKey(),
                          icon: !provider.discussion[index].isLike
                            ? Icon(
                                Icons.favorite_border,
                                color:Colors.yellow[100],
                                size: 22,
                              ) 
                            : Icon(
                                Icons.favorite,
                                color:Colors.redAccent,
                                size: 22,
                              ), 
                          onPressed: () { 
                            provider.tapLike(provider.discussion[index]); 
                          },
                          label:Text(
                            "${provider.discussion[index].disLike}",
                            style: TextStyle(
                              color: Colors.yellow[100],
                            )
                          ),
                        )
                      ]
                    )
                  ],
                ),
              );
            }, 
          ),
      ],
    );
  }
}

class ReplyBar extends StatefulWidget {
  ReplyBar({Key key}) : super(key: key);

  @override
  _ReplyBarState createState() => _ReplyBarState();
}

class _ReplyBarState extends State<ReplyBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:10),
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.yellow[100],
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          width: 150,
          child:OutlineButton(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "写一个评论",
                style: TextStyle(
                  color: Colors.yellow[100],
                )
              )
            ),
            onPressed: (){
               showModalBottomSheet(
                context:context,
                builder: (BuildContext context){
                  return AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration:Duration(milliseconds:100),
                    child: Container(
                      child: textField(),
                    ),
                  );
                }
              );
            }
          )
        ),
        FlatButton.icon(
          onPressed: (){}, 
          icon: Icon(
            Icons.favorite_border,
            color: Colors.yellow[100],
            size:24,
          ), 
          label: Text(
            "7378",
            style: TextStyle(
              color: Colors.yellow[100],
            )
          ),
        ),
        FlatButton.icon(
          onPressed: (){
            //ReplyList();
          }, 
          icon: Icon(
            Icons.chat_bubble_outline,
            color: Colors.yellow[100],
            size:24,
          ), 
          label: Text(
            "86",
            style: TextStyle(
              color: Colors.yellow[100]
            )
          )
        ),
        IconButton(
          icon: Icon(
            Icons.redo,
            color: Colors.yellow[100],
          ), 
          onPressed: (){}
        )
      ],
    );
  }
  
  textField() {
    return Container(
      padding: EdgeInsets.all(10),
      height:200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: new TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '在这里写下你想说的',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("500"),
              RaisedButton(
                child: Text(
                  "发送"
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}