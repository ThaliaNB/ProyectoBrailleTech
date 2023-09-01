import 'package:flutter/cupertino.dart';
import 'package:flutter_braille/domain/models/data_result.dart';
import 'package:flutter_braille/domain/usecases/braille_usecases.dart';

class WriteViewModel with ChangeNotifier {
  final BrailleUseCases _brailleUseCases;
  WriteViewModel(this._brailleUseCases);

  late bool _changeScreen;
  late DataResult<String> _brailleResult;

  bool get changeScreen => _changeScreen;
  DataResult<String> get brailleResult => _brailleResult;
  void init() async {
    _brailleResult = DataResult.initial();
  }

  Future<DataResult<String>> traduceText(String text) async {
    final result = await _brailleUseCases.traduceText(text: text);
    _brailleResult = result;
    notifyListeners();
    return result;
  }
}
