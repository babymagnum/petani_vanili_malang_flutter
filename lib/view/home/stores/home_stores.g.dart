// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStores on _HomeStores, Store {
  final _$drawerIndexAtom = Atom(name: '_HomeStores.drawerIndex');

  @override
  int get drawerIndex {
    _$drawerIndexAtom.reportRead();
    return super.drawerIndex;
  }

  @override
  set drawerIndex(int value) {
    _$drawerIndexAtom.reportWrite(value, super.drawerIndex, () {
      super.drawerIndex = value;
    });
  }

  final _$_HomeStoresActionController = ActionController(name: '_HomeStores');

  @override
  dynamic setDrawerIndex(int value) {
    final _$actionInfo = _$_HomeStoresActionController.startAction(
        name: '_HomeStores.setDrawerIndex');
    try {
      return super.setDrawerIndex(value);
    } finally {
      _$_HomeStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drawerIndex: ${drawerIndex}
    ''';
  }
}
