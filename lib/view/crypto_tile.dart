import 'package:flutter/material.dart';
import 'package:whishlist/controller/app_controllers.dart';
import 'package:whishlist/model/crypto.dart';

// One row of the list, used by both screens.
class CryptoTile extends ConsumerWidget {
  final Crypto crypto;
  const CryptoTile({super.key, required this.crypto});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch: rebuild this row when the wishlist changes
    final wishlist = ref.watch(wishlistProvider);
    final isFavorite = wishlist.isFavorite(crypto.symbol);

    return ListTile(
      leading: CircleAvatar(child: Text(crypto.symbol[0])),
      title: Text('${crypto.rank}. ${crypto.name}'),
      subtitle: Text('${crypto.symbol} · ${crypto.change24h}% 24h'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('\$${crypto.price}'),
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              // read: do an action on the controller
              appContainer.read(wishlistProvider).toggle(crypto.symbol);
            },
          ),
        ],
      ),
    );
  }
}
