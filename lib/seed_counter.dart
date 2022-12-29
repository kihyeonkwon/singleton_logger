class SeedCounter {
  static SeedCounter? _instance;
  late int count;

  SeedCounter._internal(int seed) {
    _instance = this;
    count = seed;
  }

  factory SeedCounter(int seed) => _instance ?? SeedCounter._internal(seed);
}
