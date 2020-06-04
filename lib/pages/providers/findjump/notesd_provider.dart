import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotesdProvider with ChangeNotifier{
  Record record;
  NotesdProvider(){
    record = Record(
      comeIcon: Icons.keyboard_arrow_left,
      notIcon: Icons.favorite_border,
      favIcon: Icons.favorite,
      recordFav: 46,
      ifFav: false,
      downIcon: Icons.arrow_downward,
      ifDown: false,
      recordImg: "https://storage.googleapis.com/dev-smiletaiwan-cms-cwg-tw/ckeditor/201901/ckeditor-5c4f17d8ea24b.jpg",
      recordmark: "ONE",
      recordInfo: "雨打梨花深闭门，忘了青春，误了青春。赏心乐事共谁论？花下销魂，月下销魂。(忘了 一作：孤负；误了 一作：虚负),愁聚眉峰尽日颦，千点啼痕，万点啼痕。晓看天色暮看云，行也思君，坐也思君",
      recordAuthor: "唐寅"
    );
  }
  tapFav(){
    record.ifFav = !record.ifFav;
    if(record.ifFav){
      record.recordFav += 1;
    }else{
      record.recordFav -= 1;
    }
    notifyListeners();
  }

  tapDown(){
    record.ifDown = !record.ifDown;
    if(record.ifDown){
      Fluttertoast.showToast(
        msg: "一个：已保存至相册",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 14,
      );
    }
  }
}

class Record {
  IconData comeIcon;
  IconData notIcon;
  IconData favIcon;
  int recordFav;
  bool ifFav;
  IconData downIcon;
  bool ifDown;
  String recordImg;
  String recordmark;
  String recordInfo;
  String recordAuthor;

  Record({
    this.comeIcon,
    this.notIcon,
    this.favIcon,
    this.recordFav,
    this.ifFav,
    this.downIcon,
    this.ifDown,
    this.recordImg,
    this.recordmark,
    this.recordInfo,
    this.recordAuthor,
  });
}