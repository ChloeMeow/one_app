import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/Findjump_page/author_datail.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/findjump/authord_provider.dart';
import 'package:provider/provider.dart';

class AuthorList extends StatelessWidget {
  const AuthorList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:<Widget>[
          HotAuthor(),
          Authors(),
        ]
      ),
    );
  }
}

class HotAuthor extends StatelessWidget {
  const HotAuthor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top:5,
        left: 20,
        bottom: 5
      ),
      alignment: Alignment.topLeft,
      child: Text("热门作者"),
    );
  }
}

class Authors extends StatelessWidget {
  const Authors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Author> author = List<Author>();
    author = provider.author;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: author.length,
      itemBuilder: (context,index){
        return GestureDetector(
           onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => AuthordProvider(),
                    ),
                  ],
                  child: AuthorDetail(),
                    
                  )
                ),
              );
            },
          child: Card(
            elevation: 0,
            child: ListTile(
              leading: ClipOval(
                child: Image.network(
                  "${provider.author[index].authoravatar}",
                  width:55,
                  height:55,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "${provider.author[index].authorname}"
              ),
              subtitle: Text(
                "${provider.author[index].authorbrief}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize:12,
                ),
              ),
              trailing: ButtonTheme(
                minWidth:12,
                height:22,
                child:OutlineButton(
                  onPressed: (){},
                  child: Text(
                    "关注",
                    style: TextStyle(
                      fontSize:12
                    ),
                  ),
                  shape: BeveledRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width:1,
                    ),
                    borderRadius: BorderRadius.circular(6)
                  )
                )
              )
            ),
          ),
        );
      }
    );  
  }
}