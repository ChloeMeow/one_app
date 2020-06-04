import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/findjump/radiod_provider.dart';

import 'package:provider/provider.dart';


class RadioDetail extends StatefulWidget {
  RadioDetail({Key key}) : super(key: key);

  @override
  _RadioDetailState createState() => _RadioDetailState();
}

class _RadioDetailState extends State<RadioDetail> {
  ScrollController _scrollController = ScrollController();
  //标题开端高度
  final int _titleAlpha = 400;
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
    RadiodProvider provider = Provider.of<RadiodProvider>(context);
    return Scaffold(

      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            
            context: context, 
            child:  ListView(
             controller: _scrollController,
              children: <Widget>[
                TopBack(),
                EssayContent(),
                Writers(),
                SuggestList(),
                ReviewList(),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back
                    ), 
                    onPressed:(){
                       Navigator.pop(context);
                    }
                  ),
                  Text(
                    "${provider.essayInfo.artTitle}",
                    style: TextStyle(
                      fontSize: 18
                    )
                  ),
                  IconButton(
                    icon: !provider.backImg.ifBookmark
                      ? Icon(
                          provider.backImg.mackIcon,
                          color:Colors.black26,
                          size: 28, 
                        )
                      : Icon(
                          provider.backImg.keepIcon,
                          color:Colors.orangeAccent,
                          size: 28, 
                        ),
                    onPressed: (){
                      provider.tapBok();
                    }
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:SafeArea(
         child:  ReviewsBar(),
      )
    );
  }
}

class TopBack extends StatelessWidget {
  const TopBack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RadiodProvider provider = Provider.of<RadiodProvider>(context);
    return Stack(
      children: <Widget>[
        Image.network(
          "${provider.backImg.backpicture}",
          width: 400,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 6,
          left: 6,
          child: IconButton(
            icon:Icon(
              provider.backImg.backIcon,
              color: Colors.white54,
              size: 28,
            ), 
            onPressed: (){
              Navigator.pop(context);
            }
          )
        ),
        Positioned(
          top: 6,
          right: 6,
          child:  IconButton(
            icon: !provider.backImg.ifBookmark
              ? Icon(
                  provider.backImg.mackIcon,
                  color:Colors.white54,
                  size: 28, 
                )
              : Icon(
                  provider.backImg.keepIcon,
                  color:Colors.orangeAccent,
                  size: 28, 
                ),
            onPressed: (){
              provider.tapBok();
            }
          ),
        ),
        Positioned(
          top: 30,
          left: 130,
          child: CircleAvatar(
            radius: 68,
            backgroundImage: NetworkImage( 
              "${provider.backImg.backphoto}",
            )
          )
        ),
        Positioned(
          top: 70,
          left: 150,
          child: Text(
            "${provider.backImg.backname}",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white70
            )
          ),
        ),
        Positioned(
          top: 160,
          left: 160,
          child: RaisedButton(
            elevation: 0,
            color: Colors.black,
            shape: CircleBorder(
              side:BorderSide(
                style: BorderStyle.none
              )
            ),
            child: Icon(
              provider.backImg.playIcon,
              color: Colors.white
            ),
            onPressed: null
          )
        ),
      ],
    );
  }
}

class EssayContent extends StatelessWidget {
  const EssayContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RadiodProvider provider = Provider.of<RadiodProvider>(context);
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text:"${provider.essayInfo.artTitle}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1
              )
            )
          ),
          RichText(
            text: TextSpan(
              text:"${provider.essayInfo.artAuthor}",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                height: 5
              )
            )
          ),
          RichText(
            text: TextSpan(
              text:"“",
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Container(
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:"${provider.essayInfo.artSay}",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                )
              )
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top:30,
              bottom:30,
            ),
            alignment:Alignment.bottomRight,
            child: RichText(
              text: TextSpan(
                text:"${provider.essayInfo.sayAuthor}",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                )
              )
            ),
          ),
          RichText(
            text: TextSpan(
              text:"${provider.essayInfo.artContent}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                height: 2
              )
            )
          )
        ]
      ),
    );
  }
}

