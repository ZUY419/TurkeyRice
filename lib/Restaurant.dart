
import 'package:flutter/material.dart';

// 1. 資料零件 (你定義好的類別)
class RestaurantInfo {
  final String name;
  final String imagePath;
  final String description;
  final String hours;
  final String address;

  RestaurantInfo({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.hours,
    required this.address,
  });
}

final List<RestaurantInfo> restaurantList = [
  RestaurantInfo(
    name: "簡單火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/simple.jpg",
    description: "這是一間只需要點一碗大碗雞肉飯跟一碗湯就可以吃飽的地方，並且他們有賣鴨蛋，味道與雞蛋有很大的不同，連不吃蛋黃的人都說好吃！",
    hours: "08:30 – 20:00",
    address: "600 嘉義市東區大雅路二段581號",
  ),
  RestaurantInfo(
    name: "阿宏師火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/aHongShi.jpg",
    description: "嘉義市區超人氣名店，火雞肉片飯口感扎實且淋上香噴噴的油蔥酥，是許多遊客來嘉義必排隊的首選。",
    hours: "10:30 – 20:00",
    address: "600 嘉義市東區光華路108號",
  ),
  RestaurantInfo(
    name: "阿樓師火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/aLouShi.jpg",
    description: "嘉義人的宵夜首選！肉質多汁且鹹香夠味，晚上才營業的特性讓它成為嘉義夜晚最熱鬧的角落之一。",
    hours: "16:00 – 00:00",
    address: "600 嘉義市東區吳鳳北路102號",
  ),
  RestaurantInfo(
    name: "圓環火雞大王",
    imagePath: "assets/image/turkeyRiceStore/yuanHuan.jpg",
    description: "位於圓環附近的經典老店，紅漆招牌非常醒目，火雞肉與醬汁搭配得恰到好處，味道十分傳統。",
    hours: "10:00 – 20:00",
    address: "600 嘉義市東區文化路135號",
  ),
  RestaurantInfo(
    name: "大同火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/daTong.jpg",
    description: "在地經營多年的老店，除了火雞肉飯，各式小菜也是亮點，是許多嘉義學生與家庭日常用餐的好去處。",
    hours: "09:00 – 20:00",
    address: "600 嘉義市東區民族路196號",
  ),
  RestaurantInfo(
    name: "夯仔內火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/hanGaLai.jpg",
    description: "隱身於巷弄中的神級美味，如其名「夯仔內」，外皮酥香的火雞肉片令人驚艷，是饕客才懂得找的店。",
    hours: "10:00 – 14:00",
    address: "600 嘉義市東區安和街27號",
  ),
  RestaurantInfo(
    name: "民主聖地火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/minZu.jpg",
    description: "招牌標榜著獨特的油蔥風味，醬汁偏甜且濃厚，是喜歡重口味火雞肉飯朋友的最佳選擇。",
    hours: "10:00 – 20:40",
    address: "600 嘉義市東區民族路149號",
  ),
  RestaurantInfo(
    name: "和平火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/hePing.jpg",
    description: "這家店的肉質切得較碎但非常有味，價格平實，是嘉義在地非常受歡迎的平民小吃代表。",
    hours: "07:30 – 17:00",
    address: "600 嘉義市東區和平路107號",
  ),
  RestaurantInfo(
    name: "南門火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/nanMen.jpg",
    description: "位於南門圓環附近，老牌的口味傳承，火雞肉處理得非常細膩，是許多嘉義人心中的經典老味道。",
    hours: "07:30 – 15:00",
    address: "600 嘉義市東區安和街2號",
  ),
  RestaurantInfo(
    name: "噴水火雞肉飯(小雅店)",
    imagePath: "assets/image/turkeyRiceStore/penShui.jpg",
    description: "噴水雞肉飯的現代化分店，環境寬敞舒適且有設計感，適合帶外地朋友來體驗高品質的用餐環境。",
    hours: "11:00 – 21:00",
    address: "600 嘉義市東區小雅路382號",
  ),
  RestaurantInfo(
    name: "嘉義人火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/chiayiMan.jpg",
    description: "在地人私藏的早午餐名單，每日清晨開賣，火雞肉質軟嫩不乾柴，醬汁帶有南部特有的微甜尾韻，極具特色的熱門小菜更是常常供不應求。",
    hours: "05:30 – 14:00",
    address: "600 嘉義市東區垂楊路157號",
  ),
  RestaurantInfo(
    name: "檜町火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/hinokiMachi.jpg",
    description: "擁有質感極佳的日式木造建築外觀，不僅用餐環境充滿文青氛圍，火雞肉飯的擺盤與口味也同樣細膩精緻，帶來視覺與味覺的雙重饗宴。",
    hours: "11:00 – 15:00, 17:00 – 20:00 (週三和週四公休)",
    address: "600 嘉義市東區吳鳳北路101號",
  ),
  RestaurantInfo(
    name: "嘉義體育館姐妹花火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/gymSister.jpg",
    description: "鄰近體育館的豪邁系美食，以大份量與厚實的肉片切法聞名，吃起來飽足感十足，配上古早味的濃厚鹹香醬汁，非常適合大食量的朋友前來挑戰。",
    hours: " 06:00 – 14:00 (週三公休)",
    address: "600 嘉義市東區垂楊路一段1號",
  ),
  RestaurantInfo(
    name: "文化火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/culture.jpg",
    description: "坐落於熱鬧的文化路商圈旁，店面乾淨明亮，火雞肉飯的鹹甜比例拿捏得恰到好處，口味十分均衡，是初次探索嘉義美食的優質入門推薦。 ",
    hours: " 10:30 – 13:30, 16:30 – 20:00 (週四公休)",
    address: "600 嘉義市西區民族路351號",
  ),
  RestaurantInfo(
    name: "桃城三禾雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/taoCheng.jpg",
    description: "在地人強力推薦的火雞肉飯老店，用餐時間經常客滿。",
    hours: "10:00 – 19:00 (週四、五公休)",
    address: "600 嘉義市東區民權路97號",
  ),
  RestaurantInfo(
    name: "陳家雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/chen.jpg",
    description: "整體不油膩，雞肉也是軟嫩口感。",
    hours: "11:00 – 4:00 (週四公休)",
    address: "600 嘉義市西區民族路633號",
  ),
  RestaurantInfo(
    name: "興安火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/xinGan.jpg",
    description: "火雞肉片很大塊，味道不錯。",
    hours: "10:30 - 19:30",
    address: "600 嘉義市東區興美六路一號",
  ),
  RestaurantInfo(
    name: "阿霞（芳敏）火雞肉飯創始店",
    imagePath: "assets/image/turkeyRiceStore/aXia.jpg",
    description: "雞肉本身味道保留的不錯，醬汁鹹甜平衡很好。",
    hours: "11:30 - 14:20, 17:00 - 20:20 (週三公休)",
    address: "600 嘉義市西區文化路243號",
  ),
  RestaurantInfo(
    name: "劉里長雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/liuLiZhang.jpg",
    description: "口味偏鹹雞肉飯偏鹹一些，油蔥香、不膩。",
    hours: "09:30 - 14:30, 17:00 - 19:00 (週一公休)",
    address: "600 嘉義市東區光彩街414號",
  ),
  RestaurantInfo(
    name: "邱家雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/chiu.jpg",
    description: "口味清淡樸實，適合搭配滷味等配菜一起享用。",
    hours: "11:00 - 17:00 (週一公休)",
    address: "600 嘉義市東區林森東路43號",
  ),
  RestaurantInfo(
    name: "古早雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/traditional.jpg",
    description: "主打古早味，簡單醬汁搭配油蔥香氣，懷舊風味十足。",
    hours: "10:30 - 19:30",
    address: "600 嘉義市東區林森東路108號",
  ),
  RestaurantInfo(
    name: "嘉林火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/jiaLin.jpg",
    description: "整體口味均衡，米飯與雞肉比例適中，吃起來順口。",
    hours: "10:00 - 19:00",
    address: "600 嘉義市東區新生路669-1號",
  ),
  RestaurantInfo(
    name: "莊記火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/chuangChi.jpg",
    description: "經典台式風味，搭配滷蛋、豆腐等小菜更對味。",
    hours: "11:00 - 20:00 (週三公休)",
    address: "600 嘉義市東區新生路660-5號",
  ),
  RestaurantInfo(
    name: "郭家火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/kuo.jpg",
    description: "肉質濕潤不乾柴，配上半熟蛋等配料提升整體層次。",
    hours: "10:00 - 4:00",
    address: "600 嘉義市東區文化路148號",
  ),
  RestaurantInfo(
    name: "嘉義車頭火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/chiayiStation.jpg",
    description: "位在火車站對面，交通部份對觀光客友好，用餐完就可搭公車到下一站。雖然位在火車站，但是也有許多在地人推薦，機車可以停在店家周圍，汽車可以停到附近的停車場。店內寬敞，內用位置涵蓋一和二樓，但是座位很多，雖有人潮但也不用等很久。",
    hours: "10:00 - 20:30 (週三公休)",
    address: "600 嘉義市西區中正路707號",
  ),
  RestaurantInfo(
    name: "阿明火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/aMing.jpg",
    description: "在地老字號，醬汁香濃，是許多在地人的私藏清單。",
    hours: "10:00 – 14:00, 17:00 – 20:30",
    address: "600 嘉義市西區中正路707號",
  ),
  RestaurantInfo(
    name: "頭家火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/boss.jpg",
    description: "價格實惠、份量十足，油蔥酥香氣非常有記憶點。",
    hours: "06:30 – 14:00",
    address: "600 嘉義市西區新民路747號",
  ),
  RestaurantInfo(
    name: "頂宣火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/dingXuan.jpg",
    description: "環境整潔，口味清爽不油膩，肉片厚實彈牙。",
    hours: "10:30 – 20:00",
    address: "600 嘉義市東區吳鳳南路150號",
  ),
  RestaurantInfo(
    name: "永芳火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/yongFang.jpg",
    description: "主打晚餐與宵夜時段，是嘉義夜晚尋味的好去處。",
    hours: "16:00 – 01:00",
    address: "600 嘉義市西區興業西路430號",
  ),
  RestaurantInfo(
    name: "阿福火雞肉飯",
    imagePath: "assets/image/turkeyRiceStore/aFu.jpg",
    description: "在地鄰里的小店，肉質軟嫩，醬汁鹹甜適中。",
    hours: "10:00 – 19:30",
    address: "600 嘉義市西區民生南路158號",
  ),
];
List<RestaurantInfo> restaurantFilterList = restaurantList;

