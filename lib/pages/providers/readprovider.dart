import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ReadProvider with ChangeNotifier{
  ReadBar readBar;
  ArticleInfo artticleInfo;
  ReadAuthor readAuthor;
  List<ReadRecom> readRecom = List<ReadRecom>();
  List<ReadDis> readDis = List<ReadDis>();
  ReadProvider(){
    
    readBar = ReadBar(
      barTitle:"阅读",
      ifBookmark:false,
    );
    //文章
    artticleInfo = ArticleInfo(
      artContent:"""
      <div>
        <h2>跨越九十度的绝美爱情<h2>
        <h3>文/有梦为马，随处可息<h3>
         <p><font size="3" color="grey"><b>"</b><br>事物的本身是不变的，变的只是人的感觉。</font></p>
         <p  align = "right">--叔本华</p>
         <p>他，年轻有为，风流倜傥，当年以接近满分的高考成绩考取了著名的石油学院，成为普通农家的天之骄子，更是父母和全村人的骄傲.</p>
         <P>她，美丽动人，才华横溢，贫瘠的黄土高原反倒养成了她极其好学的脾性，最终成为了茫茫黄土里破土而出的一只展翅飞翔的金凤凰。</p>
         <p>就像那句被人传颂了千年的爱情佳句一样，‘金凤玉露一相逢，便胜却人间无数’，在一场普通的同学聚会上，无需他同学只言片语的介绍，此时刚参加工作的他就已经被她的美丽面庞，优雅谈吐深深吸引住了，‘初次见面的那一个眼神就已经让我认定她就是我的妻，是我真正命里想相伴一生一世的那个她’，在她离他远去的多年以后，他仍然对他周围的亲戚朋友如是说着怀念她至极点的话语。</p>
         <p>然而，郎虽有意，妾却无意，倒不是因为她身边的仰慕者众多，让他一个刚出校门没有任何条件对她说爱的男孩在她的众多的追求者中感到自惭形愧，而是她一直以学业为重，一心希望出国留学，读取到最高学位，圆自己一个成为真正耀眼夺目的金凤凰之梦，在他的这种倔强的坚持下，身旁的仰慕者则不得不慢慢的离她而去，是呀，一般的凡尘俗人又有几个人能做到对自己的女神只靠一根电话线来倾诉对彼此的相思之情，这和普通人的生活相比也太不现实了。</p>
         <p>或许真的是爱情的力量太伟大了，面对心上之人的选择，他未说一句话，主动向公司领导申请去遥远而又艰苦的国外一线钻井平台工作，所有的同事都知道国外的项目刚刚起步，除了艰苦而恶劣的自然条件，新项目的铺开进行下去更会遇到前所未有的困难，可诱人的福利工资待遇让他义无反顾的投身到茫茫大漠之中，他知道自己爱人的心愿是什么，也明白只有让自己投身与最艰苦的环境中才能帮她实现自己的梦想，如同当年的荷西为了实现三毛 想去撒哈拉沙漠生活的心愿一样，为了自己心爱的人最直接的做法就是帮助自己的爱人为了实现留学海外的梦想提供足够的经济上的支持。从此，一对儿另所有人羡慕不已的恋人隔着千山万水的距离牢牢的维系着对彼此的深情厚谊。</p>
         <p>彼时的他在茫茫的大漠深处不分昼夜的奋战在石油钻井平台的第一线，恶劣的自然条件让他的身心都接受极其严峻的考验，白天沙漠的地表温度高达几十度，长时间穿着密不透风的长筒皮靴让他患上了极其严重的脚气，双脚像烂掉一样的酷痒难耐，震耳欲聋的巨大的钻井机器经常让他出现耳鸣的症状。虽然他的英语早已过了八级，工作中的专业术语仍然让他在与外籍工作人员的交流中感觉异常吃力，所有的艰难险阻都让他在对爱人的深深的感情坚持下一一克服掉了。我一直在想到底是怎样一份浓烈的爱情才会支持着他这么坚硬如铁的克服常人难以想象的困难一直坚守下去，只能感慨一句爱情的力量真的太伟大了。而远在俄罗斯求学的她则是同样的坚强和勇敢，只因着对这一片异国风情的极度热爱就让她硬是一点点克服了语言不通的障碍，零下几十度的低温更是让本就身体孱弱的她变得异常的消瘦，曾经美丽无比的面庞也在残酷的极端低温下渐渐失去了往日的神采飞扬，每一次通过卫星信号的传递维系彼此感情的一对可爱的恋人就这样在无数个深夜默默的将自己对对方的深深的思念深埋心中，呈现在彼此面前永远是乐观自信无忧无虑的面孔。</p>
      </div>
      """
      /*artTitle:"跨越九十度的绝美爱情",
      artAuthor:"文/有梦为马，随处可息 ",
      artAloud:"有声阅读|朗读者-喵喵",
      artSay:"事物的本身是不变的，变的只是人的感觉。",
      sayAuthor:"--叔本华",
      artContent:"他，年轻有为，风流倜傥，当年以接近满分的高考成绩考取了著名的石油学院，成为普通农家的天之骄子，更是父母和全村人的骄傲。\n\n她，美丽动人，才华横溢，贫瘠的黄土高原反倒养成了她极其好学的脾性，最终成为了茫茫黄土里破土而出的一只展翅飞翔的金凤凰。\n\n就像那句被人传颂了千年的爱情佳句一样，‘金凤玉露一相逢，便胜却人间无数’，在一场普通的同学聚会上，无需他同学只言片语的介绍，此时刚参加工作的他就已经被她的美丽面庞，优雅谈吐深深吸引住了，‘初次见面的那一个眼神就已经让我认定她就是我的妻，是我真正命里想相伴一生一世的那个她’，在她离他远去的多年以后，他仍然对他周围的亲戚朋友如是说着怀念她至极点的话语。\n\n然而，郎虽有意，妾却无意，倒不是因为她身边的仰慕者众多，让他一个刚出校门没有任何条件对她说爱的男孩在她的众多的追求者中感到自惭形愧，而是她一直以学业为重，一心希望出国留学，读取到最高学位，圆自己一个成为真正耀眼夺目的金凤凰之梦，在他的这种倔强的坚持下，身旁的仰慕者则不得不慢慢的离她而去，是呀，一般的凡尘俗人又有几个人能做到对自己的女神只靠一根电话线来倾诉对彼此的相思之情，这和普通人的生活相比也太不现实了。\n\n或许真的是爱情的力量太伟大了，面对心上之人的选择，他未说一句话，主动向公司领导申请去遥远而又艰苦的国外一线钻井平台工作，所有的同事都知道国外的项目刚刚起步，除了艰苦而恶劣的自然条件，新项目的铺开进行下去更会遇到前所未有的困难，可诱人的福利工资待遇让他义无反顾的投身到茫茫大漠之中，他知道自己爱人的心愿是什么，也明白只有让自己投身与最艰苦的环境中才能帮她实现自己的梦想，如同当年的荷西为了实现三毛 想去撒哈拉沙漠生活的心愿一样，为了自己心爱的人最直接的做法就是帮助自己的爱人为了实现留学海外的梦想提供足够的经济上的支持。从此，一对儿另所有人羡慕不已的恋人隔着千山万水的距离牢牢的维系着对彼此的深情厚谊。\n\n彼时的他在茫茫的大漠深处不分昼夜的奋战在石油钻井平台的第一线，恶劣的自然条件让他的身心都接受极其严峻的考验，白天沙漠的地表温度高达几十度，长时间穿着密不透风的长筒皮靴让他患上了极其严重的脚气，双脚像烂掉一样的酷痒难耐，震耳欲聋的巨大的钻井机器经常让他出现耳鸣的症状。虽然他的英语早已过了八级，工作中的专业术语仍然让他在与外籍工作人员的交流中感觉异常吃力，所有的艰难险阻都让他在对爱人的深深的感情坚持下一一克服掉了。我一直在想到底是怎样一份浓烈的爱情才会支持着他这么坚硬如铁的克服常人难以想象的困难一直坚守下去，只能感慨一句爱情的力量真的太伟大了。而远在俄罗斯求学的她则是同样的坚强和勇敢，只因着对这一片异国风情的极度热爱就让她硬是一点点克服了语言不通的障碍，零下几十度的低温更是让本就身体孱弱的她变得异常的消瘦，曾经美丽无比的面庞也在残酷的极端低温下渐渐失去了往日的神采飞扬，每一次通过卫星信号的传递维系彼此感情的一对可爱的恋人就这样在无数个深夜默默的将自己对对方的深深的思念深埋心中，呈现在彼此面前永远是乐观自信无忧无虑的面孔。"*/
    );
    //作者
    readAuthor = ReadAuthor(
      autAvatar:"http://m.imeitou.com/uploads/allimg/2020042908/ijh52bcbehg.jpeg",
      autName:"溪森",
      autIntro: "自由写作者，喜欢寻找消逝的时间。",
    );
    //相关推荐
    readRecom = [
      ReadRecom(
        recomType:"阅读",
        recomTitle:"遇见",
        recomSubtitle:"文/夏阳"
      ),
      ReadRecom(
        recomType:"阅读",
        recomTitle:"今年夏天没来",
        recomSubtitle:"文/王萌"
      )
    ];
    //评论列表
    readDis = [
      ReadDis(
        disAvatar:"http://m.imeitou.com/uploads/allimg/2020041017/i4pqjve2hgm.jpeg",
        disName:"Sibylnil",
        disDate:"2020.05.12 12:07:24",
        disContent:"他从地狱来，要到天堂去，正路过人间",
        dislike: 648,
        ifLike: false
      ),
      ReadDis(
        disAvatar:"http://m.imeitou.com/uploads/allimg/2018092622/12fnfz3gdds.jpg",
        disName:"等待",
        disDate:"2020.05.01 07:25:05",
        disContent:"你看，这才是人生，真实的未来",
        dislike: 1374,
        ifLike: false
      ),
      ReadDis(
        disAvatar:"http://m.imeitou.com/uploads/allimg/2019102116/bmpyu5axdp3.jpg",
        disName:"小小小小",
        disDate:"2020.04.25 05:30:03",
        disContent:"爱情很美，只是我从没遇见",
        dislike: 792,
        ifLike: false
        
      ),
    ];
   
  }
  tapBok(){
    readBar.ifBookmark = !readBar.ifBookmark;
    if(readBar.ifBookmark){
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
  void tapLike(ReadDis readDis) {
    readDis.ifLike = !readDis.ifLike;
    if(readDis.ifLike){
      readDis.dislike +=1;
    }else{
      readDis.dislike -=1;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}



class ReadBar{
  String barTitle;
  bool ifBookmark;

  ReadBar({
    this.barTitle,
    this.ifBookmark,
  });
}

class ArticleInfo{
  String artTitle;
  String artAuthor;
  String artAloud;
  String artSay;
  String artContent;
  String sayAuthor;

  ArticleInfo({
    this.artTitle,
    this.artAuthor,
    this.artAloud,
    this.artSay,
    this.artContent,
    this.sayAuthor,
  });
}

class ReadAuthor{
  String autAvatar;
  String autName;
  String autIntro;

  ReadAuthor({
    this.autAvatar,
    this.autName,
    this.autIntro,
  });
}

class ReadRecom{
  String recomType;
  String recomTitle;
  String recomSubtitle;

  ReadRecom({
    this.recomType,
    this.recomTitle,
    this.recomSubtitle,
  });
}

class ReadDis{
  String disAvatar;
  String disName;
  String disDate;
  String disContent;
  bool ifLike;
  int dislike;

  ReadDis({
    this.disAvatar,
    this.disName,
    this.disDate,
    this.disContent,
    this.ifLike,
    this.dislike,
  });
}


