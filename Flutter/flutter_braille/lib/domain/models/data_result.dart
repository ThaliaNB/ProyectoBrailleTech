import 'package:flutter_braille/domain/models/jetz_exception.dart';

class DataResult<T> {
  ResultState state;
  T? data;
  JetzException? exception;

  DataResult._({
    required this.state,
    this.data,
    this.exception,
  });

  factory DataResult.initial() => DataResult._(state: ResultState.initial);

  factory DataResult.loading() => DataResult._(state: ResultState.loading);

  factory DataResult.success(T data) => DataResult._(
        state: ResultState.success,
        data: data,
      );

  factory DataResult.exception(JetzException exception) => DataResult._(
        state: ResultState.exception,
        exception: exception,
      );
}

enum ResultState { initial, loading, success, exception }
