import 'package:flutter/material.dart';
import 'package:one_app/pages/FindPage/Findjump_page/read_detail.dart';
import 'package:one_app/pages/providers/readprovider.dart';
import 'package:one_app/pages/providers/serialjump/chapter_provider.dart';
import 'package:provider/provider.dart';

class ChapterDetail extends StatelessWidget {
  const ChapterDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChapterProvider provider = Provider.of<ChapterProvider>(context);
    List<Section> section = new List<Section>();
    section = provider.section;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${provider.section[2].secTitle}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Paragraph(),
    );
  }
}

class Paragraph extends StatelessWidget {
  const Paragraph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChapterProvider provider = Provider.of<ChapterProvider>(context);
    List<Section> section = new List<Section>();
    section = provider.section;
    return ListView.builder(
      itemCount: section.length,
      itemBuilder: (context,index){
        return GestureDetector(
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
            child: ListTile(
              leading: Image.network(
                "${provider.section[index].secImg}"
              ),
              title: Container(
                padding: EdgeInsets.only(
                  bottom: 12
                ),
                child: Text(
                  "${provider.section[index].secTitle}"
                ),
              ),
              subtitle: Text(
                "${provider.section[index].secSubtitle}",
                style: TextStyle(
                  fontSize: 12
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      }
    );
  }
}