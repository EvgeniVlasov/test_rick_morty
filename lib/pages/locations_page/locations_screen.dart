import 'package:auto_route/auto_route.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty_test/main.dart';
import 'package:rick_morty_test/models/locations/location.dart';
import 'package:rick_morty_test/pages/locations_page/store/locations_store.dart';
import 'package:rick_morty_test/repositores/location_service.dart';

@RoutePage()
class LocationsScreen extends StatelessWidget {
  final controller = LocationsStore(getIt<LocationService>())
    ..getLocation(false);

  LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'images/rick_icon.svg',
          width: 50,
          height: 50,
        ),
      ),
      body: CustomRefreshIndicator(
        onRefresh: () => controller.getLocation(true),
        trigger: IndicatorTrigger.bothEdges,
        builder: MaterialIndicatorDelegate(
            builder: (BuildContext context, IndicatorController controller) {
          return const CircularProgressIndicator();
        }),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListView(
              children: [
                Image.asset(
                  'images/logo.png',
                ),
                Observer(builder: (context) {
                  if (controller.statusPage.value == StatusPage.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: controller.locations
                        .map((location) => LocationItem(
                              location: location,
                              onPress: () =>
                                  controller.toLocationDetailsPage(location),
                            ))
                        .toList(),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  final Location location;
  final VoidCallback onPress;

  const LocationItem({Key? key, required this.location, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                location.name!.value,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
