# singleton_logger

싱글톤 패턴으로 만들어진 로거입니다.

로거는 state가 변경될때마다 instantiate할것처럼 로직이 만들어져있지만
싱글톤 패턴으로 만들어져있어서 인스턴스가 매번 만들어지지 않습니다.
Warehouse에서 인스턴스를 꺼내쓰는 형태입니다.

따라서 앱의 다양한 곳에서 로거를 사용하게된다 하더라도 매번 같은 인스턴스를 이용해서 로깅을 할 수 있게 컨트롤 가능합니다.
