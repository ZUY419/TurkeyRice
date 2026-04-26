import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
// 互動式照片
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_view/photo_view.dart';

import 'image_overview.dart';

// 1. 資料零件
class RestaurantInfo {
  final String name;
  final List<String> imagePath;
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

  @override
  String toString() {
    return 'RestaurantInfo(name: $name)';
  }
}

// 餐廳清單
List<RestaurantInfo> restaurantList = [];
List<RestaurantInfo> restaurantFilterList = restaurantList;
// 搜尋文字控制器
final TextEditingController _searchController = TextEditingController();
late PageController _pageController;
int currentRestaurant = 0;
bool searchState = false;
bool isLoading = true;
// 輪播照片編號
int imageNo = 0;

// 2. 頁面零件 (StatefulWidget)
class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _initRestaurantData();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // 記得在 Widget 銷毀時釋放控制器以節省記憶體
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    final restaurant = restaurantFilterList[currentRestaurant];

    var restaurantBody = Stack(
      children: [
        Container(
          width: sw,
          height: sh,
          decoration: BoxDecoration(
            color: const Color(0xFFF3E4C9)
          ),
        ),

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
                          color: const Color(0xCC000000),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(
                        color: const Color(0xFF4B2E2B),
                        width: 4,
                      ),
                    ),

                    child: Stack(
                      children: [
                        // 照片輪播
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: PhotoViewGallery.builder(
                            // 輪播照片數量
                            itemCount: restaurant.imagePath.length,
                            builder: (context, index) {
                              return PhotoViewGalleryPageOptions(
                                // 用 index 來決定現在顯示的照片
                                imageProvider: AssetImage(restaurant.imagePath[imageNo]),
                                // 讓照片自動填滿框框
                                initialScale: PhotoViewComputedScale.covered,
                              );
                            },
                            // 綁定控制器，這樣切換餐廳時我們才能控制它跳回第一張
                            pageController: _pageController,

                            onPageChanged: (index) {
                              setState(() {
                                imageNo = index; // 更新 index，這樣畫面的文字才會跟著變
                              });
                            },
                          ),
                        ),

                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: IconButton(
                            icon: const Icon(
                              Icons.image_outlined,
                              color: Color(0xFFA47251),
                              size: 35,
                            ),
                            onPressed: () {
                              // 實作頁面跳轉
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ImageOverviewPage(
                                  restaurantIndex: currentRestaurant,
                                  restaurantName: restaurantFilterList[currentRestaurant].name,
                                )
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
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

        // 2. 上面標題 & DropDown
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
                  color: Colors.black,
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
    );

    return Scaffold(
      body: restaurantBody,
    );
  }

  // 讀取資料的函式 (放在 State 裡面)
  Future<void> _initRestaurantData() async {
    try {
      final String content = await rootBundle.loadString("assets/restaurantInfomation.txt");
      List<String> lines = content.trim().split('\n');

      List<RestaurantInfo> temp = [];
      for (int i = 0; i < lines.length; i++) {
        var line = lines[i].split('|');
        if (line.length >= 4) {
          temp.add(RestaurantInfo(
            name: line[0].trim(),
            imagePath: [
              "assets/image/turkeyRiceStore/storeImage_1/store_${i + 1}.webp",
              "assets/image/turkeyRiceStore/storeImage_2/store_${i + 1}.webp",
              "assets/image/turkeyRiceStore/storeImage_3/store_${i + 1}.webp"
            ],
            description: line[1].trim(),
            hours: line[line.length - 2].trim(),
            address: line[line.length - 1].trim(),
          ));
        }
      }

      // 資料讀取完後，更新畫面
      if (mounted) {
        setState(() {
          restaurantList = temp;
          restaurantFilterList = List.from(temp);
          isLoading = false; // 關閉載入圖示
        });
      }
    } catch (e) {
      debugPrint("讀取錯誤: $e");
    }
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
      _pageController.jumpToPage(0);
      imageNo = 0;
    });
  }

  // 搜尋輸入框
  Widget _buildSearchTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 8, right: 5, left: 5),

      decoration: BoxDecoration(
        color: const Color(0x26000000),
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
          if (newValue != null && newValue != currentRestaurant) {
            setState(() {
              currentRestaurant = newValue;
              _pageController.jumpToPage(0);
              imageNo = 0;
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