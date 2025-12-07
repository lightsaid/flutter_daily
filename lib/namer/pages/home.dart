import 'package:flutter/material.dart';
import 'package:flutter_daily/namer/app.dart';
import 'package:flutter_daily/namer/pages/favorites.dart';
import 'package:flutter_daily/namer/pages/generator.dart';
import 'package:flutter_daily/namer/widget/big_card.dart';
import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 监听状态
//     var appState = context.watch<NamerAppState>();
//     var pair = appState.current;

//     IconData icon;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//     } else {
//       icon = Icons.favorite_border;
//     }

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           // 添加这个无法将一整块居中，因为 Column 本身并不在 Scaffold 的中心位置；
//           // Column 不会占据应用的整个宽度，而是仅占据其子项所需的水平空间。
//           // crossAxisAlignment: CrossAxisAlignment.center, 这里解决方法使用 Center 包裹
//           children: [
//             const Text("A random idea: "),
//             // Text(appState.current.asLowerCase),
//             // Text(pair.asLowerCase), // 不用引用整个appState
//             BigCard(pair: pair),
//             const SizedBox(height: 10),
//             Row(
//               // 尽量少空间，让下面button居中
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     appState.toggleFavorite();
//                   },
//                   icon: Icon(icon),
//                   label: const Text("Like"),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     appState.getNext();
//                   },
//                   child: const Text("Next"),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // NOTE:
    // 其实可以把MaterialApp组件比如一个SPA的main.ts入口；
    // Scaffold 则是一个html页面，其中body就是主体

    // NOTE: 使用 LayoutBuilder 获取屏幕的大小
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        // 左右两栏布局
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600, // 屏幕大于600显示 label
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text("Favorites"),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            )
          ],
        ),
      );
    });
  }
}
