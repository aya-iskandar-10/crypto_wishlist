import 'package:flutter/material.dart';
import 'package:whishlist/model/crypto.dart';

class ControllerCrypto extends ChangeNotifier {
  final List<Crypto> cryptos = const [
    Crypto(rank: 1, name: 'Bitcoin', symbol: 'BTC', price: 83644.00, change24h: -0.09),
    Crypto(rank: 2, name: 'Ethereum', symbol: 'ETH', price: 2510.84, change24h: -0.63),
    Crypto(rank: 3, name: 'Tether', symbol: 'USDT', price: 1.00, change24h: 0.00),
    Crypto(rank: 4, name: 'BNB', symbol: 'BNB', price: 742.55, change24h: -0.19),
    Crypto(rank: 5, name: 'XRP', symbol: 'XRP', price: 1.37, change24h: -0.11),
    Crypto(rank: 6, name: 'USDC', symbol: 'USDC', price: 1.00, change24h: 0.00),
    Crypto(rank: 7, name: 'Solana', symbol: 'SOL', price: 107.45, change24h: -0.68),
    Crypto(rank: 8, name: 'TRON', symbol: 'TRX', price: 0.33, change24h: 0.91),
    Crypto(rank: 9, name: 'Figure Heloc', symbol: 'FIGR_HELOC', price: 1.03, change24h: 0.00),
    Crypto(rank: 10, name: 'Zcash', symbol: 'ZEC', price: 1249.39, change24h: 1.91),
    Crypto(rank: 11, name: 'Hyperliquid', symbol: 'HYPE', price: 81.64, change24h: -1.75),
    Crypto(rank: 12, name: 'Dogecoin', symbol: 'DOGE', price: 0.08, change24h: 0.01),
  ];
}
