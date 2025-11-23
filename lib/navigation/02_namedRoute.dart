import 'package:flutter/material.dart';

/// 命令路由
///  - 声明路由
///    * routes路由表（Map类型）
///    * initialRoute (初始路由)
///    * onUnknownRoute (未知路由-404)
///
///  - 跳转到命令路由
///    * Navigatorr.pushNamed(context, "路由名称")
///
///  - 代码例子
///  MaterialApp(
///     routes: {
///       'first': (context) => FirstPage(),
///       'second': (context) => SecondPage(),
///     },
///     initialRoute: 'first',
///     onUnknownRote: (RouteSettings setting) => MaterialPageRoute(
///       builder: (context) => UnknownPage()
///     )
///  )
///
///

/**
 命令路由传参数
  - 路由中声明参数
    Navigator.pushNamed(context, routename, {argments})

  - 组件接受参数
    ModalRoute.of(context).settings.arguments

代码例子：
  - 传参
    Navigator.pushNamed(context, "/product", argments:{"id": "999"});

  - 取参
    final Map argumnets = ModalRoute.of(context).settings.argumnets;
    String id = argumnets['id'];
 */

class NamedRouteApp extends StatelessWidget {
  const NamedRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "命名路由 Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // NOTE: 命名路由，这里就不用写了
      // home: const HomeScreen(),

      // 默认加载路由
      initialRoute: "/home",

      // 声明路由
      routes: {
        "/home": (context) => const HomeScreen(),
        "/product": (context) => const ProductScreen(),
      },

      // 未知路由404
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // NOTE: 这里不一样，指定跳转路由
                Navigator.pushNamed(context, "/product",
                    arguments: {"id": "9527"});
              },
              child: const Text("跳转到商品页"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // profile 不存在
                Navigator.pushNamed(context, "/profile");
              },
              child: const Text("跳转到未知页"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)?.settings.arguments ?? {};
    String id = args['id'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 不显示默认的左边箭头
        title: const Text("商品页"),
      ),
      body: Column(
        children: [
          Text("商品id: $id"),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("返回")),
          ),
        ],
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 不显示默认的左边箭头
        title: const Text("404"),
      ),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Center(child: Text("页面不存在")),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("返回"),
            ),
            const SizedBox(height: 300)
          ],
        ),
      ),
    );
  }
}
