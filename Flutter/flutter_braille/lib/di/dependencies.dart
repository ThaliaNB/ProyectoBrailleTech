import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_braille/data/local/image_remote_impl.dart';
import 'package:flutter_braille/data/remote/braille_remote_impl.dart';
import 'package:flutter_braille/data/repositories/braille_repository.dart';
import 'package:flutter_braille/data/repositories/image_repository.dart';
import 'package:flutter_braille/domain/models/jetz_client.dart';
import 'package:flutter_braille/domain/usecases/braille_usecases.dart';
import 'package:flutter_braille/domain/usecases/upload_image_usecase.dart';
import 'package:image_picker/image_picker.dart';

List<RepositoryProvider> buildRepositories() {
  return [
    RepositoryProvider<JetzClient>(
      create: (context) => JetzClient(),
    ),
    RepositoryProvider<BrailleRepository>(
      create: (context) => BrailleRemoteImpl(
        context.read<JetzClient>(),
      ),
    ),
    RepositoryProvider<ImageRepository>(
      create: (context) => ImageRemoteImpl(
        ImagePicker(),
      ),
    ),
    RepositoryProvider<BrailleUseCases>(
      create: (context) => BrailleUseCases(
        context.read<BrailleRepository>(),
      ),
    ),
    RepositoryProvider<UploadImageUseCase>(
      create: (context) => UploadImageUseCase(
        context.read<ImageRepository>(),
      ),
    ),
  ];
}
