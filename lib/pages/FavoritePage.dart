import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoris'),
      ),
      body: Center(
        child: isUserLoggedIn
            ? Text('Vos favoris apparaîtront ici.')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: RiveAnimation.asset(
                'assets/illustration.riv',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Veuillez vous connecter pour voir vos favoris.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
