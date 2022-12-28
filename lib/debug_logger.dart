import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

abstract class BaseLogger {
  //Protected are inaccessible outside the class but they can be accessed by any subclass(derived class) of that class.
  @protected
  late Logger _logger;

  @protected
  DateFormat _dateFormatter = DateFormat('H:m:s.S');

  static const appName = 'singleton_pattern_example';

  void log(message, [Object? error, StackTrace? stackTrace])=> _logger.info(message, error, stackTrace)
}


class DebugLogger extends BaseLogger{
  static DebugLogger? _instance;


  //내부에서만 사용할 constructor. _뒤에는 뭐가오든 상관없다.
  DebugLogger._internal(){
    Logger.root.level=Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);
    _logger = Logger(BaseLogger.appName);
    debugPrint('<DebugLogger> creation');
    _instance = this;
  }


  factory DebugLogger()=> _instance ?? DebugLogger._internal();


  void _recordHandler(LogRecord rec){
    debugPrint(
      '${_dateFormatter.format(rec.time)} : ${rec.message}, ${rec.error}');
  }


}