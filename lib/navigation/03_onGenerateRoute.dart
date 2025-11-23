import 'package:flutter/material.dart';

/// 动态路由，直接查看

class GenerateRouteApp extends StatelessWidget {
  const GenerateRouteApp({super.key});

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

      // // 声明路由
      // routes: {
      //   "/home": (context) => const HomeScreen(),
      //   "/product": (context) => const ProductScreen(),
      // },

      // // 未知路由404
      // onUnknownRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      // },

      // 默认加载路由
      // initialRoute: "/home",

      // 动态路由和命令路由是二选一的，因此上面命名路由注释
      onGenerateRoute: (RouteSettings settings) {

        debugPrint('settings.name: ${settings.name}');

        // '/' 就是 initialRoute 默认加载路由
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }

        // 解析路由
        var uri = Uri.parse(settings.name ?? '');

        debugPrint('解析后的路径: $uri');
        if(uri.pathSegments.length == 1 && uri.pathSegments.first == "product") {
          return MaterialPageRoute(builder: (context) => const ProductScreen());
        }

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'product') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(id: id),
          );
        }

        // onUnknownRoute（404）
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
                Navigator.pushNamed(context, "/product");
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 不显示默认的左边箭头
        title: const Text("商品页"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/product/9527");
              },
              child: const Text("商品1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/product/8888");
              },
              child: const Text("商品2"),
            ),
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

class ProductDetailScreen extends StatelessWidget {
  final String id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 不显示默认的左边箭头
        title: const Text("商品详情"),
      ),
      body: Column(
        children: [
          Text("当前商品id: $id"),
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
