// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kontak_kami_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$KontakKamiStores on _KontakKamiStores, Store {
  final _$listKontakAtom = Atom(name: '_KontakKamiStores.listKontak');

  @override
  ObservableList<KontakModel> get listKontak {
    _$listKontakAtom.reportRead();
    return super.listKontak;
  }

  @override
  set listKontak(ObservableList<KontakModel> value) {
    _$listKontakAtom.reportWrite(value, super.listKontak, () {
      super.listKontak = value;
    });
  }

  final _$_KontakKamiStoresActionController =
      ActionController(name: '_KontakKamiStores');

  @override
  dynamic getKontakData() {
    final _$actionInfo = _$_KontakKamiStoresActionController.startAction(
        name: '_KontakKamiStores.getKontakData');
    try {
      return super.getKontakData();
    } finally {
      _$_KontakKamiStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listKontak: ${listKontak}
    ''';
  }
}
