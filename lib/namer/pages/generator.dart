import 'package:flutter/material.dart';
import 'package:flutter_daily/namer/app.dart';
import 'package:flutter_daily/namer/widget/big_card.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NamerAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Column(
      children: [
        const Text("A random idea: "),
        BigCard(pair: pair),
        const SizedBox(height: 10),
        Row(
          // 尽量少空间，让下面button居中
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                appState.toggleFavorite();
              },
              icon: Icon(icon),
              label: const Text("Like"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: const Text("Next"),
            ),
          ],
        )
      ],
    );
  }
}
