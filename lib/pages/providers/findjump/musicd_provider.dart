import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MusicdProvider with ChangeNotifier{
  BackImg backImg;
  EssayInfo essayInfo;
  Writers writers;
  List<Suggest> suggest = List<Suggest>();
  List<Review> review = List<Review>();
  MusicdProvider(){
    
    backImg = BackImg(
      backpicture:  "http://img2.1sucai.com/181006/330855-1Q00614424929.jpg",
      backIcon: Icons.keyboard_arrow_left,
      mackIcon: Icons.bookmark_border,
      keepIcon: Icons.bookmark,
      ifBookmark: false,
      backphoto:  "http://image.hnol.net/c/2017-10/31/19/201710311934096291-5271748.jpg",
      playIcon: Icons.play_arrow,
      songname: "-分开以后-陈浩辰|分开以后",

    );
    //文章
    essayInfo = EssayInfo(
      artTitle:"错过的终究放下",
      artAuthor:"文/转角的丁香 ",
      artSay:"不得不说时间真的是这个世间最好的跨度，一些承诺，一段誓言，终究败给了时间，回忆再美好也经不住流年。有些人错过了终究得放下……。",
      sayAuthor:"--self",
      artContent:"不得不说时间真的是这个世间最好的跨度，一些承诺，一段誓言，终究败给了时间，回忆再美好也经不住流年。有些人错过了终究得放下……。\n\n在过往中，总有一个人，曾经是你的满心欢喜，现在却成了你的闭口不提。他闯进我们的生活，带给我们感动和美好，却又在某一时刻，猝不及防的从我们身边抽离，留下了一地的回忆。\n\n当初说着各种承诺、各种誓言，我也相信了你就是我的小确幸。也是你让我相信了这世间还有美好，可最终你还是离我而去，终究你我成了彼此生命中的过客。\n\n我们错过了，我曾幻想过天长地久；我也曾幻想过和你手牵手走在黄昏的路上。可终究你走了，留给我的只有回忆。我以为守着回忆你就可以回来，可是我错了，我，终究没等来你的转身，我终究知道错过了就是错过了，回不来了。我也终于决定放下了……\n\n终于下定决心把你归还于人海了！其实很早就在逼自己慢慢的去放手了，每次听着你那冠冕堂皇的话我尽然差点相信了我和你会有以后……\n\n我没有你善于伪装，我学不会做最坏的人，我也不想浪费太多的时间和精力去等一个不可能的结果！虽然先动心、动情的人是你，无数次主动和挽留的人也是你，可我还是学不会去做一个你渴望中的人。\n\n这一路有快乐、有坎坷、有心酸。记得你曾对我说过：“这一路来太多的心酸和坎坷自己必须好好珍惜才是……”你也说过：“我不必有顾虑，你会珍惜你会好好保护着我……”这些话在耳边响起犹如昨天，那么悦耳那么清晰。可我不想这样原地不动的去等待和期望了，我准备回头了，回到我的原点，回到不是和你开始的原地了……。\n\n你的承诺和誓言总归太遥远，你总归太缥缈。当我不在是你生命中的独一无二，我宁愿离去，也不愿在一份残缺的爱里苦苦挣扎。\n\n你总归是我命中未了的缘和劫，我们也终究错过了！如果上天能够重新来过，我会绕过那个和你认识的地方，遇见你也许就是没有结果，可我也能释怀了。\n\n我不能抱着那些回忆来折磨自己，我也不想就这样颓废的麻木的去过每一天了。你给的一切在回忆的沼泽里只会让我放不下，你走后在每一个似曾相识的场景里我总是会不由自主的想起你，我会盯着你送的东西久久的发呆，也会因为看到某个熟悉的背影，而伤心落泪。\n\n我曾试过收起那些东西甚至屏蔽一切与你有关的东西。直到最后，我不得不承认，用心爱过的人，就连忘记也需要格外用力。\n\n我也曾试着挽回，试着去弥补，可终究太苍白太无力了。这就是世间的无奈，我也不得不承认你我终究错过了，我也该放下了……\n\n现在的我终于学会了该怎么去割舍，我终究学会了真正的放下就是面对你的一切波澜不惊、坦然面对。即使听见你的名字多少次也不再泛起涟漪，终于接受了，你只能陪我一程，终究无法参与我的余生。\n\n谢谢你教会我的一切，包括那些没实现的承诺……或许你会说你爱过我，可我还是决定把你归还于人海了，不是赌气，也不是不爱，只是觉得该清醒了……\n\n我终于能很轻松地说我们错过了，你终究是那个错的人，我也决定放下了！余生很长，放下错的人，才能拥抱属于我的幸福。\n\n"
    );
    //作者
    writers = Writers(
      autAvatar:"http://m.imeitou.com/uploads/allimg/2020042908/ijh52bcbehg.jpeg",
      autName:"溪森",
      autIntro: "自由写作者，喜欢寻找消逝的时间。",
    );
    //相关推荐
    suggest = [
      Suggest(
        recomType:"阅读",
        recomTitle:"遇见",
        recomSubtitle:"文/夏阳"
      ),
      Suggest(
        recomType:"阅读",
        recomTitle:"今年夏天没来",
        recomSubtitle:"文/王萌"
      )
    ];
    //评论列表
    review = [
      Review(
        disAvatar:"http://m.imeitou.com/uploads/allimg/2020041017/i4pqjve2hgm.jpeg",
        disName:"Sibylnil",
        disDate:"2020.05.12 12:07:24",
        disContent:"他从地狱来，要到天堂去，正路过人间",
        dislike: 648,
        ifLike: false
      ),
      Review(
        disAvatar:"http://m.imeitou.com/uploads/allimg/2018092622/12fnfz3gdds.jpg",
        disName:"等待",
        disDate:"2020.05.01 07:25:05",
        disContent:"你看，这才是人生，真实的未来",
        dislike: 1374,
        ifLike: false
      ),
      Review(
        disAvatar:"http://m.imeitou.com/uploads/allimg/2019102116/bmpyu5axdp3.jpg",
        disName:"小小小小",
        disDate:"2020.04.25 05:30:03",
        disContent:"爱情很美，只是我从没遇见",
        dislike: 792,
        ifLike: false
        
      ),
    ];
   
  }
  void tapBok(){
    backImg.ifBookmark = !backImg.ifBookmark;
    if(backImg.ifBookmark){
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
    notifyListeners();
  }

  /*tapLike(index){
    readDis[index].ifLike = !readDis[index].ifLike;
     if(readDis[index].ifLike){
      readDis[index].dislike +=1;
    }else{
      readDis[index].dislike -=1;
    }
    notifyListeners();
  }*/
  void tapLike(Review review) {
    review.ifLike = !review.ifLike;
    if(review.ifLike){
      review.dislike +=1;
    }else{
      review.dislike -=1;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}



class BackImg{
  String backpicture;
  IconData backIcon;
  IconData mackIcon;
  IconData keepIcon;
  bool ifBookmark;
  String backphoto;
  IconData playIcon;
  String songname;

   BackImg({
    this.backpicture,
    this.backIcon,
    this.mackIcon,
    this.keepIcon,
    this.ifBookmark,
    this.backphoto,
    this.playIcon,
    this.songname,
  });
}

class EssayInfo{
  String artTitle;
  String artAuthor;
  String artAloud;
  String artSay;
  String artContent;
  String sayAuthor;

  EssayInfo({
    this.artTitle,
    this.artAuthor,
    this.artAloud,
    this.artSay,
    this.artContent,
    this.sayAuthor,
  });
}

class Writers{
  String autAvatar;
  String autName;
  String autIntro;

  Writers({
    this.autAvatar,
    this.autName,
    this.autIntro,
  });
}

class Suggest{
  String recomType;
  String recomTitle;
  String recomSubtitle;

  Suggest({
    this.recomType,
    this.recomTitle,
    this.recomSubtitle,
  });
}

class Review{
  String disAvatar;
  String disName;
  String disDate;
  String disContent;
  bool ifLike;
  int dislike;

  Review({
    this.disAvatar,
    this.disName,
    this.disDate,
    this.disContent,
    this.ifLike,
    this.dislike,
  });
}


