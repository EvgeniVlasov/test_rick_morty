import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/character_notification_lazy.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/providers/storage_provider.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

class CharacterService {
  final AppRoutes appRoutes;
  final StorageProvider _storageProvider;
  final DioClient _dioClient;

  CharacterService(this._dioClient, this.appRoutes, this._storageProvider);

  Future<AppResponse<ObservableList<Character>?, Exception>> getCharacters(
      [int? page, String? name]) async {
    final result = await _dioClient.getCharacters(page, name);
    if (result.isSuccess) {
      return AppResponse.success(data: result.data?.listCharacters);
    } else {
      return AppResponse.error(error: result.error);
    }
  }

  Future<void> setValueShowMessageNotification([String? jsonContent]) =>
      _storageProvider.setContentMessageLazy(jsonContent);

  Future<void> removeDataNotification() =>
      _storageProvider.removeDataLazyNotification();

  NotificationCharacterLazy? get contentMessageNotification =>
      _storageProvider.getShowMessageLazy();
}
