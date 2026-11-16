// lib/model/crypto.dart
//
// MODEL (the "M" in MVC): only data and small helpers.
// It knows nothing about screens or Riverpod.

class Crypto {
  // ---------------------------------------------------------------
  // 1. CONSTRUCTOR
  // `const`    -> lets us write `const Crypto(...)` inside const lists.
  // `required` -> the caller must give the value, so we can't forget it.
  // `change24h` is NOT required: it is nullable (double?) because
  //  some coins (like FIGR_HELOC) have no 24h change.
  // ---------------------------------------------------------------
  const Crypto({
    required this.rank,
    required this.name,
    required this.symbol,
    required this.price,
    this.change24h,
  });

  // `final` fields: they never change after the object is created
  // (immutable). A const constructor requires this.
  final int rank;
  final String name;
  final String symbol; // used as the unique id of the coin (BTC, ETH...)
  final double price;
  final double? change24h; // the `?` means it can be null

  // ---------------------------------------------------------------
  // 2. COMPUTED GETTERS
  // Small logic that lives in the model, so widgets stay clean.
  // Usage in a widget:  crypto.isUp  /  crypto.priceLabel
  // ---------------------------------------------------------------

  // true when the price went up (or didn't change) in 24h.
  // `?? 0` -> if change24h is null, treat it as 0.
  bool get isUp => (change24h ?? 0) >= 0;

  // Ready-to-show text, e.g. "$2510.84".
  // `\$` prints a real dollar sign.
  String get priceLabel => '\$${price.toStringAsFixed(2)}';

  // ---------------------------------------------------------------
  // 3. fromJson  (Map -> Crypto)
  // Use it when data comes from an API / database / local storage.
  // `factory` = a constructor that builds and returns a Crypto.
  // Usage:  Crypto.fromJson(map)
  //
  // Every value in the map is `dynamic`, so we tell Dart its type
  // with `as`:
  //   as String   -> the value is text
  //   as num?     -> a number that may be missing (null)
  //   num -> double: JSON may send 18 (int) or 18.0 (double),
  //   so we read it as `num` and call .toDouble() (safe for both).
  // `?? 0`  -> default value when the key is missing.
  // ---------------------------------------------------------------
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      rank: (json['market_cap_rank'] as num?)?.toInt() ?? 0,
      name: json['name'] as String,
      symbol: (json['symbol'] as String).toUpperCase(),
      price: (json['current_price'] as num?)?.toDouble() ?? 0,
      change24h: (json['price_change_percentage_24h'] as num?)?.toDouble(),
    );
  }

  // ---------------------------------------------------------------
  // 4. toJson  (Crypto -> Map)
  // The reverse of fromJson. Use it to save or send the object
  // (local cache, Firestore, POST request...).
  // Usage:  crypto.toJson()
  // ---------------------------------------------------------------
  Map<String, dynamic> toJson() {
    return {
      'market_cap_rank': rank,
      'name': name,
      'symbol': symbol,
      'current_price': price,
      'price_change_percentage_24h': change24h,
    };
  }

  // ---------------------------------------------------------------
  // 5. copyWith
  // Fields are final, so we can't edit them. copyWith returns a NEW
  // Crypto, copying everything and replacing only what you pass.
  // `price ?? this.price` -> use the new price if given, else keep old.
  // Usage:  final updated = crypto.copyWith(price: 90000);
  // ---------------------------------------------------------------
  Crypto copyWith({
    int? rank,
    String? name,
    String? symbol,
    double? price,
    double? change24h,
  }) {
    return Crypto(
      rank: rank ?? this.rank,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      change24h: change24h ?? this.change24h,
    );
  }

  // ---------------------------------------------------------------
  // 6. == and hashCode  (value equality)
  // By default two objects are equal only if they are the SAME object.
  // With these, two Cryptos with the same values are equal.
  // Needed for: Set.contains(), List.contains(), tests, and
  // Riverpod's .select (it skips rebuilds when values are equal).
  // Rule: if you override ==, also override hashCode.
  // ---------------------------------------------------------------
  @override
  bool operator ==(Object other) {
    return identical(this, other) || // same object -> equal
        other is Crypto &&
            other.rank == rank &&
            other.name == name &&
            other.symbol == symbol &&
            other.price == price &&
            other.change24h == change24h;
  }

  @override
  int get hashCode => Object.hash(rank, name, symbol, price, change24h);

  // ---------------------------------------------------------------
  // 7. toString
  // Readable text when you print the object.
  // Usage:  print(crypto);  ->  Crypto(BTC, 83644.0, -0.09)
  // ---------------------------------------------------------------
  @override
  String toString() => 'Crypto($symbol, $price, $change24h)';
}
