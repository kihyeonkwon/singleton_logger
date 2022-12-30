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

class SeedCounter2 extends BaseCounter {
  static SeedCounter2? _instance;

  SeedCounter2._internal() {
    _instance = this;
  }

  void initialize(int value) {
    // 이니셜라이즈하는 부분과 호출 부분을 나누면 어플이 시작할때 초기 설정값들을 입력하고
    // 사용할때 (ex:api)는 초기값으로 생긴 싱글톤 인스턴스를 가지고 작동을 할 수 있다.
    count = value;
  }

  factory SeedCounter2() => _instance ?? SeedCounter2._internal();
}
