
import 'package:flutter/material.dart';

class FindProvider with ChangeNotifier{
 
  List<Reads> reads = List<Reads>();
  List<Graphics> graphics = List<Graphics>();
  List<Topic> topic = List<Topic>();
  List<Hots> hots = List<Hots>(); 
  List<Qa> qa = List<Qa>();
  List<Music> music = List<Music>();
  List<Film> film = List<Film>();
  List<Radios> radios = List<Radios>();
  List<Notes> notes = List<Notes>();
  List<Author> author = List<Author>();


  //TabBarView栏
  FindProvider(){

    //阅读
    reads = [
      Reads(
        readUrl: "https://pic1.znj.com/Uploads/Editor/2018-02-06/5a7955fdc095e.png",
        readtitle: "最后的日子",
        readsubtitle: "文/夏阳",
      ),
      Reads(
        readUrl: "https://pbs.twimg.com/profile_images/1177759255115419649/-FcrF3FQ_400x400.jpg",
        readtitle: "没有神像的庙宇",
        readsubtitle: "文/杨不成",
      ),
      Reads(
        readUrl: "https://n.sinaimg.cn/sinacn/w640h1093/20180129/bdd5-fyqzcxh8691409.jpg",
        readtitle: "燃烧的处女地",
        readsubtitle: "文/白海",
      ),
      Reads(
        readUrl: "http://www.china-npa.org/uploads/1/image/public/201903/20190305161435_0cpe8n0rgp.jpg",
        readtitle: "去生活里旅行",
        readsubtitle: "文/苏更生",
      ),
      Reads(
        readUrl: "https://pic1.znj.com/Uploads/Editor/2018-02-06/5a7955fdc095e.png",
        readtitle: "伤怀",
        readsubtitle: "文/刘酿苦",
      ),
      Reads(
        readUrl: "https://pic1.znj.com/Uploads/Editor/2018-02-06/5a7955fdc095e.png",
        readtitle: "最后的日子",
        readsubtitle: "文/夏阳",
      ),
      Reads(
        readUrl: "https://pbs.twimg.com/profile_images/1177759255115419649/-FcrF3FQ_400x400.jpg",
        readtitle: "没有神像的庙宇",
        readsubtitle: "文/杨不成",
      ),
      Reads(
        readUrl: "https://n.sinaimg.cn/sinacn/w640h1093/20180129/bdd5-fyqzcxh8691409.jpg",
        readtitle: "燃烧的处女地",
        readsubtitle: "文/白海",
      ),
      Reads(
        readUrl: "http://www.china-npa.org/uploads/1/image/public/201810/20181008164601_ot2s5m6mib.jpg",
        readtitle: "去生活里旅行",
        readsubtitle: "文/苏更生",
      ),
      Reads(
        readUrl: "https://pic1.znj.com/Uploads/Editor/2018-02-06/5a7955fdc095e.png",
        readtitle: "伤怀",
        readsubtitle: "文/刘酿苦",
      ),
      Reads(
        readUrl: "https://pic1.znj.com/Uploads/Editor/2018-02-06/5a7955fdc095e.png",
        readtitle: "最后的日子",
        readsubtitle: "文/夏阳",
      ),
      Reads(
        readUrl: "https://pbs.twimg.com/profile_images/1177759255115419649/-FcrF3FQ_400x400.jpg",
        readtitle: "没有神像的庙宇",
        readsubtitle: "文/杨不成",
      ),
      Reads(
        readUrl: "https://n.sinaimg.cn/sinacn/w640h1093/20180129/bdd5-fyqzcxh8691409.jpg",
        readtitle: "燃烧的处女地",
        readsubtitle: "文/白海",
      ),
      Reads(
        readUrl: "http://www.china-npa.org/uploads/1/image/public/201806/20180612142232_h3m3pjp461.jpg",
        readtitle: "去生活里旅行",
        readsubtitle: "文/苏更生",
      ),
      Reads(
        readUrl: "https://pic1.znj.com/Uploads/Editor/2018-02-06/5a7955fdc095e.png",
        readtitle: "伤怀",
        readsubtitle: "文/刘酿苦",
      ),
    ];
  
    //图文
    graphics = [
      Graphics(
        graUrl: "https://www.huabaike.com/uploads/allimg/sltimg/201612/5847c48187775.jpg",
        gradate: "2020-04-21",
      ),
       Graphics(
        graUrl: "https://5b0988e595225.cdn.sohucs.com/images/20180224/08196272d5454c1fb85e84f0b4fd44ca.jpeg",
        gradate: "2020-04-20",
      ),
       Graphics(
        graUrl: "https://m.360buyimg.com/pop/jfs/t22441/3/1738745552/203738/a33ffbbb/5b695049N876a58f3.png",
        gradate: "2020-04-19",
      ),
       Graphics(
        graUrl: "https://thumb22.jfcdns.com/thumb/up/2018-3/2018031311060361201_460_380.jpg",
        gradate: "2020-04-18",
      ),
       Graphics(
        graUrl: "https://5b0988e595225.cdn.sohucs.com/images/20180224/08196272d5454c1fb85e84f0b4fd44ca.jpeg",
        gradate: "2020-04-17",
      ),
       Graphics(
        graUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018031311060518706_460_380.jpg",
        gradate: "2020-04-16",
      )
    ];
  
    //专题
    topic = [
      Topic(
        topUrl:"http://5b0988e595225.cdn.sohucs.com/images/20180105/4bb64ee2feb54622af3a2bf99dfb7e99.jpeg",
        toptitle:"[书法大赛]获奖作品",
      ),
      Topic(
        topUrl:"http://5b0988e595225.cdn.sohucs.com/images/20180105/4fdec8394a614501be6dcff0b0d0e8e8.jpeg",
        toptitle:"品茶之道",
      ),
      Topic(
        topUrl:"http://5b0988e595225.cdn.sohucs.com/images/20180105/f644311c7fd3447f89566108b188ba9b.jpeg",
        toptitle:"有意境的古风美图",
      ),
      Topic(
        topUrl:"http://5b0988e595225.cdn.sohucs.com/images/20180105/70c5f3b1f5224480a1e59525763025ea.jpeg",
        toptitle:"岁月静好",
      ),
      Topic(
        topUrl:"http://5b0988e595225.cdn.sohucs.com/images/20180105/53dab23caf9148109ae7416e51ce34ef.jpeg",
        toptitle:"落在心尖的一片叶子",
      ),
    ];
  
    //热榜
    hots = [
      Hots(
        hotstitle: "2019问答年度热榜",
        hotsUrl:"https://thumb22.jfcdns.com/thumb/up/2018-3/2018031311060479081_460_380.jpg",
        hotstype1:"有哪些让人舒服死的聊天技巧？",
        hotstype2: "人为什么要结婚？",
        hotstype3: "一个女生要怎样才算见过世面?",
        hotsseal: "#问答",
      ),
      Hots(
        hotstitle: "2019年阅读年度热搜",
        hotsUrl:"https://thumb21.jfcdns.com/thumb/up/2018-3/2018031311060518706_460_380.jpg",
        hotstype1: "弄堂的瓦解",
        hotstype2: "一生热爱，回头太难",
        hotstype3: "人生有奇遇",
        hotsseal: "#阅读",
      ),
      Hots(
        hotstitle: "2019年连载年度热榜",
        hotsUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018031311060539408_460_380.jpg",
        hotstype1: "向着明亮的那方",
        hotstype2: "日落的第五大道",
        hotstype3: "说吧，别怕",
        hotsseal: "#连载",
      ),
      Hots(
        hotstitle: "2018年音乐年度热榜",
        hotsUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018031311060645808_460_380.jpg",
        hotstype1: "我们重新开始吧",
        hotstype2: "我喜欢上的，只是自己的一厢情愿而已",
        hotstype3:  "愿我下次见你，谈笑风生不动情",
        hotsseal:"#音乐",
      ),
    ];
  
    //问答
    qa = [
      Qa(
        qaUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/15210136558146162_460_380.jpg",
        qatitle: "爱情里有先来后到吗？",
        qasubtitle: "我难道要和她结婚么？",
      ),
      Qa(
        qaUrl: "https://thumb22.jfcdns.com/thumb/up/2018-3/15210137941766263_460_380.jpg",
        qatitle: "怎样平衡健康与工作的关系？",
        qasubtitle: "不要被时间推着走，然后我们的身体买单",
      ),
       Qa(
        qaUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/15210136558146162_460_380.jpg",
        qatitle: "爱情里有先来后到吗？",
        qasubtitle: "我难道要和她结婚么？",
      ),
      Qa(
        qaUrl: "https://thumb22.jfcdns.com/thumb/up/2018-3/15210137941766263_460_380.jpg",
        qatitle: "怎样平衡健康与工作的关系？",
        qasubtitle: "不要被时间推着走，然后我们的身体买单",
      ),
       Qa(
        qaUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/15210136558146162_460_380.jpg",
        qatitle: "爱情里有先来后到吗？",
        qasubtitle: "我难道要和她结婚么？",
      ),
      Qa(
        qaUrl: "https://thumb22.jfcdns.com/thumb/up/2018-3/15210137941766263_460_380.jpg",
        qatitle: "怎样平衡健康与工作的关系？",
        qasubtitle: "不要被时间推着走，然后我们的身体买单",
      ),
       Qa(
        qaUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/15210136558146162_460_380.jpg",
        qatitle: "爱情里有先来后到吗？",
        qasubtitle: "我难道要和她结婚么？",
      ),
      Qa(
        qaUrl: "https://thumb22.jfcdns.com/thumb/up/2018-3/15210137941766263_460_380.jpg",
        qatitle: "怎样平衡健康与工作的关系？",
        qasubtitle: "不要被时间推着走，然后我们的身体买单",
      ),
       Qa(
        qaUrl: "https://thumb21.jfcdns.com/thumb/up/2018-3/15210136558146162_460_380.jpg",
        qatitle: "爱情里有先来后到吗？",
        qasubtitle: "我难道要和她结婚么？",
      ),
      Qa(
        qaUrl: "https://thumb22.jfcdns.com/thumb/up/2018-3/15210137941766263_460_380.jpg",
        qatitle: "怎样平衡健康与工作的关系？",
        qasubtitle: "不要被时间推着走，然后我们的身体买单",
      ),
    ];
  
    //音乐
    music = [
      Music(
        musicUrl: "https://thumb22.jfcdns.com/thumb/up/2018-1/15168440573852155_460_380.jpg",
        musictitle: "这一生真是坎坷，遇见你又弄丢你",
        musicsubtitle: "换了人|梁苏理"
      ),
      Music(
        musicUrl: "https://thumb21.jfcdns.com/thumb/up/2018-1/15168440755100752_460_380.jpg",
        musictitle: "我最终选择放过自己，不再去找你",
        musicsubtitle:"不扰了|郭旭"
      ),
      Music(
        musicUrl: "https://thumb22.jfcdns.com/thumb/up/2018-1/15168440573852155_460_380.jpg",
        musictitle: "这一生真是坎坷，遇见你又弄丢你",
        musicsubtitle: "换了人|梁苏理"
      ),
      Music(
        musicUrl: "https://thumb21.jfcdns.com/thumb/up/2018-1/15168440755100752_460_380.jpg",
        musictitle: "我最终选择放过自己，不再去找你",
        musicsubtitle:"不扰了|郭旭"
      ),
      Music(
        musicUrl: "https://thumb22.jfcdns.com/thumb/up/2018-1/15168440573852155_460_380.jpg",
        musictitle: "这一生真是坎坷，遇见你又弄丢你",
        musicsubtitle: "换了人|梁苏理"
      ),
      Music(
        musicUrl: "https://thumb21.jfcdns.com/thumb/up/2018-1/15168440755100752_460_380.jpg",
        musictitle: "我最终选择放过自己，不再去找你",
        musicsubtitle:"不扰了|郭旭"
      ),
      Music(
        musicUrl: "https://thumb22.jfcdns.com/thumb/up/2018-1/15168440573852155_460_380.jpg",
        musictitle: "这一生真是坎坷，遇见你又弄丢你",
        musicsubtitle: "换了人|梁苏理"
      ),
      Music(
        musicUrl: "https://thumb21.jfcdns.com/thumb/up/2018-1/15168440755100752_460_380.jpg",
        musictitle: "我最终选择放过自己，不再去找你",
        musicsubtitle:"不扰了|郭旭"
      ),
      Music(
        musicUrl: "https://thumb22.jfcdns.com/thumb/up/2018-1/15168440573852155_460_380.jpg",
        musictitle: "这一生真是坎坷，遇见你又弄丢你",
        musicsubtitle: "换了人|梁苏理"
      ),
      Music(
        musicUrl: "https://thumb21.jfcdns.com/thumb/up/2018-1/15168440755100752_460_380.jpg",
        musictitle: "我最终选择放过自己，不再去找你",
        musicsubtitle:"不扰了|郭旭"
      ),
      
    ];
  
    //影视
    film = [
      Film(
        filmUrl: "https://thumb21.jfcdns.com/thumb/up/2018-4/2018040411134717290_460_380.jpg",
        filmtitle: "美好就是，回到爱你的那天",
        filmsubtitle: "《美好年代》",
      ),
      Film(
        filmUrl: "https://thumb22.jfcdns.com/thumb/up/2018-4/2018040411134914055_460_380.jpg",
        filmtitle: "孤独会被听见，只要你愿意",
        filmsubtitle: "《朋友请听好》",
      ),
      Film(
        filmUrl: "https://thumb21.jfcdns.com/thumb/up/2018-4/2018040411134717290_460_380.jpg",
        filmtitle: "美好就是，回到爱你的那天",
        filmsubtitle: "《美好年代》",
      ),
      Film(
        filmUrl: "https://thumb22.jfcdns.com/thumb/up/2018-4/2018040411134914055_460_380.jpg",
        filmtitle: "孤独会被听见，只要你愿意",
        filmsubtitle: "《朋友请听好》",
      ),
      Film(
        filmUrl: "https://thumb21.jfcdns.com/thumb/up/2018-4/2018040411134717290_460_380.jpg",
        filmtitle: "美好就是，回到爱你的那天",
        filmsubtitle: "《美好年代》",
      ),
      Film(
        filmUrl: "https://thumb22.jfcdns.com/thumb/up/2018-4/2018040411134914055_460_380.jpg",
        filmtitle: "孤独会被听见，只要你愿意",
        filmsubtitle: "《朋友请听好》",
      ),
      Film(
        filmUrl: "https://thumb21.jfcdns.com/thumb/up/2018-4/2018040411134717290_460_380.jpg",
        filmtitle: "美好就是，回到爱你的那天",
        filmsubtitle: "《美好年代》",
      ),
      Film(
        filmUrl: "https://thumb22.jfcdns.com/thumb/up/2018-4/2018040411134914055_460_380.jpg",
        filmtitle: "孤独会被听见，只要你愿意",
        filmsubtitle: "《朋友请听好》",
      ),
      Film(
        filmUrl: "https://thumb21.jfcdns.com/thumb/up/2018-4/2018040411134717290_460_380.jpg",
        filmtitle: "美好就是，回到爱你的那天",
        filmsubtitle: "《美好年代》",
      ),
      Film(
        filmUrl: "https://thumb22.jfcdns.com/thumb/up/2018-4/2018040411134914055_460_380.jpg",
        filmtitle: "孤独会被听见，只要你愿意",
        filmsubtitle: "《朋友请听好》",
      ),
    ];

    //电台
    radios = [
      Radios(
        radiosUrl: "https://images.lnka.cn/article/20130705204214765.jpg",
        radioslab: "ONE电台",
        radiosper: "第808期",
        radiostitle: "你真幸福，永远把事情想得那么简单",
        radiosavatar: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018032511294497906_460_380.jpg",
        radiosname: "李洁盈",
        radiosfav: 2834,
        isFaved: false
      ),
      Radios(
        radiosUrl: "https://a.ksd-i.com/a/2017-11-23/100156-558408.jpg",
        radioslab: "ONE电台",
        radiosper: "第807期",
        radiostitle: "问我全世界哪里最美，答案是你身边",
        radiosavatar: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018032511294463464_460_380.jpg",
        radiosname: "陈橙",
        radiosfav: 736,
        isFaved: false
      ),
      Radios(
        radiosUrl: "https://images.lnka.cn/article/20130705204214765.jpg",
        radioslab: "ONE电台",
        radiosper: "第808期",
        radiostitle: "你真幸福，永远把事情想得那么简单",
        radiosavatar: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018032511294497906_460_380.jpg",
        radiosname: "李洁盈",
        radiosfav: 2834,
        isFaved: false
      ),
      Radios(
        radiosUrl: "https://a.ksd-i.com/a/2017-11-23/100156-558408.jpg",
        radioslab: "ONE电台",
        radiosper: "第807期",
        radiostitle: "问我全世界哪里最美，答案是你身边",
        radiosavatar: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018032511294463464_460_380.jpg",
        radiosname: "陈橙",
        radiosfav: 736,
        isFaved: false
      ),Radios(
        radiosUrl: "https://images.lnka.cn/article/20130705204214765.jpg",
        radioslab: "ONE电台",
        radiosper: "第808期",
        radiostitle: "你真幸福，永远把事情想得那么简单",
        radiosavatar: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018032511294497906_460_380.jpg",
        radiosname: "李洁盈",
        radiosfav: 2834,
        isFaved: false
      ),
      Radios(
        radiosUrl: "https://a.ksd-i.com/a/2017-11-23/100156-558408.jpg",
        radioslab: "ONE电台",
        radiosper: "第807期",
        radiostitle: "问我全世界哪里最美，答案是你身边",
        radiosavatar: "https://thumb21.jfcdns.com/thumb/up/2018-3/2018032511294463464_460_380.jpg",
        radiosname: "陈橙",
        radiosfav: 736,
        isFaved: false
      ),
    ];

    //小记
    notes = [
      Notes(
        notesUrl: "https://www.diyimei.net/upload/2018/1540988741494445.jpg",
        notescontent: "最好的爱情大概就是：他宠你如初，你爱他到老，你成为他的软肋，他成为你的盔甲",
        notesname: "清河",
        notesdate: "2020.4.15",
        notesaddress: "杭州",
      ),
      Notes(
        notesUrl: "https://img95.699pic.com/photo/50075/5724.jpg_wh300.jpg",
        notescontent: "长大后无论发生什么事，都要装的外表平静如水",
        notesname:"嘻嘻吴文",
        notesdate: "2020.3.27",
        notesaddress: "长春",
      ),
      Notes(
        notesUrl: "https://www.diyimei.net/upload/2018/1540988741494445.jpg",
        notescontent: "最好的爱情大概就是：他宠你如初，你爱他到老，你成为他的软肋，他成为你的盔甲",
        notesname: "清河",
        notesdate: "2020.4.15",
        notesaddress: "杭州",
      ),
      Notes(
        notesUrl: "https://img95.699pic.com/photo/50075/5724.jpg_wh300.jpg",
        notescontent: "长大后无论发生什么事，都要装的外表平静如水",
        notesname:"嘻嘻吴文",
        notesdate: "2020.3.27",
        notesaddress: "长春",
      ),
      Notes(
        notesUrl: "https://www.diyimei.net/upload/2018/1540988741494445.jpg",
        notescontent: "最好的爱情大概就是：他宠你如初，你爱他到老，你成为他的软肋，他成为你的盔甲",
        notesname: "清河",
        notesdate: "2020.4.15",
        notesaddress: "杭州",
      ),
      Notes(
        notesUrl: "https://img95.699pic.com/photo/50075/5724.jpg_wh300.jpg",
        notescontent: "长大后无论发生什么事，都要装的外表平静如水",
        notesname:"嘻嘻吴文",
        notesdate: "2020.3.27",
        notesaddress: "·长春",
      ),
    ];

    //作者
    author = [
      Author(
        authoravatar: "https://tupian.qqw21.com/article/UploadPic/2020-3/20203142246410930.jpg",
        authorname: "小公举",
        authorbrief: "作家，诗人，编辑",
      ),
      Author(
        authoravatar: "https://file.qqtouxiang.com/nansheng/2020-01-06/dddd6b8cf80ca4bd466293ed672f4243.jpg",
        authorname: "老王子",
        authorbrief: "[一个]常驻作家,吉他手，作家，诗人，90后作者，@新老王子",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244129293.jpg",
        authorname: "七七",
        authorbrief: "作家，诗人，成名作",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244834816.jpg",
        authorname: "清溪",
        authorbrief: "[一个]常驻作家,吉他手，画家，诗人，90后作者，@新老王子",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244815968.jpg",
        authorname: "陈小如",
        authorbrief: "90后作家，诗人，编辑",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244120144.jpg",
        authorname: "张熙",
        authorbrief: "[一个]常驻作家,爱猫，作家，诗人，90后作者，@新老王子",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244817775.jpg",
        authorname: "李贵人",
        authorbrief: "散文",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244835849.jpg",
        authorname: "大力",
        authorbrief: "无敌大长腿作家，诗人，90后作者，@新老王子",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244120144.jpg",
        authorname: "张熙",
        authorbrief: "[一个]常驻作家,爱猫，作家，诗人，90后作者，@新老王子",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244817775.jpg",
        authorname: "李贵人",
        authorbrief: "散文",
      ),
      Author(
        authoravatar: "http://img.crcz.com/allimg/202001/23/1579793244835849.jpg",
        authorname: "大力",
        authorbrief: "无敌大长腿作家，诗人，90后作者，@新老王子",
      ),
    ];
  }
}


