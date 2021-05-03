import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/character.dart';
import 'package:ui_test/counter.dart';
import 'package:ui_test/home.dart';
import 'package:ui_test/item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHome(),
        '/home': (context) => HomePage(),
        '/character': (context) => Character(),
        '/counter': (context) => Counter(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  List<Item> items = [
    Item(
        "竈門炭治郎",
        "花江夏樹",
        "是竈門家長子，一名善良的少年，具有敏銳的嗅覺，能在與鬼的戰鬥中聞出破綻的「氣味」。為了將變成鬼的妹妹變回人類、並為死去的家人報仇雪恨，加入了專門狩獵惡鬼的組織「鬼殺隊」",
        "https://dvblobcdnjp.azureedge.net//Content/Upload/Popular/Images/2020-11/4f7fa9ea-f279-423d-b6ab-40dc23fb39ae_m.jpg"),
    Item(
        "我妻善逸",
        "下野紘",
        "是炭治郎同期的鬼殺隊士。對自己極度沒有自信，常常說出自嘲的發言。擁有極佳聽覺，能分別出鬼和人類的聲音。極度恐懼時會陷入沉睡，並激發出強勁的實力。",
        "https://ek21.com/news/anime/wp-content/uploads/sites/8/2019/07/e02e77537bbeff5fb113ffc4ac63aae7.jpg"),
    Item(
        "嘴平伊之助",
        "松岡禎丞",
        "嘴平伊之助，是炭治郎同期的鬼殺隊士。經常戴著野豬頭套，性格極為好戰。因為在山林中成長而有著銳利的觸覺，能精確捕捉到尚未進入視野的對象之所在位置。",
        'https://static.wikia.nocookie.net/kimetsu-no-yaiba/images/7/78/%E5%98%B4%E5%B9%B3%E4%BC%8A%E4%B9%8B%E5%8A%A9_%E5%8B%95%E7%95%AB%E8%B3%87%E8%A8%8A%E6%A1%86.png/revision/latest/scale-to-width-down/620?cb=20191007100053&path-prefix=zh-tw'),
    Item(
        "栗花落香奈乎",
        "上田麗奈",
        "是炭治郎同期的女鬼殺隊劍士。總是笑容滿面卻沉默寡言。擁有敏銳的視覺，其優秀的觀察力，可以僅憑微小的舉動準確預測對方下一步的動作。",
        "https://cdn-origin.cool-style.com.tw/cool/2020/08/1588260730-3023618374.jpg"),
    Item(
        "不死川玄彌",
        "岡本信彥",
        "是炭治郎同期的鬼殺隊士。無法使用呼吸法，但是為鬼殺隊奇才，有著強大的咬合力和特殊的消化器官，擁有將鬼吃掉後讓自身體質短暫變成鬼的特異味覺。",
        "https://i.ytimg.com/vi/K7Cw8ouWeS4/maxresdefault.jpg"),
    Item(
        "富岡義勇",
        "櫻井孝宏",
        "鬼殺隊水柱，水之呼吸的使用者。沉著冷靜不苟言笑的黑髮青年，日輪刀刀根刻著「惡鬼滅殺」的字樣。鬼殺隊制服外套著左右兩邊花色不同的羽織，羽織左半邊和他已故好友錆兔的衣服是相同花色，右邊則與已故姊姊蔦子衣服花色一樣，被伊之助稱作「半半羽織」。",
        "https://n.sinaimg.cn/sinakd20200715ac/164/w640h324/20200715/d09b-iwhseiu6926657.jpg"),
    Item(
        "胡蝶忍",
        "早見沙織",
        "鬼殺隊蟲柱，蟲之呼吸的使用者。帶著蝴蝶髮飾、把頭髮盤成夜會卷的少女，鬼殺隊制服外披著蝶翅紋圖案的羽織，是其已故姐姐香奈惠的遺物。鬼殺隊制服由「隱」的前田正夫所製作，初期制服的設計是和甘露寺蜜璃一樣露胸的暴露造型，但她在看過制服後就當著前田的面放火燒掉了。",
        "https://i1.kknews.cc/SIG=22bv96t/ctp-vzntr/3087nq85152s49r4816p2739q18s9170.jpg"),
    Item(
        "煉獄杏壽郎",
        "日野聰",
        "鬼殺隊炎柱，炎之呼吸的使用者。有著一頭黃紅色相間的長髮，鬼殺隊制服外披著火焰圖案的羽織。性格樂天，熱情如火，不太聽人說話，卻擁有出色的領導力和判斷力，在隊中是有如大哥般存在。其食量不輸甘露寺蜜璃，最喜歡鹽燒鯛魚便當和地瓜飯，吃地瓜的時候會開心地發出「哇嚇哇嚇」的讚嘆聲。",
        "https://image1.thenewslens.com/2020/11/apu6davprddvgpskfnr1y85k5ji1yb.png?auto=compress&h=648&q=80&w=1080"),
    Item(
        "宇髄天元",
        "小西克幸",
        "鬼殺隊音柱，音之呼吸的使用者。原忍者，綽號「二刀流的宇髄天元」。護額上有著許多鑽珠的男子，卸妝後意外的十分美型。口頭禪是「華麗」，自稱「祭典之神」。身型壯碩，身體具有一定的抗毒性，可以利用肌肉強行使心臟停止，暫緩毒素的蔓延。養了很多隻身體健壯的肌肉鼠（ムキムキネズミ ?），經過特殊訓練而擁有極高智商，用於搬運物品等支援，一隻就能輕鬆舉起一把刀。",
        "https://i2.kknews.cc/SIG=1tisqtr/ctp-vzntr/4732732s3o60407q838so34qpo77ss09.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueGrey,
            flexibleSpace: FlexibleSpaceBar(
              background: Opacity(
                opacity: 0.6,
                child: Image.asset("images/kv_game_sp.jpg", fit: BoxFit.cover),
              ),
              title: Text("鬼滅之刃角色配音"),
              centerTitle: false,
              collapseMode: CollapseMode.pin,
            ),
            expandedHeight: 200,
            floating: true,
            pinned: true,
            snap: false,
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                tooltip: 'add new item',
                onPressed: () => print('add new item'),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                tooltip: 'more',
                onPressed: () => print('more'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "角色列表",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                )),
          ),
          SliverFixedExtentList(
            itemExtent: 80,
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text(
                  items[index].title,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  items[index].subtitle,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Hero(
                  tag: "avatar-$index",
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: items[index].imageUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                trailing: Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.more_vert),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('$index',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Character(item: items[index], index: index)),
                  );
                },
              ),
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
