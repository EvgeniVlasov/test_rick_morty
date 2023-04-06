import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/models/locations/location.dart';
import 'package:rick_morty_test/providers/app_response.dart';
import 'package:rick_morty_test/providers/dio_client.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

class LocationService {
  final DioClient _dioClient;
  final AppRoutes appRoutes;

  LocationService(this._dioClient, this.appRoutes);

  Future<AppResponse<ObservableList<Location>?, Exception>> getLocations(
      [int? page]) async {
    final result = await _dioClient.getLocations(page);
    if (result.isSuccess) {
      return AppResponse.success(data: result.data?.listLocations);
    } else {
      return AppResponse.error(error: result.error);
    }
  }
}
