import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/character_notification_lazy.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/providers/storage_provider.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

class CharacterServiceProd implements CharacterService {
  final DioClient _dioClient;
  final AppRoutes? _appRoutes;
  final StorageProvider _storageProvider;

  CharacterServiceProd(this._dioClient, this._appRoutes, this._storageProvider);

  @override
  AppRoutes? get appRoutes => _appRoutes;

  @override
  DioClient get dioClient => _dioClient;

  @override
  StorageProvider get storageProvider => _storageProvider;

  @override
  NotificationCharacterLazy? get contentMessageNotification =>
      _storageProvider.getShowMessageLazy();

  @override
  Future<AppResponse<ObservableList<Character>?, Exception>> getCharacters(
      [int? page, String? name]) async {
    final result = await _dioClient.getCharacters(page, name);
    if (result.isSuccess) {
      return AppResponse.success(data: result.data?.listCharacters);
    } else {
      return AppResponse.error(error: result.error);
    }
  }

  @override
  Future<void> removeDataNotification() =>
      _storageProvider.removeDataLazyNotification();

}
