import 'package:flutter/material.dart';

class TabBarApp extends StatefulWidget {
  const TabBarApp({super.key});

  @override
  State<TabBarApp> createState() => _State();
}

class _State extends State<TabBarApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "TabBar 例子",
      home: TabBarScreen(),
    );
  }
}

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE: 必须使用 DefaultTabController 包裹
    // TabBar 数量和 TabBarView 数量要保持一致
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar"),
          centerTitle: true,

          // TabBar需要使用Tab配合TabController一起使用
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1', icon: Icon(Icons.home)),
              Tab(text: 'Tab 2', icon: Icon(Icons.star)),
              Tab(text: 'Tab 3', icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
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
      ),
    );
  }
}
