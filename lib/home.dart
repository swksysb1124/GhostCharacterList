import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'chess_painter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Position> _blackPositions = [];
  List<Position> _whitePositions = [];
  bool blackTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '鬼滅之刃角色',
          style: Theme.of(context).textTheme.headline4,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Ink(
          color: Colors.white,
          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              ChessGame(
                  size: 400,
                  grid: 8,
                  blackPositions: _blackPositions,
                  whitePositions: _whitePositions,
                  onPlaced: (position) {
                    setState(() {
                      if (blackTurn) {
                        _blackPositions.add(position);
                      } else {
                        _whitePositions.add(position);
                      }
                      blackTurn = !blackTurn;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '主要角色',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCharacterCard(
                      "竈門炭治郎",
                      "花江夏樹",
                      "https://dvblobcdnjp.azureedge.net//Content/Upload/Popular/Images/2020-11/4f7fa9ea-f279-423d-b6ab-40dc23fb39ae_m.jpg",
                    ),
                    buildCharacterCard(
                      "竈門禰豆子",
                      "鬼頭明里",
                      'https://scontent.ftpe3-1.fna.fbcdn.net/v/t1.0-9/84125171_2847127215348022_5027176692171407360_o.jpg?_nc_cat=111&ccb=2&_nc_sid=730e14&_nc_ohc=VSheaj6PB3kAX93X1UU&_nc_ht=scontent.ftpe3-1.fna&oh=a987a27d2db8676239b355cf96637c69&oe=5FFAF818',
                    ),
                    buildCharacterCard(
                      "我妻善逸",
                      "下野紘",
                      "https://ek21.com/news/anime/wp-content/uploads/sites/8/2019/07/e02e77537bbeff5fb113ffc4ac63aae7.jpg",
                    ),
                    buildCharacterCard(
                      "嘴平伊之助",
                      "松岡禎丞",
                      'https://static.wikia.nocookie.net/kimetsu-no-yaiba/images/7/78/%E5%98%B4%E5%B9%B3%E4%BC%8A%E4%B9%8B%E5%8A%A9_%E5%8B%95%E7%95%AB%E8%B3%87%E8%A8%8A%E6%A1%86.png/revision/latest/scale-to-width-down/620?cb=20191007100053&path-prefix=zh-tw',
                    ),
                    buildCharacterCard(
                      "栗花落香奈乎",
                      "上田麗奈",
                      "https://cdn-origin.cool-style.com.tw/cool/2020/08/1588260730-3023618374.jpg",
                    ),
                    buildCharacterCard(
                      "不死川玄彌",
                      "岡本信彥",
                      "https://i.ytimg.com/vi/K7Cw8ouWeS4/maxresdefault.jpg",
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '鬼殺隊 - 九柱',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCharacterCard("富岡義勇", "櫻井孝宏",
                        "https://n.sinaimg.cn/sinakd20200715ac/164/w640h324/20200715/d09b-iwhseiu6926657.jpg",
                        title: '水柱'),
                    buildCharacterCard("胡蝶忍", "早見沙織",
                        "https://i1.kknews.cc/SIG=22bv96t/ctp-vzntr/3087nq85152s49r4816p2739q18s9170.jpg",
                        title: '蟲柱'),
                    buildCharacterCard("煉獄杏壽郎", "日野聰",
                        "https://image1.thenewslens.com/2020/11/apu6davprddvgpskfnr1y85k5ji1yb.png?auto=compress&h=648&q=80&w=1080",
                        title: "炎柱"),
                    buildCharacterCard("宇髄天元", "小西克幸",
                        "https://i2.kknews.cc/SIG=1tisqtr/ctp-vzntr/4732732s3o60407q838so34qpo77ss09.jpg",
                        title: '音柱'),
                  ],
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.all(8),
                child: Card(
                  color: Colors.yellow,
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://n.sinaimg.cn/sinakd20200715ac/164/w640h324/20200715/d09b-iwhseiu6926657.jpg",
                        fit: BoxFit.fitHeight,
                        height: double.infinity,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('水柱',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 10),
                            child: Text('富岡義勇',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white60)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 400,
                color: Colors.tealAccent,
              ),
              Container(
                height: 400,
                color: Colors.teal,
              ),
              Container(
                height: 400,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ChessGame(
      {double size,
      int grid,
      List<Position> blackPositions,
      List<Position> whitePositions,
      Function(Position) onPlaced}) {
    return GestureDetector(
      onTapDown: (details) {
        var x = (details.localPosition.dx / (size / grid)).round();
        var y = (details.localPosition.dy / (size / grid)).round();
        onPlaced(Position(x, y));
      },
      child: CustomPaint(
        size: Size(size, size),
        painter: ChessPainter(blackPositions, whitePositions, grid),
      ),
    );
  }

  Widget buildCharacterCard(name, actor, imageUrl, {title}) {
    return Container(
      width: 400,
      height: 300,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.99), BlendMode.dstATop),
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(title,
                  style: TextStyle(fontSize: 25, color: Colors.white70)),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:
                Text(name, style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(actor,
                style: TextStyle(fontSize: 20, color: Colors.white60)),
          ),
        ],
      ),
    );
  }
}
