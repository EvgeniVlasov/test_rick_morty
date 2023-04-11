import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
abstract class Callable<T> {
  void call([T? arg]) {}
}

class MockCallable<T> extends Mock implements Callable<T> {}


void mobxTest<S extends Store, P>(
    String description, {
       required S Function() build,
       required FutureOr Function(S) act,
      required P Function(S) stateField,
      Function? arrange,
      Function(P)? inspect,
      required void Function(MockCallable<P> updatesWith) assertions,
    }) async {
  test(description, () async {
    final expectation = MockCallable<P>();

    arrange?.call();

    final store = build();
    reaction<P>((_) => stateField.call(store), (P newValue) {
      inspect?.call(newValue);
      expectation.call(newValue);
    });

    await act.call(store);

    assertions(expectation);
  });
}