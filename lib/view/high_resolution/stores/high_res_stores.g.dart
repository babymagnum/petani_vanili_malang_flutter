// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_res_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HighResStores on _HighResStores, Store {
  final _$onPanUpdateAtom = Atom(name: '_HighResStores.onPanUpdate');

  @override
  bool get onPanUpdate {
    _$onPanUpdateAtom.reportRead();
    return super.onPanUpdate;
  }

  @override
  set onPanUpdate(bool value) {
    _$onPanUpdateAtom.reportWrite(value, super.onPanUpdate, () {
      super.onPanUpdate = value;
    });
  }

  final _$notificationPositionAtom =
      Atom(name: '_HighResStores.notificationPosition');

  @override
  Offset get notificationPosition {
    _$notificationPositionAtom.reportRead();
    return super.notificationPosition;
  }

  @override
  set notificationPosition(Offset value) {
    _$notificationPositionAtom.reportWrite(value, super.notificationPosition,
        () {
      super.notificationPosition = value;
    });
  }

  final _$notificationHeightAtom =
      Atom(name: '_HighResStores.notificationHeight');

  @override
  double get notificationHeight {
    _$notificationHeightAtom.reportRead();
    return super.notificationHeight;
  }

  @override
  set notificationHeight(double value) {
    _$notificationHeightAtom.reportWrite(value, super.notificationHeight, () {
      super.notificationHeight = value;
    });
  }

  final _$titleHeightAtom = Atom(name: '_HighResStores.titleHeight');

  @override
  double get titleHeight {
    _$titleHeightAtom.reportRead();
    return super.titleHeight;
  }

  @override
  set titleHeight(double value) {
    _$titleHeightAtom.reportWrite(value, super.titleHeight, () {
      super.titleHeight = value;
    });
  }

  final _$_HighResStoresActionController =
      ActionController(name: '_HighResStores');

  @override
  dynamic setTitleHeight(dynamic value) {
    final _$actionInfo = _$_HighResStoresActionController.startAction(
        name: '_HighResStores.setTitleHeight');
    try {
      return super.setTitleHeight(value);
    } finally {
      _$_HighResStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNotificationHeight(dynamic value) {
    final _$actionInfo = _$_HighResStoresActionController.startAction(
        name: '_HighResStores.changeNotificationHeight');
    try {
      return super.changeNotificationHeight(value);
    } finally {
      _$_HighResStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNotificationPosition(dynamic value) {
    final _$actionInfo = _$_HighResStoresActionController.startAction(
        name: '_HighResStores.changeNotificationPosition');
    try {
      return super.changeNotificationPosition(value);
    } finally {
      _$_HighResStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePanUpdate(dynamic value) {
    final _$actionInfo = _$_HighResStoresActionController.startAction(
        name: '_HighResStores.changePanUpdate');
    try {
      return super.changePanUpdate(value);
    } finally {
      _$_HighResStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetBottomSheetPosition() {
    final _$actionInfo = _$_HighResStoresActionController.startAction(
        name: '_HighResStores.resetBottomSheetPosition');
    try {
      return super.resetBottomSheetPosition();
    } finally {
      _$_HighResStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onPanUpdate: ${onPanUpdate},
notificationPosition: ${notificationPosition},
notificationHeight: ${notificationHeight},
titleHeight: ${titleHeight}
    ''';
  }
}
