import 'package:flutter/material.dart';

class TabBarApp02 extends StatefulWidget {
  const TabBarApp02({super.key});

  @override
  State<TabBarApp02> createState() => _State();
}

class _State extends State<TabBarApp02> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "TabBar 例子",
      home: TabBarScreen(),
    );
  }
}

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBarScreenState();
  }
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // 创建一个TabController来管理TabBar和TabBarView
    // 这里 length、vsync是必传参数，vsync 类型是 TickerProvider
    // 在上一个例子使用的DefaultTabController
    // 在这里把DefaultTabController去掉了，混入 SingleTickerProviderStateMixin
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      // 切换时，刷新一下，不然顶部title不更新
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 销毁
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar02-${controller.index + 1}"),
        centerTitle: true,

        // TabBar需要使用Tab配合TabController一起使用
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Tab 1', icon: Icon(Icons.home)),
            Tab(text: 'Tab 2', icon: Icon(Icons.star)),
            Tab(text: 'Tab 3', icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Center(
            child: Text("Tab1 Content"),
          ),
          Center(
            child: Text("Tab2 Content"),
          ),
          Center(
            child: Text("Tab3 Content"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text(
          "切换到第二个",
          style: TextStyle(fontSize: 10),
        ),
        onPressed: () {
          controller.animateTo(1);
        },
      ),
    );
  }
}