class Reads{
  String readUrl;
  String readtitle;
  String readsubtitle;

  Reads({
    this.readUrl,
    this.readtitle,
    this.readsubtitle,
  });
}

class Graphics{
  String graUrl;
  String gradate;

  Graphics({
    this.graUrl,
    this.gradate,
  });
}

class Topic{
  String topUrl;
  String toptitle;

  Topic({
    this.topUrl,
    this.toptitle,
  });
}

class Hots{
  String hotstitle;
  String hotsUrl;
  String hotstype1;
  String hotstype2;
  String hotstype3;
  String hotsseal;

  Hots({
    this.hotstitle,
    this.hotsUrl,
    this.hotstype1,
    this.hotstype2,
    this.hotstype3,
    this.hotsseal,
  });
}

class Qa{
  String qaUrl;
  String qatitle;
  String qasubtitle;

  Qa({
    this.qaUrl,
    this.qatitle,
    this.qasubtitle
  });
}

class Music{
  String musicUrl;
  String musictitle;
  String musicsubtitle;

  Music({
    this.musicUrl,
    this.musictitle,
    this.musicsubtitle,
  });
}

class Film{
  String filmUrl;
  String filmtitle;
  String filmsubtitle;

  Film({
    this.filmUrl,
    this.filmtitle,
    this.filmsubtitle,
  });
}

class Radios{
  String radiosUrl;
  String radioslab;
  String radiosper;
  String radiostitle;
  String radiosavatar;
  String radiosname;
  int radiosfav;
  bool isFaved;

  Radios({
    this.radiosUrl,
    this.radioslab,
    this.radiosper,
    this.radiostitle,
    this.radiosavatar,
    this.radiosname,
    this.radiosfav,
    this.isFaved,
  });
}

class Notes{
  String notesUrl;
  String notescontent;
  String notesname;
  String notesdate;
  String notesaddress;

   Notes({
     this.notesUrl,
     this.notescontent,
     this.notesname,
     this.notesdate,
     this.notesaddress,
   });
}

class Author{
  String authoravatar;
  String authorname;
  String authorbrief;

  Author({
    this.authoravatar,
    this.authorname,
    this.authorbrief
  });
}