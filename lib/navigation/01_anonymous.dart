import 'package:flutter/material.dart';

/// Route 一个路由是一个屏幕或页面的抽象
/// Navigator
///  - 管理路由的组件，Navigator 可以通过入栈和出栈来实现页面之间的跳转
///  - 常用属性
///    * initialRoute: 初始化路由，即默认路由
///    * onGenerateRoute: 动态路由（根据规则，匹配动态路由）
///    * onUnknowRoute: 未知路由，也就是404
///    * routes: 路由集合
///

/// Navigator
///  * push(跳转到指定组件)
///  * Navigator.push(
///     context,
///     MaterialPageRoute(builder:(context) => 组件名称())
///    );
///
///  * pop(回退)
///  * Navigator.pop(context)

/// 匿名路由传参方式，就是实例化的方式
/// Navigator.push(
///    context,
///    MaterialPageRoute(
///      builder: (context) => const ProductScreen(id: "9999"),
///    ),
///  );

class AnonymousApp extends StatelessWidget {
  const AnonymousApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "匿名路由 Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
        elevation: 0.0, // 阴影大小
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductScreen(id: "999"),
                ),
              );
            },
            child: const Text("跳转到商品页")),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final String id;
  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 不显示默认的左边箭头
        title: const Text("商品页"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("商品Id: $id"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("返回")),
          ],
        ),
      ),
    );
  }
}
