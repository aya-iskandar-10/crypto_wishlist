import 'package:flutter/material.dart';
import 'package:whishlist/controller/app_controllers.dart';
import 'package:whishlist/view/crypto_tile.dart';

class CryptoListView extends ConsumerWidget {
  const CryptoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptoProvider);
    final wishlist = ref.watch(wishlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto List'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${wishlist.count}'),
              child: const Icon(Icons.star),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/WishlistView');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cryptos.cryptos.length,
        itemBuilder: (context, index) {
          return CryptoTile(crypto: cryptos.cryptos[index]);
        },
      ),
    );
  }
}
