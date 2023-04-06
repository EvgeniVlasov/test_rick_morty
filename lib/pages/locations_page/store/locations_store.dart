import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/locations/location.dart';
import 'package:rick_morty_test/repositores/location_service.dart';
import 'package:rick_morty_test/routes/app_routes.gr.dart';

part 'locations_store.g.dart';

enum StatusPage { initial, isLoading, isSuccess, isFailed, isLoadMore }

class LocationsStore = _LocationsStore with _$LocationsStore;

abstract class _LocationsStore with Store {
  final LocationService _locationService;

  _LocationsStore(this._locationService);

  @observable
  ObservableList<Location> locations = ObservableList.of(<Location>[]);

  int pageCounter = 1;

  @observable
  Observable<StatusPage> statusPage = Observable(StatusPage.initial);

  @action
  Future<void> getLocation(bool isLoadMore) async {
    statusPage.value =
        isLoadMore ? StatusPage.isLoadMore : StatusPage.isLoading;
    final result = await _locationService.getLocations(pageCounter);
    if (result.isSuccess) {
      locations.addAll(result.data!);
      pageCounter++;
      statusPage.value = StatusPage.isSuccess;
    } else {
      statusPage.value = StatusPage.isFailed;
    }
  }

  @action
  toLocationDetailsPage(Location location) =>
      _locationService.appRoutes.push(LocationDetailsRoute(location: location));
}
