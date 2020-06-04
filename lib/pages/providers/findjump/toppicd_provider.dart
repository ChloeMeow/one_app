import 'package:flutter/material.dart';

class TopicdProvider with ChangeNotifier{
  BackImg backImg;
  IntroText introText;
  List<Portfolio> portfolio = List<Portfolio>();
  List<Discussion> discussion = List<Discussion>();

  TopicdProvider(){
    //突破
    backImg = BackImg(
      backImgUrl:
      "http://img.qqleju.com/uploads/allimg/151006/06-012433_375.jpg",
    );
    //介绍
    introText = IntroText(
      introTitle:"「故事大爆炸」获奖作品合集",
      introDescr:"大赛历时半年，感谢所有作者们踊跃参与，感恩读者们一路陪伴，共同度过这段漫长的等待。"
    );
    //作品集
    portfolio =  [
      Portfolio(
        portPicUrl:"http://picture.ik123.com/uploads/allimg/171211/12-1G211104644.jpg",
        portTitle:"「故事大爆炸」大奖揭晓",
        portDescr:"大赛历时半年，感谢所有作者们踊跃参与，感恩读者们一路陪伴，共同度过这段漫长的等待。",
        portAuthor:"ONE一个",
        ifFaved: false,
        portfav: 1673,
        portIcon: Icons.redo,
      ),
      Portfolio(
        portPicUrl:"http://picture.ik123.com/uploads/allimg/171211/12-1G211104645.jpg",
        portTitle:"夏日依旧，你不一样",
        portDescr:"清晨，“知了、知了……”，蝉在高树上毫不停歇地鸣叫，声声入耳，好像在歌唱夏天的到来，欢送春天的离去，宛若春回大地，门前燕子环庭绕，年年依旧。",
        portAuthor:"夏阳",
        ifFaved: false,
        portfav: 31,
        portIcon: Icons.redo,
      ),
      Portfolio(
        portPicUrl:"http://picture.ik123.com/uploads/allimg/171211/12-1G211104647.jpg",
        portTitle:"又是夏天",
        portDescr:"世界上有太多离别和未曾触及的人们，风干相思泪也是望眼欲穿的等。",
        portAuthor:"木理子",
        ifFaved: false,
        portfav: 157,
        portIcon: Icons.redo,
      ),
      Portfolio(
        portPicUrl:"http://picture.ik123.com/uploads/allimg/171211/12-1G211104648.jpg",
        portTitle:"荷塘怀古",
        portDescr:"初秋的下午，酷热仍未去除，艳阳高照，高温闷热，让人透不过气来。应饭坡镇党委、政府的邀请，扫花网组织文学采风团采风，我们一行出嵩县城东行，经陆浑大坝、穿饭坡镇数里来到荷塘。",
        portAuthor:"林凌",
        ifFaved: false,
        portfav: 477,
        portIcon: Icons.redo,
      ),
      Portfolio(
        portPicUrl:"http://picture.ik123.com/uploads/allimg/171211/12-1G211104A3.jpg",
        portTitle:"诗如秋叶",
        portDescr:"一转身，看见了秋的样子。躲藏在叶子背后，隐隐变了脸色。在一个空间里看一首诗“恋雨却怕湿绣衣，惜花偏折花枝低，怜蝶反扑蝶落地，喜奴叫奴心何依？”",
        portAuthor:"浩瀚之巅",
        ifFaved: false,
        portfav: 367,
        portIcon: Icons.redo,
      ),
    ];
    //评论
    discussion = [
      Discussion(
        disImg:"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3020008468,851099161&fm=26&gp=0.jpg",
        disName:"叶十三",
        disData:"2020.03.17 20:29",
        disComment:"太喜欢四季了",
        dismesIcon:Icons.chat_bubble_outline,
        isLike:false,
        disLike:7
      ),
      Discussion(
        disImg:"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2333787549,3902944237&fm=26&gp=0.jpg",
        disName:"Devin",
        disData:"2020.02.15 11:29",
        disComment:"去看看他还年轻吧，或喜或悲自己体会",
        dismesIcon:Icons.chat_bubble_outline,
        isLike:false,
        disLike:26
      ),
      Discussion(
        disImg:"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3278010066,3869609626&fm=26&gp=0.jpg",
        disName:"张拉灯",
        disData:"2020.02.04 05:39",
        disComment:"洪水冲垮动物园的那一夜真的太爱了，是故事还是现实",
        dismesIcon:Icons.chat_bubble_outline,
        isLike:false,
        disLike:28
      ),
      Discussion(
        disImg:"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4022147875,4271611389&fm=26&gp=0.jpg",
        disName:"大熊",
        disData:"2020.01.07 05:05",
        disComment:"只有平凡的生活里，才有这样的故事，才有这样的感动",
        dismesIcon:Icons.chat_bubble_outline,
        isLike:false,
        disLike:2
      ),
      Discussion(
        disImg:"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1813762643,1914315241&fm=26&gp=0.jpg",
        disName:"Zerio",
        disData:"2020.01.03 21:54",
        disComment:"我自横刀向天笑",
        dismesIcon:Icons.chat_bubble_outline,
        isLike:false,
        disLike:5
      ),
    ];
  }
  void tapFav(Portfolio portfolio){
    portfolio.ifFaved = !portfolio.ifFaved;
    if(portfolio.ifFaved){
      portfolio.portfav += 1;
    }else{
      portfolio.portfav -= 1;
    }
    notifyListeners();
  }

  void tapLike(Discussion discussion){
    discussion.isLike = !discussion.isLike;
    if(discussion.isLike){
      discussion.disLike += 1;
    }else{
      discussion.disLike -= 1;
    }
    notifyListeners();
  }
  
}

class BackImg{
  String backImgUrl;

  BackImg({
    this.backImgUrl,
  });
}

class IntroText{
  String introTitle;
  String introDescr;

  IntroText({
    this.introTitle,
    this.introDescr,
  });
}

class Portfolio{
  String portPicUrl;
  String portTitle;
  String portDescr;
  String portAuthor;
  bool ifFaved;
  int portfav;
  IconData portIcon;

  Portfolio({
    this.portPicUrl,
    this.portTitle,
    this.portDescr,
    this.portAuthor,
    this.ifFaved,
    this.portfav,
    this.portIcon,
  });
}

class Discussion{
  String disImg;
  String disName;
  String disData;
  String disComment;
  IconData dismesIcon;
  bool isLike;
  int disLike;

  Discussion({
    this.disImg,
    this.disName,
    this.disData,
    this.disComment,
    this.dismesIcon,
    this.isLike,
    this.disLike,
  });
}