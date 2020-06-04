import 'package:flutter/material.dart';

class MyTopProvider with ChangeNotifier{
  Install install;
  InstSetup instSetup ;
  MesNews mesNews;
  List<MesInfo> mesInfo = List<MesInfo>();
  Basic basic;
  List<BasicInfo> basicInfo = List<BasicInfo>();
 
  

  MyTopProvider(){
    install = Install(
      instName: "设置",
    );
    //设置类型
    instSetup = 
      InstSetup(
        category: [
          Category(
            cateItem: "设置",
          ),
          Category(
            cateItem: "隐私",
          ),
          Category(
            cateItem: "反馈",
          ),
          Category(
            cateItem: "关于",
          ),
        ],
        optType: [
          OptType(
            optItem:"夜间模式",
            ifselect:false,
          ),
          OptType(
            optItem:"流量播放提醒",
            ifselect:false
          ),
          OptType(
            optItem:"清除缓存",
            ifselect:false
          ),
          OptType(
            optItem:"隐藏小记",
            ifselect:false
          ),
          OptType(
            optItem:"隐藏歌单",
            ifselect:false
          ),
          OptType(
            optItem:"隐藏其他收藏",
            ifselect:false
          ),
        ],
        feedBack:[
          FeedBack(
            feedItem:"投稿方式",
            feedIcon: Icons.keyboard_arrow_right
          ),
          FeedBack(
            feedItem:"意见与反馈",
            feedIcon: Icons.keyboard_arrow_right
          ),
          FeedBack(
            feedItem:"关注我们",
            feedIcon: Icons.keyboard_arrow_right
          ),
          FeedBack(
            feedItem:"商务合作联系",
            feedIcon: Icons.keyboard_arrow_right
          ),
          FeedBack(
            feedItem:"给一个评分",
            feedIcon: Icons.keyboard_arrow_right
          ),
          FeedBack(
            feedItem:"用户协议",
            feedIcon: Icons.keyboard_arrow_right
          ),
        ],
        verSion:[
          VerSion(
            verItem: "版本号",
            verNumber: "5.0.1"
          ),
        ],
        quitItem: "退出登录"
      );
    
 
    
    mesNews = MesNews(
      newsName: "消息",
    );
    //消息
    mesInfo = [
      MesInfo(
        mesIcon: Icons.chat_bubble_outline,
        mesType: "评论",
      ),
      MesInfo(
        mesIcon: Icons.favorite_border,
        mesType: "赞",
      ),
    ];

    basic = Basic(
      basicName: "编辑资料",
    );
    //编辑资料
    basicInfo = [
      BasicInfo(
        basicType: "基本资料",
      ),
      BasicInfo(
        basicType: "头像",
      ),
      BasicInfo(
        basicType: "背景",
      ),
      BasicInfo(
        basicType: "昵称",
      ),

    ];

  }
  
}
 
class Install{
  String instName;

  Install({
    this.instName,
  });
}


class InstSetup{
  List<Category> category;
  List<OptType> optType;
  List<FeedBack> feedBack;
  List <VerSion> verSion;
  String quitItem;

  InstSetup({ 
    this.category,
    this.optType,
    this.feedBack,
    this.verSion,
    this.quitItem,
  });
}
class Category{
  String cateItem;

  Category({
    this.cateItem,
  });
}

class OptType{
  String optItem;
  bool ifselect;

  OptType({
    this.optItem,
    this.ifselect, 
  });
}

class FeedBack{
  String feedItem;
  IconData feedIcon;

  FeedBack({
    this.feedItem,
    this.feedIcon,
  });
}

class VerSion{
  String verItem;
  String verNumber;

  VerSion({
    this.verItem,
    this.verNumber,
  });
}

class Quit{
  String quitItem;

  Quit({
    this.quitItem,
  });
}
class MesNews{
  String newsName;

  MesNews({
    this.newsName,
  });
}

class MesInfo{
  IconData mesIcon;
  String mesType;

  MesInfo({
    this.mesIcon,
    this.mesType,
  });
}

class Basic{
  String basicName;

  Basic({
    this.basicName,
  });
}

class BasicInfo{
  String basicType;

  BasicInfo({
    this.basicType,
  });
}