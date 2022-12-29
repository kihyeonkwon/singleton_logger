abstract class BaseCounter {
  int count = 0;
  int nextCount() => count++;
}

class LazyCounter extends BaseCounter {
  static LazyCounter? _instance;

  LazyCounter._internal() {
    _instance = this;
  }

  factory LazyCounter() => _instance ?? LazyCounter._internal();
}

class EagerCounter extends BaseCounter {
  static EagerCounter _instance = EagerCounter._internal();

  EagerCounter._internal() {
    _instance = this;
  }

  factory EagerCounter() => _instance;
}

class SeedCounter extends BaseCounter {
  static SeedCounter? _instance;

  SeedCounter._internal(int seed) {
    _instance = this;
    count = seed;
  }

  factory SeedCounter(int seed) => _instance ?? SeedCounter._internal(seed);
}