// 搜尋文字控制器
final TextEditingController _searchController = TextEditingController();
int currentRestaurant = 0;
bool searchState = false;

// 2. 頁面零件 (StatefulWidget)
class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  void initState() {
    super.initState();
    // 初始狀態下，顯示全部餐廳
    restaurantFilterList = List.from(restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    final restaurant = restaurantList[currentRestaurant];

    var restaurantBody = Container(
      child: Stack(
        children: [
          // 1. 中間主要內容區塊
          Positioned(
            top: sh * 0.12, // 往下多留一點空間給 Header
            left: 0,
            right: 0,
            child: Container(
              width: sw,
              height: sh * 0.78,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // 圖片容器：加入圓角與柔和陰影
                  Container(
                    width: sw,
                    height: sh * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(
                        color: const Color(0xFF4B2E2B),
                        width: 4,
                      ),
                      image: DecorationImage(
                        image: AssetImage(restaurant.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 介紹文字：優化行高與間距
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SingleChildScrollView( // 防止文字過多時溢出
                        child: Text(
                          restaurant.description,
                          style: const TextStyle(
                            fontSize: 20,
                            height: 1.6, // 增加行高，閱讀更舒服
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B2E2B),
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 上面標題 & DropDown
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: sh * 0.1,
              padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF8C5A3C),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: Stack(
                children: [
                  // Dropdown
                  Positioned(
                    child: Container(
                      width: searchState ? sw * 0.95 : sw,
                      height: sh * 0.15,
                      alignment: Alignment.topRight,
                      child: searchState ? _buildSearchTextField() : _buildDropdown(),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: sw * 0.12,
                          child: IconButton(
                            icon: Icon(
                                searchState ? Icons.close_outlined : Icons.search_outlined,
                                color: Color(0xFF4B2E2B),
                                size: 35
                            ),
                            onPressed: () {
                              setState(() {
                                if (searchState) {
                                  _onSearch();
                                }
                                searchState = !searchState;
                              });
                            },
                          ),
                        )
                      ],
                    )
                  ),

                  // 左邊回首頁按鈕
                  Visibility(
                    visible: !searchState,
                    child: SizedBox(
                      width: sw * 0.12,
                      child: IconButton(
                        icon: const Icon(
                          Icons.home_outlined,
                          color: Color(0xFF4B2E2B),
                          size: 35,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // 3. 下方資訊卡片：改為底部懸浮卡片感
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF4B2E2B),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow(Icons.location_on_rounded, restaurant.address),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.access_time_filled_rounded, restaurant.hours),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: restaurantBody,
    );
  }

  void _onSearch() {
    setState(() {
      String query = _searchController.text.trim().toLowerCase();

      if (query.isEmpty) {
        // 如果沒輸入，還原成全部清單
        restaurantFilterList = List.from(restaurantList);
      } else {
        // 執行子字串比對 (Partial String Match)
        restaurantFilterList = restaurantList
            .where((res) => res.name.toLowerCase().contains(query))
            .toList();
      }

      // 重要：搜尋完後將 Dropdown 選項重設到第 0 個，避免 Index 越界
      currentRestaurant = 0;
    });
  }

  // 搜尋輸入框
  Widget _buildSearchTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 8),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: const InputDecoration(
          hintText: "搜尋店名...",
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
        onSubmitted: (value) {
          searchState = !searchState;
          _onSearch();
        }
      ),
    );
  }

  // 建立 Dropdown
  Widget _buildDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        // 將預設圖標大小設為 0
        icon: const SizedBox.shrink(),
        iconSize: 0,

        isExpanded: true,
        alignment: Alignment.center,
        // 這決定了「未展開」時看到的樣子 -> 中間顯示
        selectedItemBuilder: (BuildContext context) {
          return restaurantFilterList.map<Widget>((item) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                item.name, // 顯示目前選中的店名
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                  color: Color(0xFF4B2E2B),
                ),
              ),
            );
          }).toList();
        },

        value: currentRestaurant,
        items: List.generate(restaurantFilterList.length, (index) {
          return DropdownMenuItem<int>(
            value: index,
            alignment: Alignment.center,
            child: Text(
              restaurantFilterList[index].name,
              style: TextStyle(
                color: currentRestaurant == index
                    ? const Color(0xFF9E9E9E)
                    : const Color(0xFF4B2E2B),
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
        onChanged: (int? newValue) {
          if (newValue != null) {
            setState(() {
              currentRestaurant = newValue;
            });
          }
        },
      ),
    );
  }

  // 輔助函式：建立資訊列
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFC08552), size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFFF5EFE6),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}