import 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whishlist/controller/controller_crypto.dart';
import 'package:whishlist/controller/controller_wishlist.dart';

final ProviderContainer appContainer = ProviderContainer();

final cryptoProvider =
    ChangeNotifierProvider<ControllerCrypto>((ref) => ControllerCrypto());

final wishlistProvider =
    ChangeNotifierProvider<ControllerWishlist>((ref) => ControllerWishlist());
