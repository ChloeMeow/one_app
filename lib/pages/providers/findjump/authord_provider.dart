import 'package:flutter/material.dart';

class AuthordProvider with ChangeNotifier{
  AuthorData authorData;
  List<AuthorWorks> authorWorks  =  List<AuthorWorks>();

  AuthordProvider(){
    authorData = AuthorData(
      autAvatar:"https://www.canva.cn/learn/wp-content/uploads/sites/17/2019/07/pexels-photo-315191.jpg",
      autName:"陈湛",
      autInt:"90后作者，吉他手,[一个]常驻作者。@陈湛CC",
      autDetail:"作家，编剧，银河系少先队大队长，已出版《女王乔安》《少年博物馆》等。@张晓晗Oliver，ID：银河系会玩",
      attention:"关注",
      followed:"已关注",
      ifFollow: false,
      autFollow: 62824,
      folText:"关注"
      
    );
    authorWorks = [
       AuthorWorks(
        workCtion:"-阅读-",
        workTitle:"时间面前，一切终将释怀",
        workName:"文/橘子君 ",
        workContent:"常想时间是一味良药，能让人自渡，再难忘的人或事，在时间面前终将释怀。",
        workImg:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590645628867&di=674dcacd7d544949da5dac795b92edb4&imgtype=0&src=http%3A%2F%2Fv1.qzone.cc%2Fpic%2F201612%2F09%2F20%2F22%2F584aa203568c2917.jpg!600x600.jpg",
        workDate:"今天",
        dislikeIcon: Icons.favorite_border,
        likeIcon: Icons.favorite,
        workFav:1358,
        ifLike: false,
        shareIcon: Icons.repeat,
      ),
      AuthorWorks(
        workCtion:"-连载-",
        workTitle:"来不及",
        workName:"轻盈",
        workContent:"来不及收集夏花的灿烂，嵌入记忆的深处；来不及剪辑夏夜的浪漫，点染生命的脉络；来不及萃取夏日的热情，温暖未知的岁月。转眼间，却已惊觉薄凉环绕。点滴凉意，透出了秋的味道。",
        workImg:
          "https://img.alicdn.com/img/bao/uploaded/i4/i1/10217269/TB25v0Wd8jTBKNjSZFwXXcG4XXa_!!10217269.jpg_540x540Q50s50.jpg",
        workDate:"5月02日",
        dislikeIcon: Icons.favorite_border,
        likeIcon: Icons.favorite,
        workFav:1358,
        ifLike: false,
        shareIcon: Icons.repeat,

      ),
      AuthorWorks(
        workCtion:"-问答-",
        workTitle:"雪水情",
        workName:"折桂令·春情",
        workContent:"平生不会相思，才会相思，便害相思。身似浮云，心如飞絮，气若游丝。空一缕余香在此，盼千金游子何之。证候来时，正是何时？灯半昏时，月半明时。",
        workImg:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590645657186&di=65c8323b9391f540b446d9c95567df2a&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-16%2F59e447f1b03d1.jpg",
        workDate:"4月27日",
        dislikeIcon: Icons.favorite_border,
        likeIcon: Icons.favorite,
        workFav:1358,
        ifLike: false,
        shareIcon: Icons.repeat,
      ),
      AuthorWorks(
        workCtion:"-阅读-",
        workTitle:"说给昨天的今天的明天的我们自己",
        workName:"然小样",
        workContent:"如果有来生，要做一棵树，站成永恒，没有悲欢的姿势。一半在尘土里安详，一半的风力飞扬，一半洒落阴凉，一半沐浴阳光。如果有来生，要做一只飞鸟，飞越永恒，没有迷途的苦恼。东方有火红的希望，南方有温暖的巢床，向西逐退残阳，向北唤醒芬芳。",
        workImg:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590645709129&di=ef4763eb65acb33b9979e63a2ab4500d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201210%2F25%2F20121025140850_mXWew.thumb.700_0.jpeg",
        workDate:"今天",
        dislikeIcon: Icons.favorite_border,
        likeIcon: Icons.favorite,
        workFav:1358,
        ifLike: false,
        shareIcon: Icons.repeat,
      ),
      AuthorWorks(
        workCtion:"-阅读-",
        workTitle:"收藏阳光，贮存幸福",
        workName:"性淡如菊 ",
        workContent:"阳光是天空绽放的花朵，她的芬芳没法用语言来形容。阳光是天空挥洒的情怀，她的浪漫没有文字可以描述。阳光是天空的舞姿，她的精彩没有谁能媲美。大海是她美丽的女儿，大地是她温顺的儿子，在她温暖的怀抱，我们沐浴着无私和大爱。比无私更高的叫无欲，比大爱更大的叫慈悲。这二者，阳光可以当之无愧。",
        workImg:
          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3852555864,770862677&fm=26&gp=0.jpg",
        workDate:"今天",
        dislikeIcon: Icons.favorite_border,
        likeIcon: Icons.favorite,
        workFav:1358,
        ifLike: false,
        shareIcon: Icons.repeat,
      ),
     ];
  }
  tapFollower(){
    authorData.ifFollow = !authorData.ifFollow;
    if(authorData.ifFollow){
      authorData.autFollow += 1;
    }else{
      authorData.autFollow -= 1;
    }
    notifyListeners();
  }
  tapLike(AuthorWorks authorWorks){
    authorWorks.ifLike =!authorWorks.ifLike;
    if(authorWorks.ifLike){
      authorWorks.workFav += 1;
    }else{
      authorWorks.workFav -= 1;
    }
    notifyListeners();
  }
}

class AuthorData{
  String autAvatar;
  String autName;
  String autInt;
  String autDetail;
  String attention;
  String followed;
  bool ifFollow;
  int autFollow;
  String folText;

  AuthorData({
    this.autAvatar,
    this.autName,
    this.autInt,
    this.autDetail,
    this.attention,
    this.followed,
    this.ifFollow,
    this.autFollow,
    this.folText,
  });
}

class AuthorWorks{
  String workCtion;
  String workTitle;
  String workName;
  String workContent;
  String workImg;
  String workDate;
  IconData dislikeIcon;
  IconData likeIcon;
  int workFav;
  bool ifLike;
  IconData shareIcon;

  AuthorWorks({
    this.workCtion,
    this.workTitle,
    this.workName,
    this.workContent,
    this.workImg,
    this.workDate,
    this.dislikeIcon,
    this.likeIcon,
    this.workFav,
    this.ifLike,
    this.shareIcon,
  });
}