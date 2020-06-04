import 'package:flutter/material.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:provider/provider.dart';


class ReadPage extends StatelessWidget {
  const ReadPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadProvider provider = Provider.of<ReadProvider>(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolling) {
          return<Widget> [
            SliverAppBar(
              centerTitle: true,
              brightness: Brightness.light,
              floating: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                }
              ),
              title: Text(
                "${provider.readBar.barTitle}"
              ),
              actions: <Widget>[
                IconButton(
                  icon: !provider.readBar.ifBookmark
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
                  }
                ),
              ],
            )
          ];
        },
        body: Container(
          padding:EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ArticlContent(),
              AuthorBox(),
              Recommend(),
              ReplyList(),
            ],
          ),
        ),
      ),
       bottomNavigationBar:SafeArea(
         child: ReplyBar(),
        )
    );
    
  }
}

class ArticlContent extends StatelessWidget {
  const ArticlContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadProvider provider = Provider.of<ReadProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text:"${provider.artticleInfo.artTitle}",
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
            text:"${provider.artticleInfo.artAuthor}",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
              height: 5
            )
          )
        ),
        Container(
          decoration: BoxDecoration(
            border:Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10)
          ),
         margin: EdgeInsets.only(
           top:30,
           bottom:30,
         ),
          child: ListTile(
            leading:IconButton(
              icon: Icon(
                Icons.volume_down
              ),
              onPressed: (){}
            ),
            title:RichText(
              text: TextSpan(
                text:"${provider.artticleInfo.artAloud}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                )
              )
            ),
            trailing: Text("32:34"),
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
              text:"${provider.artticleInfo.artSay}",
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
              text:"${provider.artticleInfo.sayAuthor}",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              )
            )
          ),
        ),
        RichText(
          text: TextSpan(
            text:"${provider.artticleInfo.artContent}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              height: 2
            )
          )
        )
      ]
    );
  }
}

class AuthorBox extends StatelessWidget {
  const AuthorBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadProvider provider = Provider.of<ReadProvider>(context);
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
              "${provider.readAuthor.autAvatar}",
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            "${provider.readAuthor.autName}",
            style: TextStyle(
              fontSize: 16
            )
          ),
          subtitle: Text(
            "${provider.readAuthor.autIntro}",
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

class Recommend extends StatelessWidget {
  const Recommend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     ReadProvider provider = Provider.of<ReadProvider>(context);
     List<ReadRecom> readRecom = List<ReadRecom>();
     readRecom = provider.readRecom;
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
          itemCount: readRecom.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Text(
                "${provider.readRecom[index].recomType}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                )
                ),
              title: Text(
                "${provider.readRecom[index].recomTitle}",
                style: TextStyle(
                  fontSize: 16
                )
              ),
              subtitle: Text(
                "${provider.readRecom[index].recomSubtitle}",
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

class ReplyList extends StatelessWidget {
  const ReplyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadProvider provider = Provider.of<ReadProvider>(context);
    List<ReadDis> readDis = List<ReadDis>();
    readDis = provider.readDis;
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
            itemCount: readDis.length,
            itemBuilder: (context,index){
              print("${provider.readDis[index]}");
              return Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense:true,
                      leading: ClipOval(
                        child: Image.network(
                          "${provider.readDis[index].disAvatar}",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Container(
                        alignment:Alignment(-1.5,0),
                        child: Text(
                        "${provider.readDis[index].disName}",
                        ),
                      ),
                      trailing: Text(
                        "${provider.readDis[index].disDate}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:30),
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child:Text(
                        "${provider.readDis[index].disContent}",
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
                          icon: !provider.readDis[index].ifLike
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
                            provider.tapLike(provider.readDis[index]); 
                          },
                          label:Text(
                            "${provider.readDis[index].dislike}",
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          width: 150,
          child:OutlineButton(
            child: Text("写一个评论"),
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