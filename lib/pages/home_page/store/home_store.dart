import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/routes/app_routes.dart';
import 'package:rick_morty_test/routes/app_routes.gr.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final AppRoutes _appRoutes;

  _HomeStore(this._appRoutes);

  @action
  void toCharactersPage() => _appRoutes.push(CharactersRoute());

  @action
  void toLocationsPage() => _appRoutes.push(LocationsRoute());

  @action
  void toEpisodesPage() => _appRoutes.push(const EpisodesRoute());
}
