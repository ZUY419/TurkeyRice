import 'dart:ffi';
import 'dart:ui';

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
    imagePath: "assets/image/easy.jpg",
    description: "這是一間只需要點一碗大碗雞肉飯跟一碗湯就可以吃飽的地方，並且他們有賣鴨蛋，味道與雞蛋有很大的不同，連不吃蛋黃的人都說好吃！",
    hours: "08:30 – 20:00",
    address: "600 嘉義市東區大雅路二段581號",
  ),
  RestaurantInfo(
    name: "阿宏師火雞肉飯",
    imagePath: "assets/image/ahon.jpg",
    description: "嘉義市區超人氣名店，火雞肉片飯口感扎實且淋上香噴噴的油蔥酥，是許多遊客來嘉義必排隊的首選。",
    hours: "10:30 – 20:00",
    address: "600 嘉義市東區光華路108號",
  ),
  RestaurantInfo(
    name: "阿樓師火雞肉飯",
    imagePath: "assets/image/arosi.jpg",
    description: "嘉義人的宵夜首選！肉質多汁且鹹香夠味，晚上才營業的特性讓它成為嘉義夜晚最熱鬧的角落之一。",
    hours: "16:00 – 00:00",
    address: "600 嘉義市東區吳鳳北路102號",
  ),
  RestaurantInfo(
    name: "圓環火雞大王",
    imagePath: "assets/image/circle.jpg",
    description: "位於圓環附近的經典老店，紅漆招牌非常醒目，火雞肉與醬汁搭配得恰到好處，味道十分傳統。",
    hours: "10:00 – 20:00",
    address: "600 嘉義市東區文化路135號",
  ),
  RestaurantInfo(
    name: "大同火雞肉飯",
    imagePath: "assets/image/daton.jpg",
    description: "在地經營多年的老店，除了火雞肉飯，各式小菜也是亮點，是許多嘉義學生與家庭日常用餐的好去處。",
    hours: "09:00 – 20:00",
    address: "600 嘉義市東區民族路196號",
  ),
  RestaurantInfo(
    name: "夯仔內火雞肉飯",
    imagePath: "assets/image/hon.jpg",
    description: "隱身於巷弄中的神級美味，如其名「夯仔內」，外皮酥香的火雞肉片令人驚艷，是饕客才懂得找的店。",
    hours: "10:00 – 14:00",
    address: "600 嘉義市東區安和街27號",
  ),
  RestaurantInfo(
    name: "民主聖地火雞肉飯",
    imagePath: "assets/image/minzu.jpg",
    description: "招牌標榜著獨特的油蔥風味，醬汁偏甜且濃厚，是喜歡重口味火雞肉飯朋友的最佳選擇。",
    hours: "10:00 – 20:40",
    address: "600 嘉義市東區民族路149號",
  ),
  RestaurantInfo(
    name: "和平火雞肉飯",
    imagePath: "assets/image/peace.jpg",
    description: "這家店的肉質切得較碎但非常有味，價格平實，是嘉義在地非常受歡迎的平民小吃代表。",
    hours: "07:30 – 17:00",
    address: "600 嘉義市東區和平路107號",
  ),
  RestaurantInfo(
    name: "南門火雞肉飯",
    imagePath: "assets/image/natao.jpg",
    description: "位於南門圓環附近，老牌的口味傳承，火雞肉處理得非常細膩，是許多嘉義人心中的經典老味道。",
    hours: "07:30 – 15:00",
    address: "600 嘉義市東區安和街2號",
  ),
  RestaurantInfo(
    name: "噴水火雞肉飯(小雅店)",
    imagePath: "assets/image/water.jpg",
    description: "噴水雞肉飯的現代化分店，環境寬敞舒適且有設計感，適合帶外地朋友來體驗高品質的用餐環境。",
    hours: "11:00 – 21:00",
    address: "600 嘉義市東區小雅路382號",
  ),
];

int currentRestaurant = 0;

// 2. 頁面零件 (StatefulWidget)
class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

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
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF8C5A3C),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: Stack(
                children: [
                  // 中間選單顯示
                  Positioned(
                      child: Container(
                        alignment: Alignment.center,
                        width: sw,
                        height: sh * 0.1,
                        child: Text(
                          restaurantList[currentRestaurant].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            color: const Color(0xFF4B2E2B),
                          ),
                        ),
                      )
                  ),

                  // Dropdown
                  Positioned(
                    child: Container(
                      width: sw,
                      height: sh * 0.1, // 建議保留高度設定，避免元件擠壓
                      alignment: Alignment.topRight,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>( // 1. 指定泛型為 int，增加程式碼嚴謹度
                          isExpanded: true,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0), // 這裡設定圖示左側間距
                            child: Icon(
                              Icons.store_outlined,
                              size: 35,
                              color: const Color(0xFF4B2E2B),
                            ),
                          ),
                          alignment: Alignment.center,
                          // 3. 修正 items 的生成方式，必須包含 value
                          items: List.generate(restaurantList.length, (index) {
                            return DropdownMenuItem<int>(
                              value: index, // 每個選項代表的數值（與 onChanged 串聯）
                              alignment: Alignment.center,
                              child: Text(
                                restaurantList[index].name,
                                style: TextStyle(
                                  color: currentRestaurant == index
                                      ? const Color(0xFF9E9E9E) // 選中時的顏色
                                      : const Color(0xFF4B2E2B), // 未選中時的顏色
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }),
                          onChanged: (int? newValue) {
                            // 4. 當選中新值且不為 null 時更新狀態
                            if (newValue != null && newValue != currentRestaurant) {
                              setState(() {
                                currentRestaurant = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  // 左邊回首頁按鈕
                  Container(
                    width: sw * 0.1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.home_outlined,
                        color: const Color(0xFF4B2E2B),
                        size: 35,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
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