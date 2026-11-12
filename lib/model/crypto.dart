class Crypto {
  final int rank;
  final String name;
  final String symbol; // used as the id of the coin
  final double price;
  final double change24h;

  const Crypto({
    required this.rank,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change24h,
  });
}
