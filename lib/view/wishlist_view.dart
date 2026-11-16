import 'package:flutter/material.dart';
import 'package:whishlist/controller/app_controllers.dart';
import 'package:whishlist/view/crypto_tile.dart';

class WishlistView extends ConsumerWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptoProvider).cryptos;
    final wishlist = ref.watch(wishlistProvider);

    // keep only the coins that are in the wishlist
    final favorites =  cryptos.where((c) => wishlist.isFavorite(c.symbol)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return CryptoTile(crypto: favorites[index]);
        },
      ),
    );
  }
}
