import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily/namer/pages/home.dart';
import 'package:provider/provider.dart';

class NamerApp extends StatelessWidget {
  const NamerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 提供状态
    return ChangeNotifierProvider(
      // 状态来源NamerAppState
      create: (context) => NamerAppState(),
      child: MaterialApp(
        title: "Namer App",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const HomePage(),
      ),
    );
  }
}

// 定义应用状态
class NamerAppState extends ChangeNotifier {
  // 随机生成一个字符
  var current = WordPair.random();

  var favorites = <WordPair>[];

  void getNext() {
    // 修改值
    current = WordPair.random();
    // 通知监听着
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
