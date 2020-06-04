import 'package:flutter/material.dart';

class SerialProvider with ChangeNotifier{
  List<Serials> serials = List<Serials>();


  SerialProvider(){
    serials = [
      Serials(
        serUrl:"https://ae01.alicdn.com/kf/HTB1pRlWaEz1gK0jSZLeq6z9kVXar.jpg",
        sertag:"#连载中",
        sermark:"《分手遗迹清理员：惊喜相册：第二章》",
        sertitle:"对未来的担忧，让这世上大多事都变得没劲，想要快速逃离",
        sersubtitle:"文/城迟",
      ),
      Serials(
        serUrl:"https://ae01.alicdn.com/kf/HTB18uJZaAL0gK0jSZFxq6xWHVXa5.jpg",
        sertag:"#已完结",
        sermark:"《世界得了健忘症·第二十二章：健忘》",
        sertitle:"一个女孩子活在这个世界上，做到何种程度才算是保护好自己",
        sersubtitle:"文/昔央",
      ),
      Serials(
        serUrl:"https://ae01.alicdn.com/kf/HTB1L0NYaxD1gK0jSZFyq6AiOVXar.jpg",
        sertag:"#已完结",
        sermark:"《魔都春梦·第十九章：尾声》",
        sertitle:"想看一片苍茫的明天，其实都是我们最好，最开心，最幸福",
        sersubtitle:"文/老王子",
      ),
      Serials(
        serUrl:"https://ae01.alicdn.com/kf/HTB1M44WaAT2gK0jSZFkq6AIQFXaC.jpg",
        sertag:"#连载中",
        sermark:"《两次破碎·第二十二章：终场烟花》",
        sertitle:"火球不停往天上窜，又散成无数个光点，转瞬即逝。没留下任何痕迹",
        sersubtitle:"文/连筑",
      ),
      Serials(
        serUrl:"https://ae01.alicdn.com/kf/HTB1C_XYaAL0gK0jSZFtq6xQCXXa1.jpg",
        sertag:"#连载中",
        sermark:"《无常殿47》",
        sertitle:"隐约有雷声在这酷热中轰然逼近，一场雨尚在途中，……",
        sersubtitle:"文/孙末",
      ),
    ];
  }
}

class Serials{
  String serUrl;
  String sertag;
  String sermark;
  String sertitle;
  String sersubtitle;

  Serials({
    this.serUrl,
    this.sertag,
    this.sermark,
    this.sertitle,
    this.sersubtitle,
  });
}