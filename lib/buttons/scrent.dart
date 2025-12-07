import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color blue = hexToColor('#3770EB');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("添加"),
                  style: ElevatedButton.styleFrom(
                    // 背景色
                    backgroundColor: Colors.white,
                    // icon label 颜色
                    foregroundColor: hexToColor('#3770EB'),
                    // 阴影
                    elevation: 0,
                    // 边框
                    side: BorderSide(color: hexToColor('#3770EB'), width: 1),
                    // 边框
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 4),
                backgroundColor: Colors.white,
                side: BorderSide(color: blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 18, color: blue),
                  SizedBox(width: 2), // ← 这里自定义你想要的间距
                  Text("添加", style: TextStyle(color: blue, fontSize: 12)),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(4, 4, 8, 4),
                minimumSize: Size.zero, // 默认为0，交由padding控制
                backgroundColor: Colors.white, // 背景色
                side: BorderSide(color: blue), // 边框颜色
                shape: RoundedRectangleBorder(
                  // 圆角
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 16, color: blue),
                  SizedBox(width: 2), // 自定义 icon 和 label 边距
                  Text("添加", style: TextStyle(color: blue, fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
