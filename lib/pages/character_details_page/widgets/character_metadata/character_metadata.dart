import 'package:flutter/material.dart';
import 'package:rick_morty_test/pages/character_details_page/widgets/character_metadata/store/character_metadata_store.dart';

class CharacterMetadataList extends StatelessWidget {
  final CharacterMetadataStore controller;

  const CharacterMetadataList({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Text(
            'Information',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.grey),
          ),
          Column(
            children: [
              CharacterMetadataItem(
                title: 'Gender',
                subtitle: controller.character!.gender!,
              ),
              CharacterMetadataItem(
                title: 'Status',
                subtitle: controller.character!.status!,
              ),
              CharacterMetadataItem(
                title: 'Specie',
                subtitle: controller.character!.species!,
              ),
              CharacterMetadataItem(
                title: 'Origin',
                subtitle: controller.character!.origin!.name!,
              ),
              CharacterMetadataItem(
                title: 'Type',
                subtitle: controller.character!.type!,
              ),
              CharacterMetadataItem(
                title: 'Location',
                subtitle: controller.character!.location!.name!,
                isButton: true,
                onPress: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CharacterEpisodes extends StatelessWidget {
  final CharacterMetadataStore controller;

  const CharacterEpisodes({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Text(
            'Episodes',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.grey),
          ),
          Column(
              children: controller.character!.episode!
                  .map((epsd) => CharacterMetadataItem(
                        title: epsd,
                        subtitle: '',
                        isButton: true,
                        onPress: () {},
                      ))
                  .toList())
        ],
      ),
    );
  }
}

class CharacterMetadataItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPress;
  final bool isButton;

  const CharacterMetadataItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.onPress,
      this.isButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isButton ? onPress : null,
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: Visibility(
                  visible: isButton,
                  child: const Icon(Icons.arrow_forward_ios)),
            ),
            const Divider(
              color: Colors.black,
            )
          ],
        ));
  }
}
