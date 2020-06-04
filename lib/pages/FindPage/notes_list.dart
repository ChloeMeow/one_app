
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:one_app/pages/FindPage/Findjump_page/notes_detail.dart';
import 'package:one_app/pages/providers/find_provider.dart';
import 'package:one_app/pages/providers/findjump/notesd_provider.dart';
import 'package:provider/provider.dart';



class NotesList extends StatefulWidget {
  NotesList({Key key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    FindProvider provider = Provider.of<FindProvider>(context);
    List<Notes> notes = List<Notes>();
    
    notes = provider.notes;
    ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
    //int page = 0;
    //bool isLoading = false;

    /*Future getData() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        notes = List.generate(15, (i) => '哈喽,我是原始数据 $i');
      });
    });
  }

   Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          notes.addAll(List.generate(5, (i) => '第$page次上拉来的数据'));
          page++;
          isLoading = false;
        });
      });
    }
  }

    @override
    Void dispose(){
      super.dispose();
      _scrollController.dispose();
    }*/

  //RefreshIndicator刷新指标
    return Stack(
      children: <Widget>[
        StaggeredGridView.countBuilder(
          controller: _scrollController,
          padding: EdgeInsets.all(8),
          //crossAxisCount: 横轴计数
          crossAxisCount: 4, 
          itemCount: notes.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => NotesdProvider(),
                    ),
                  ],
                    child: NotesDetail(),   
                    )
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.network(
                          "${provider.notes[index].notesUrl}"
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape:BoxShape.circle,
                              color: Colors.black12,
                            ),
                            child:  IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                size: 8,
                              ),
                              onPressed: (){}
                            )
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      title: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "${provider.notes[index].notescontent}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize:14
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${provider.notes[index].notesname}",
                            style: TextStyle(
                              fontSize:12,
                              color: Colors.black38
                            ),
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${provider.notes[index].notesdate}·",
                                style: TextStyle(
                                  fontSize:12,
                                  color: Colors.black38
                                ),
                              ),
                              Text(
                                "${provider.notes[index].notesaddress}",
                                style: TextStyle(
                                  fontSize:12,
                                  color: Colors.black38
                                ),
                              ),
                            ],
                          ),
                        ]
                      ),
                    )
                  ]
                )
              ),
            );
          },
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        
        ),
        Positioned(
          left: 160,
          bottom: 20,
          child: RaisedButton(
            elevation: 0,
            color: Colors.black,
            shape: CircleBorder(
              side:BorderSide(
                style: BorderStyle.none
              )
            ),
            child: Icon(
              Icons.add,
              color: Colors.white
            ),
            onPressed: null
          )
        )
      ],
    );
  }
}



