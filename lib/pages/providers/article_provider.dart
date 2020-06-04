import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ArticleProvider extends State<StatefulWidget>with ChangeNotifier, TickerProviderStateMixin {
  MainInfo mainInfo;
  List<Blogpost> blogpost = List<Blogpost>();
  //final _mainkeep = Set<String>();
  //final alreadSaved = _mainkeep.contains(MainInfo);

   ArticleProvider(){
     mainInfo = MainInfo(
        imgUrl:
          "https://www.jiepaiw.net/wp-content/uploads/2019/11/wxsync-9948290045dda6314804ef1574593300.jpeg",
        usrname:"摄影|Jocky",
        content:"暮雨初收，长川静、征帆夜落。临岛屿、蓼烟疏淡，苇风萧索。几许渔人飞短艇，尽载灯火归村落。遣行客、当此念回程，伤漂泊。",
        authorname:"柳永《满江红 暮雨初收》",
        mainfav:685,
        userrecord: "小记",
        ifFaved: false,
        ifBookmark: false,
     );

     blogpost = [
       Blogpost(
        postction:"-阅读--",
        posttitle:"跨越九十度的绝美爱情",
        postname:"文/有梦为马，随处可息 ",
        postcontent:"他，年轻有为，风流倜傥，当年以接近满分的高考成绩考取了著名的石油学院，成为普通农家的天之骄子，更是父母和全村人的骄傲。。",
        picUrl:
          "https://news.qingdaonews.com/images/attachement/jpg/site1/20170720/48d224f8c5531ada49cc0a.jpg",
        postdate:"今天",
        postfav:1358,
        ifLike: false,
      ),
      Blogpost(
        postction:"-连载-",
        posttitle:"色达",
        postname:"薛逢",
        postcontent:"滞雨通宵又彻明，百忧如草雨中生。心关桂玉天难晓，运落风波梦亦惊。压树早鸦飞不散，到窗寒鼓湿无声。当年志气俱消尽，白发新添四五茎。",
        picUrl:
          "https://img.alicdn.com/img/bao/uploaded/i4/i1/10217269/TB25v0Wd8jTBKNjSZFwXXcG4XXa_!!10217269.jpg_540x540Q50s50.jpg",
        postdate:"前天",
        postfav:1358,
        ifLike: false,

      ),
      Blogpost(
        postction:"-问答-",
        posttitle:"雪水情",
        postname:"折桂令·春情",
        postcontent:"平生不会相思，才会相思，便害相思。身似浮云，心如飞絮，气若游丝。空一缕余香在此，盼千金游子何之。证候来时，正是何时？灯半昏时，月半明时。",
        picUrl:
          "https://img.alicdn.com/img/bao/uploaded/i4/i1/44000400/O1CN01Ez1ezP1EpF0JPp51G_!!44000400.jpg_540x540Q50s50.jpg",
        postdate:"今天",
        postfav:1358,
        ifLike: false,
      ),
      Blogpost(
        postction:"-影视-",
        posttitle:"竹枝词",
        postname:"刘禹锡",
        postcontent:"山桃红花满上头，蜀江春水拍山流。花红易衰似郎意，水流无限似侬愁。",
        picUrl:
          "https://data.photo-ac.com/data/thumbnails/5c/5cbc5e7c10abfdbb2c0edb6112de3234_t.jpeg",
        postdate:"今天",
        postfav:1358,
        ifLike: false,
      ),
      Blogpost(
        postction:"-电台-",
        posttitle:"落花",
        postname:"李益",
        postcontent:"水纹珍簟思悠悠，千里佳期一夕休。从此无心爱良夜，任他明月下西楼。",
        picUrl:
          "https://pic4.zhimg.com/v2-59efcd4cd4d6c5b6ae7801ea94678320_1200x500.jpg",
        postdate:"今天",
        postfav:1358,
        ifLike: false,
      ),
     ];
    }

  tapFav(){
    mainInfo.ifFaved = !mainInfo.ifFaved;
    if(mainInfo.ifFaved){
      mainInfo.mainfav  += 1;  
    }else{
      mainInfo.mainfav -= 1;
    }
    notifyListeners();
  }

  void tapBok(){
    mainInfo.ifBookmark = !mainInfo.ifBookmark;
    if(mainInfo.ifBookmark){
      /*add(mainInfo){
        mainInfo.add(mainInfo);
      }*/
      Fluttertoast.showToast(
        msg: "一个：已收藏至个人中心",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 14,
      );
      
    }else{
      Fluttertoast.showToast(
        msg: "一个：取消收藏",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 14,
      );
    }
    /*================if(alreadSaved){
      _mainkeep.remove(String);
    }else{
      _mainkeep.add(MainInfo mainInfo);
    }
    notifyListeners();*/
  }

  void tapLike(Blogpost blogpost){
    blogpost.ifLike = !blogpost.ifLike;
    if(blogpost.ifLike){
      blogpost.postfav += 1;
    }else{
      blogpost.postfav -= 1;
    }
    notifyListeners(); 
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

  

class MainInfo{
  String imgUrl;
  String usrname;
  String content;
  String authorname;
  int mainfav;
  String userrecord;
  bool ifFaved;
  bool ifBookmark;

  MainInfo({
    this.imgUrl,
    this.usrname,
    this.content,
    this.authorname,
    this.mainfav,
    this.userrecord,
    this.ifFaved,
    this.ifBookmark,
  });
}

class Blogpost{
  String postction;
  String posttitle;
  String postname;
  String postcontent;
  String picUrl;
  String postdate;
  int postfav;
  bool ifLike;

  Blogpost({
    this.postction,
    this.posttitle,
    this.postname,
    this.postcontent,
    this.picUrl,
    this.postdate,
    this.postfav,
    this.ifLike,
  });
}

