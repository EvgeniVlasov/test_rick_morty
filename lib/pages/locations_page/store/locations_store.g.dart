// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationsStore on _LocationsStore, Store {
  late final _$locationsAtom =
      Atom(name: '_LocationsStore.locations', context: context);

  @override
  ObservableList<Location> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(ObservableList<Location> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  late final _$statusPageAtom =
      Atom(name: '_LocationsStore.statusPage', context: context);

  @override
  Observable<StatusPage> get statusPage {
    _$statusPageAtom.reportRead();
    return super.statusPage;
  }

  @override
  set statusPage(Observable<StatusPage> value) {
    _$statusPageAtom.reportWrite(value, super.statusPage, () {
      super.statusPage = value;
    });
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_LocationsStore.getLocation', context: context);

  @override
  Future<void> getLocation(bool isLoadMore) {
    return _$getLocationAsyncAction.run(() => super.getLocation(isLoadMore));
  }

  late final _$_LocationsStoreActionController =
      ActionController(name: '_LocationsStore', context: context);

  @override
  dynamic toLocationDetailsPage(Location location) {
    final _$actionInfo = _$_LocationsStoreActionController.startAction(
        name: '_LocationsStore.toLocationDetailsPage');
    try {
      return super.toLocationDetailsPage(location);
    } finally {
      _$_LocationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locations: ${locations},
statusPage: ${statusPage}
    ''';
  }
}
