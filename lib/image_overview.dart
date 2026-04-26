import 'package:flutter/material.dart';

List<String> restaurantImage = [];
bool isLoading = true;

class ImageOverviewPage extends StatefulWidget {
  final int restaurantIndex;
  final String restaurantName;
  const ImageOverviewPage({super.key, required this.restaurantIndex, required this.restaurantName});

  @override
  State<ImageOverviewPage> createState() => _ImageOverviewPageState();
}

class _ImageOverviewPageState extends State<ImageOverviewPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _getImagePath();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;

    var imageOverviewBody = Stack(
      children: [
        // 照片展示
        Positioned.fill(
          top: sh * 0.11,
          bottom: sh * 0.01,
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,          // 每行顯示兩張圖
              mainAxisSpacing: 16,        // 稍微增加垂直間距，讓陰影更明顯
              crossAxisSpacing: 16,       // 稍微增加水平間距
              childAspectRatio: 1.0,      // 寬高比 1:1，確保是正方形
            ),
            itemCount: restaurantImage.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white, // 必須設定背景色，陰影才會有依據
                  borderRadius: BorderRadius.circular(12), // 圓角要跟 ClipRRect 一致
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black, // 陰影顏色與透明度
                      spreadRadius: 1,  // 陰影擴散範圍
                      blurRadius: 6,    // 陰影模糊程度（越小越銳利）
                      offset: const Offset(0, 3), // 陰影位移 (x, y)，這裡往下位移 3
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // 讓圖片有圓角更美觀
                  child: Image.asset(
                    restaurantImage[index],
                    fit: BoxFit.cover, // 重要：這能防止圖片被不自然拉伸
                  ),
                ),
              );
            },
          ),
        ),

        // 上方導覽
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
            child: Row(
              children: [
                // 左邊回首頁按鈕
                SizedBox(
                  width: sw * 0.12,
                  child: IconButton(
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Color(0xFF4B2E2B),
                      size: 35,
                    ),
                    onPressed: () => {
                      Navigator.pop(context),
                      Navigator.pop(context)
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  width: sw * 0.7,
                  child: Text(
                    widget.restaurantName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: Color(0xFF4B2E2B),
                    ),
                  ),
                ),

                // 返回到餐廳資訊頁面
                SizedBox(
                  width: sw * 0.12,
                  child: IconButton(
                    icon: const Icon(
                      Icons.store_outlined,
                      color: Color(0xFF4B2E2B),
                      size: 35,
                    ),
                    onPressed: () => {
                      Navigator.pop(context)
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF3E4C9),
      body: imageOverviewBody,
    );
  }

  Future<void> _getImagePath() async {
    List<String> temp = [];
    for (int j = 1;j <= 3;j++) {
      temp.add(
        'assets/image/turkeyRiceStore/storeImage_$j/store_${widget.restaurantIndex + 1}.webp'
      );
    }

    if (mounted) {
      setState(() {
        restaurantImage = temp;
        isLoading = false; // 關閉載入圖示
      });
    }
  }
}