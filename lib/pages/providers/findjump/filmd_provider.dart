import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class FilmdProvider with ChangeNotifier{
  BackImg backImg;
  EssayInfo essayInfo;
  Writers writers;
  List<Suggest> suggest = List<Suggest>();
  List<Review> review = List<Review>();
  FilmdProvider(){
    
    backImg = BackImg(
      backpicture:  "https://language.chinadaily.com.cn/images/attachement/jpg/site1/20160316/0023ae82c89f185352dc2d.jpg",
      backIcon: Icons.keyboard_arrow_left,
      mackIcon: Icons.bookmark_border,
      keepIcon: Icons.bookmark,
      ifBookmark: false,
    );

    essayInfo = EssayInfo(
      essayContent: """ 
        <div>
          <h2>快乐没有大小，只有心之向往</h2>,
          <h4>文／看电影杂志</h4>,
          <h3>《向往的生活》第四季回归了.</h3>
          <p>小桥流水，插花种田，三五好友，小酌惬意，这档很是红火的国产田园慢生活综艺仍是这个调调.</p>
          <p><b>"</b><br>&#12288;  清早上火车站，长街黑暗无行人，卖豆浆的小店冒着&#12288;热气。从前的日色变得慢，车，马，邮&#12288;件都慢， 一生只够爱一个人。</p>
          <img src="http://www.haofaba.com/uploads/allimg/170903/1225394257-3.jpg" width="350" height="200" />
          <p>和烂漫诗意的山水田园梦更是隔了厚厚一层，自是可远观而不可亵玩。</p>
          <p>不过好在还有电影，还有综艺，可以给人稍微做点梦的权利。</p>
          <p>身为社畜，朝九晚六，忙不完的工作，回不完的邮件，赶不完的地铁，复杂淡漠的人际关系，日复一日的无意义庸碌日常。
          <p>忙碌中的某一时刻，或许也想让灵魂偶尔停一停，于是很自然打开《向往的生活》。</p>
          <img src="https://www.sbkk88.com/uploads/allimg/150802/191105H02-0.jpg" width="350" height="140" />
          <p>虽然，《向往的生活》本质是<font size="3" color="blue">致幻剂一样“假想的生活”，但其实无所谓。毕竟人很脆弱的，没有幻觉，活不下去。</p>
          <br>
          <br>
          <p>1.</p>
          <p>《向往的生活》提供了一种怎样的理想生活图景呢？</p>
          <p>首先要有山青水绿的美景，还要有一个小窝。</p>
          <p>从第一季的北京密云，第二季的浙江桐庐，第三季的湖南湘西，到新一季，来到了云南西双版纳，第一期开场就是一段美丽的航拍长镜头。</p>
          <img src="https://www.sbkk88.com/uploads/allimg/150802/191105FK-5.jpg" width="200" height="340" />
          <p>镜头随着一缕孔雀羽毛缓缓而至，滑过绿树农屋，滑过骑单车嬉笑的孩子们，滑过悠然自得的村民们，落至长着芭蕉树、停着门前椅的一间院落。</p>
          <p><font size="3" color="blue">院子里有鸡鸣狗吠声，有奶牛哞哞叫，还有一大家子热情好客的主人，准备招待即将到来的客人。</p>
          <p>这就是走过了四季，但又在不同理想之地停落的——蘑菇屋。</p>
        </div>
      """,
    );
    //文章介绍
    /*essayInfo = EssayInfo(
      artTitle:"错过的终究放下",
      artAuthor:"文/转角的丁香 ",
      artSay:"不得不说时间真的是这个世间最好的跨度，一些承诺，一段誓言，终究败给了时间，回忆再美好也经不住流年。有些人错过了终究得放下……。",
      sayAuthor:"--self",
      //文章内容
      essays:[
        Essays(
          artContent: "不得不说时间真的是这个世间最好的跨度，一些承诺，一段誓言，终究败给了时间，回忆再美好也经不住流年。有些人错过了终究得放下……",
          artImg: "http://www.haofaba.com/uploads/allimg/170903/1225394257-3.jpg",
        ),
        Essays(
          artContent: "在过往中，总有一个人，曾经是你的满心欢喜，现在却成了你的闭口不提。他闯进我们的生活，带给我们感动和美好，却又在某一时刻，猝不及防的从我们身边抽离，留下了一地的回忆。",
          artImg: "https://www.sbkk88.com/uploads/allimg/150802/191105H02-0.jpg"
        ),
        Essays(
          artContent: "当初说着各种承诺、各种誓言，我也相信了你就是我的小确幸。也是你让我相信了这世间还有美好，可最终你还是离我而去，终究你我成了彼此生命中的过客。",
          artImg: "https://www.sbkk88.com/uploads/allimg/150802/191105FK-5.jpg",
        ),
        Essays(
          artContent: "我们错过了，我曾幻想过天长地久；我也曾幻想过和你手牵手走在黄昏的路上。可终究你走了，留给我的只有回忆。我以为守着回忆你就可以回来，可是我错了，我，终究没等来你的转身，我终究知道错过了就是错过了，回不来了。我也终于决定放下了……",
          artImg: "https://www.sbkk88.com/uploads/allimg/150802/1911053232-7.jpg",
        ),
        Essays(
          artContent: "终于下定决心把你归还于人海了！其实很早就在逼自己慢慢的去放手了，每次听着你那冠冕堂皇的话我尽然差点相信了我和你会有以后……",
          artImg: "https://www.sbkk88.com/uploads/allimg/150802/191105FK-5.jpg",
        ),
        Essays(
          artContent: "我没有你善于伪装，我学不会做最坏的人，我也不想浪费太多的时间和精力去等一个不可能的结果！虽然先动心、动情的人是你，无数次主动和挽留的人也是你，可我还是学不会去做一个你渴望中的人。",
          artImg: "https://www.sbkk88.com/uploads/allimg/150802/1911053Q0-3.jpg",
        ),
        Essays(
          artContent: "这一路有快乐、有坎坷、有心酸。记得你曾对我说过：“这一路来太多的心酸和坎坷自己必须好好珍惜才是……”你也说过：“我不必有顾虑，你会珍惜你会好好保护着我……”这些话在耳边响起犹如昨天，那么悦耳那么清晰。可我不想这样原地不动的去等待和期望了，我准备回头了，回到我的原点，回到不是和你开始的原地了……。",
          artImg: "https://www.sbkk88.com/uploads/allimg/150802/1911051645-2.jpg",
        ),
        Essays(
          artContent: "你的承诺和誓言总归太遥远，你总归太缥缈。当我不在是你生命中的独一无二，我宁愿离去，也不愿在一份残缺的爱里苦苦挣扎。",
          artImg: "http://b-ssl.duitang.com/uploads/item/201702/01/20170201123938_N35ak.jpeg",
        ),
        Essays(
          artContent: "你总归是我命中未了的缘和劫，我们也终究错过了！如果上天能够重新来过，我会绕过那个和你认识的地方，遇见你也许就是没有结果，可我也能释怀了。",
          artImg: "http://img3.duitang.com/uploads/item/201502/06/20150206143736_EfeTh.jpeg",
        ),
        Essays(
          artContent: "我不能抱着那些回忆来折磨自己，我也不想就这样颓废的麻木的去过每一天了。你给的一切在回忆的沼泽里只会让我放不下，你走后在每一个似曾相识的场景里我总是会不由自主的想起你，我会盯着你送的东西久久的发呆，也会因为看到某个熟悉的背影，而伤心落泪。",
          artImg: "http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20170828/4683055dc2b4409994b215d41ba5dc1a.jpeg",
        ),
        Essays(
          artContent: "我曾试过收起那些东西甚至屏蔽一切与你有关的东西。直到最后，我不得不承认，用心爱过的人，就连忘记也需要格外用力。",
          artImg: "http://img3.duitang.com/uploads/item/201411/02/20141102173717_u4HQt.thumb.700_0.jpeg",
        ),
        Essays(
          artContent: "我也曾试着挽回，试着去弥补，可终究太苍白太无力了。这就是世间的无奈，我也不得不承认你我终究错过了，我也该放下了……",
          artImg: "http://n.sinaimg.cn/sinacn23/173/w612h361/20180710/4f23-hfefkqp8361690.jpg",
        ),
        Essays(
          artContent: "现在的我终于学会了该怎么去割舍，我终究学会了真正的放下就是面对你的一切波澜不惊、坦然面对。即使听见你的名字多少次也不再泛起涟漪，终于接受了，你只能陪我一程，终究无法参与我的余生。",
          artImg: "http://b-ssl.duitang.com/uploads/item/201411/26/20141126114907_Kir2s.thumb.700_0.jpeg",
        ),
        Essays(
          artContent: "谢谢你教会我的一切，包括那些没实现的承诺……或许你会说你爱过我，可我还是决定把你归还于人海了，不是赌气，也不是不爱，只是觉得该清醒了……",
          artImg: "http://5b0988e595225.cdn.sohucs.com/images/20170907/e49ef16ed83e455ca0ab739c2159145d.jpeg",
        ),
        Essays(
          artContent:"我终于能很轻松地说我们错过了，你终究是那个错的人，我也决定放下了！余生很长，放下错的人，才能拥抱属于我的幸福。",
        )
      ]
    );*/

  
    

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
  String sayAuthor;
  List<Essays> essays;
  String essayContent;

  EssayInfo({
    this.artTitle,
    this.artAuthor,
    this.artAloud,
    this.artSay,
    this.sayAuthor,
    this.essays,
    this.essayContent,
  });
}

class Essays{
  String artContent;
  String artImg;

  Essays({
    this.artContent,
    this.artImg,
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


