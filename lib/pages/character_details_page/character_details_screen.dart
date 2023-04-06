import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty_test/pages/character_details_page/store/character_details_store.dart';
import 'package:rick_morty_test/pages/character_details_page/widgets/character_metadata/character_metadata.dart';

@RoutePage()
class CharacterDetailsScreen extends StatelessWidget {
  final CharacterDetailsStore controller;

  const CharacterDetailsScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    controller.character!.image!,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                controller.character!.name!.value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            CharacterMetadataList(
                controller: controller.characterMetadataStore),
            CharacterEpisodes(controller: controller.characterMetadataStore)
          ],
        ),
      ),
    );
  }
}
