import 'package:flutter/material.dart';

class ChapterProvider with ChangeNotifier{
  List<Section> section = new List<Section>();

  ChapterProvider(){
    section = [
      Section(
        secImg: "http://www.520touxiang.com/uploads/allimg/201903220953/bpl2gedsihs.jpg",
        secTitle: "灼目之夏：第一章：旧事",
        secSubtitle: "不知道这十年以来，你们过得好吗？"
      ),
      Section(
        secImg: "http://www.520touxiang.com/uploads/allimg/201903220953/bpl2gedsihs.jpg",
        secTitle: "灼目之夏：第一章：朱丽叶",
        secSubtitle: "不要把这当成一件悲伤的事，拜托了！"
      ),
      Section(
        secImg: "http://www.520touxiang.com/uploads/allimg/201903220953/bpl2gedsihs.jpg",
        secTitle: "灼目之夏：第一章：醉梦溪",
        secSubtitle: "今天起你就要独自生活，要多珍重，不要感晦暗。"
      ),
      Section(
        secImg: "http://www.520touxiang.com/uploads/allimg/201903220953/bpl2gedsihs.jpg",
        secTitle: "灼目之夏：第一章：细烟",
        secSubtitle: "这个男生就像小猫，只要好玩的都有兴趣上前桡一下"
      ),
      Section(
        secImg: "http://www.520touxiang.com/uploads/allimg/201903220953/bpl2gedsihs.jpg",
        secTitle: "灼目之夏：第一章：芭蕾舞步",
        secSubtitle: "即使是一架落满灰尘的钢琴，也能弹出最优秀的旋律"
      ),
      Section(
        secImg: "http://www.520touxiang.com/uploads/allimg/201903220953/bpl2gedsihs.jpg",
        secTitle: "灼目之夏：第一章：伤疤",
        secSubtitle: "有份举着刀子制造那道伤疤的人，也有你一个呢。"
      ),
    ];
  }
}

class Section{
  String secImg;
  String secTitle;
  String secSubtitle;

  Section({
    this.secImg,
    this.secTitle,
    this.secSubtitle,
  });
}