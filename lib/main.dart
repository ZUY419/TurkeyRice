import 'package:flutter/material.dart';
import 'dart:ui';

import 'Restaurant.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 拆分出一個新的 Widget 確保 MediaQuery 正常
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 現在這裡可以安全使用 MediaQuery 了
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;

    var appBody = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/turkeyRice.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 模糊層
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Center( // 負責水平與垂直置中
            child: Column(
              mainAxisSize: MainAxisSize.min, // 關鍵：讓 Column 只佔用內容所需的高度，而不是撐滿全螢幕
              mainAxisAlignment: MainAxisAlignment.center, // 確保內容在 Column 內部也置中
              children: [
                const Text(
                  "雞肉飯美食之旅",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                const SizedBox(height: 30), // 增加文字與按鈕之間的間距
                ElevatedButton(
                  onPressed: () {
                    // 實作頁面跳轉
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RestaurantPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xCFC08552),
                    foregroundColor: const Color(0xFF4B2E2B),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  ),
                  child: const Text("Start", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: appBody,
    );
  }
}