import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty_test/main.dart';
import 'package:rick_morty_test/pages/home_page/store/home_store.dart';
import 'package:rick_morty_test/routes/app_routes.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final _controller = HomeStore(getIt<AppRoutes>());

  HomeScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: _controller.toCharactersPage,
                  child: Text(
                    'Characters',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                    onPressed: _controller.toEpisodesPage,
                    child: Text(
                      'Episodes',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              ),
              TextButton(
                  onPressed: _controller.toLocationsPage,
                  child: Text(
                    'Locations',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
