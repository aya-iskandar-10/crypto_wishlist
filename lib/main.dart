import 'package:flutter/material.dart';
import 'package:whishlist/controller/app_controllers.dart';
import 'package:whishlist/view/crypto_list_view.dart';
import 'package:whishlist/view/wishlist_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // UncontrolledProviderScope gives the whole app access to appContainer.
    return UncontrolledProviderScope(
      container: appContainer,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/CryptoListView',
        routes: {
          '/CryptoListView': (context) => const CryptoListView(),
          '/WishlistView': (context) => const WishlistView(),
        },
      ),
    );
  }
}
