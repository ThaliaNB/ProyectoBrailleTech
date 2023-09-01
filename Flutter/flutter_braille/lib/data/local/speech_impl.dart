

// class SpeechImpl extends SpeechRepository {
//    static final _speech = SpeechToText();
   
//   @override
//   DataResult<bool> toggleRecording({required Function(String text) onResult}) {
//     try {
//       if (_speech.isListening) {
//       _speech.stop();
//       return true;
//     }

//     final isAvailable = await _speech.initialize(
//       onStatus: (status) => onListening(_speech.isListening),
//       onError: (e) => print('Error: $e'),
//     );

//     if (isAvailable) {
//       _speech.listen(onResult: (value) => onResult(value.recognizedWords));
//     }
//     } catch (e) {
//       return DataResult.exception(JetzException.fromException(e, StackTrace.current));
//     }
//   }
// }
