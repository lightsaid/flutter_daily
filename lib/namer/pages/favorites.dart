import 'package:flutter/material.dart';
import 'package:flutter_daily/namer/app.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NamerAppState>();
    var favorites = appState.favorites;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          Text("You have ${favorites.length} favorites:"),
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                debugPrint('index: $index');
                return Wrap(
                  children: [
                    const Icon(Icons.delete),
                    Text('${favorites[index]}')
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
