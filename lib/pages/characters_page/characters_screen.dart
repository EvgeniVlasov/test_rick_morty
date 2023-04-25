import 'package:auto_route/auto_route.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty_test/main.dart';
import 'package:rick_morty_test/models/characters/character.dart';
import 'package:rick_morty_test/pages/characters_page/store/characters_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_morty_test/repositores/character_service.dart';
import 'package:rick_morty_test/repositores/character_service_prod.dart';

@RoutePage()
class CharactersScreen extends StatelessWidget {
  final controller = CharactersStore(getIt<CharacterService>())
    ..getInitialCharacters();

  CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold_characters_key'),
      appBar: AppBar(
        title: SvgPicture.asset(
          'images/rick_icon.svg',
          width: 50,
          height: 50,
        ),
      ),
      body: ReactionBuilder(
        builder: (BuildContext context) {
          return reaction((_) => controller.statusPage.value, (result) {
            if (result == StatusPage.isFailed) {
              final messenger = ScaffoldMessenger.of(context);

              messenger.showSnackBar(const SnackBar(content: Text('Error')));
            }
            if (result == StatusPage.showNotificationMessage) {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  builder: (context) {
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Icon(
                            Icons.rocket_launch,
                            size: 100,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            controller.titleMessage.value,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            controller.subtitleMessage.value,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                              onPressed:
                                  controller.removeDataMessageNotification,
                              child: const Text('Удалить уведомление')),
                        )
                      ],
                    );
                  });
            }
          });
        },
        child: CustomRefreshIndicator(
          onRefresh: controller.getMoreCharacters,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: controller.searchCharacter,
                      decoration: const InputDecoration(
                        hintText: 'Filter by name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                        ),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.statusPage.value == StatusPage.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(controller.statusPage.value == StatusPage.isSuccess){
                        return Column(
                          key: const Key('characters_key'),
                          children: controller.characters
                              .map((character) => CharacterItem(
                            key: const Key('character_key'),
                            character: character,
                            onPress: () => controller
                                .toCharacterDetailsPage(character),
                          ))
                              .toList(),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CharacterItem extends StatelessWidget {
  final Character character;
  final VoidCallback onPress;

  const CharacterItem(
      {Key? key, required this.character, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        child: GestureDetector(
          onTap: onPress,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  flex: 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(character.image!))),
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          character.name!.value,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            character.gender!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
