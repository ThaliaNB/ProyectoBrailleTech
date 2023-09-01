import 'dart:io';

class PreviewDocumentArguments {
  final String title;
  final File fileResponse;
  final bool isCircle;

  PreviewDocumentArguments({
    required this.fileResponse,
    required this.title,
    required this.isCircle,
  });
}
