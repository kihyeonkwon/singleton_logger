abstract class BaseCounter {
  late int count;
  int nextcount() => count++;
}

class LazyCounter extends BaseCounter {
  static LazyCounter? _instance;

  LazyCounter._internal() {
    _instance = this;
    count = 0;
  }

  factory LazyCounter() => _instance ?? LazyCounter._internal();
}

class EagerCounter extends BaseCounter {
  static EagerCounter _instance = EagerCounter._internal();

  EagerCounter._internal() {
    _instance = this;
    count = 0;
  }

  factory EagerCounter() => _instance;
}