class Writers extends StatelessWidget {
  const Writers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RadiodProvider provider = Provider.of<RadiodProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "作者",
          style: TextStyle(
            height: 5
          )
        ),
        Container(
          width:60,
          height:4,
          color: Colors.black,
        ),
        ListTile(
          leading:ClipOval(
            child: Image.network(
              "${provider.writers.autAvatar}",
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            "${provider.writers.autName}",
            style: TextStyle(
              fontSize: 16
            )
          ),
          subtitle: Text(
            "${provider.writers.autIntro}",
            style: TextStyle(
              fontSize: 12
            )
          ),
          trailing: ButtonTheme(
            minWidth:50,
            height:32,
            child:OutlineButton(
              onPressed: (){},
              child: Text(
                "关注",
                style: TextStyle(
                  fontSize:14
                ),
              ),
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width:1,
                ),
              )
            )
          )
        )
      ],
    );
  }
}

class SuggestList extends StatelessWidget {
  const SuggestList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     RadiodProvider provider = Provider.of<RadiodProvider>(context);
     List<Suggest> suggest = List<Suggest>();
     suggest = provider.suggest;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        Text(
          "相关推荐",
          style: TextStyle(
            height: 5
          )
        ),
        Container(
          width:60,
          height:4,
          color: Colors.black,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: suggest.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Text(
                "${provider.suggest[index].recomType}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                )
                ),
              title: Text(
                "${provider.suggest[index].recomTitle}",
                style: TextStyle(
                  fontSize: 16
                )
              ),
              subtitle: Text(
                "${provider.suggest[index].recomSubtitle}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54
                )
              ),
            );
          }
        )
      ],
    );
  }
}

class ReviewList extends StatelessWidget {
  const ReviewList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RadiodProvider  provider = Provider.of<RadiodProvider>(context);
    List<Review> review = List<Review>();
    review = provider.review;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "评论列表",
          style: TextStyle(
            height: 5
          )
        ),
        Container(
          width:60,
          height:4,
          color: Colors.black,
        ),
        ListView.separated(
          
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index){
              return Divider(
                height: 1.0,
                color: Colors.black,
              );
            }, 
            itemCount: review.length,
            itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense:true,
                      leading: ClipOval(
                        child: Image.network(
                          "${provider.review[index].disAvatar}",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Container(
                        alignment:Alignment(-1.5,0),
                        child: Text(
                        "${provider.review[index].disName}",
                        ),
                      ),
                      trailing: Text(
                        "${provider.review[index].disDate}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:30),
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child:Text(
                        "${provider.review[index].disContent}",
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.black26,
                            size:22,
                          ),
                          onPressed: (){}
                        ),
                        FlatButton.icon(
                          key:UniqueKey(),
                          icon: !provider.review[index].ifLike
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
                            provider.tapLike(provider.review[index]); 
                          },
                          label:Text(
                            "${provider.review[index].dislike}",
                            style: TextStyle(
                              color: Colors.black26,
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




class ReviewsBar extends StatefulWidget {
  ReviewsBar({Key key}) : super(key: key);

  @override
  _ReviewsBarState createState() => _ReviewsBarState();
}

class _ReviewsBarState extends State<ReviewsBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left:10
          ),
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          width: 150,
          child:OutlineButton(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("写一个评论"),
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
            color: Colors.black26,
            size:24,
          ), 
          label: Text("7378"),
        ),
        FlatButton.icon(
          onPressed: (){
            //ReplyList();
          }, 
          icon: Icon(
            Icons.chat_bubble_outline,
            color: Colors.black26,
            size:24,
          ), 
          label: Text("86")
        ),
        IconButton(
          icon: Icon(
            Icons.redo
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