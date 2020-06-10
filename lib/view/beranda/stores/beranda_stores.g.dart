// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beranda_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BerandaStores on _BerandaStores, Store {
  final _$drawerIndexAtom = Atom(name: '_BerandaStores.drawerIndex');

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

  final _$loadingPromoAtom = Atom(name: '_BerandaStores.loadingPromo');

  @override
  bool get loadingPromo {
    _$loadingPromoAtom.reportRead();
    return super.loadingPromo;
  }

  @override
  set loadingPromo(bool value) {
    _$loadingPromoAtom.reportWrite(value, super.loadingPromo, () {
      super.loadingPromo = value;
    });
  }

  final _$loadingProdukAtom = Atom(name: '_BerandaStores.loadingProduk');

  @override
  bool get loadingProduk {
    _$loadingProdukAtom.reportRead();
    return super.loadingProduk;
  }

  @override
  set loadingProduk(bool value) {
    _$loadingProdukAtom.reportWrite(value, super.loadingProduk, () {
      super.loadingProduk = value;
    });
  }

  final _$loadingMerchantAtom = Atom(name: '_BerandaStores.loadingMerchant');

  @override
  bool get loadingMerchant {
    _$loadingMerchantAtom.reportRead();
    return super.loadingMerchant;
  }

  @override
  set loadingMerchant(bool value) {
    _$loadingMerchantAtom.reportWrite(value, super.loadingMerchant, () {
      super.loadingMerchant = value;
    });
  }

  final _$errorPromoAtom = Atom(name: '_BerandaStores.errorPromo');

  @override
  bool get errorPromo {
    _$errorPromoAtom.reportRead();
    return super.errorPromo;
  }

  @override
  set errorPromo(bool value) {
    _$errorPromoAtom.reportWrite(value, super.errorPromo, () {
      super.errorPromo = value;
    });
  }

  final _$errorProdukAtom = Atom(name: '_BerandaStores.errorProduk');

  @override
  bool get errorProduk {
    _$errorProdukAtom.reportRead();
    return super.errorProduk;
  }

  @override
  set errorProduk(bool value) {
    _$errorProdukAtom.reportWrite(value, super.errorProduk, () {
      super.errorProduk = value;
    });
  }

  final _$errorMerchantAtom = Atom(name: '_BerandaStores.errorMerchant');

  @override
  bool get errorMerchant {
    _$errorMerchantAtom.reportRead();
    return super.errorMerchant;
  }

  @override
  set errorMerchant(bool value) {
    _$errorMerchantAtom.reportWrite(value, super.errorMerchant, () {
      super.errorMerchant = value;
    });
  }

  final _$listProdukAtom = Atom(name: '_BerandaStores.listProduk');

  @override
  ObservableList<ItemProduct> get listProduk {
    _$listProdukAtom.reportRead();
    return super.listProduk;
  }

  @override
  set listProduk(ObservableList<ItemProduct> value) {
    _$listProdukAtom.reportWrite(value, super.listProduk, () {
      super.listProduk = value;
    });
  }

  final _$listPromoAtom = Atom(name: '_BerandaStores.listPromo');

  @override
  ObservableList<PromoModel> get listPromo {
    _$listPromoAtom.reportRead();
    return super.listPromo;
  }

  @override
  set listPromo(ObservableList<PromoModel> value) {
    _$listPromoAtom.reportWrite(value, super.listPromo, () {
      super.listPromo = value;
    });
  }

  final _$merchantDetailDataAtom =
      Atom(name: '_BerandaStores.merchantDetailData');

  @override
  MerchantDetailData get merchantDetailData {
    _$merchantDetailDataAtom.reportRead();
    return super.merchantDetailData;
  }

  @override
  set merchantDetailData(MerchantDetailData value) {
    _$merchantDetailDataAtom.reportWrite(value, super.merchantDetailData, () {
      super.merchantDetailData = value;
    });
  }

  final _$getMerchantDetailDataAsyncAction =
      AsyncAction('_BerandaStores.getMerchantDetailData');

  @override
  Future getMerchantDetailData() {
    return _$getMerchantDetailDataAsyncAction
        .run(() => super.getMerchantDetailData());
  }

  final _$getProdukAsyncAction = AsyncAction('_BerandaStores.getProduk');

  @override
  Future getProduk() {
    return _$getProdukAsyncAction.run(() => super.getProduk());
  }

  final _$_BerandaStoresActionController =
      ActionController(name: '_BerandaStores');

  @override
  dynamic setDrawerIndex(int value) {
    final _$actionInfo = _$_BerandaStoresActionController.startAction(
        name: '_BerandaStores.setDrawerIndex');
    try {
      return super.setDrawerIndex(value);
    } finally {
      _$_BerandaStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPromo() {
    final _$actionInfo = _$_BerandaStoresActionController.startAction(
        name: '_BerandaStores.getPromo');
    try {
      return super.getPromo();
    } finally {
      _$_BerandaStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drawerIndex: ${drawerIndex},
loadingPromo: ${loadingPromo},
loadingProduk: ${loadingProduk},
loadingMerchant: ${loadingMerchant},
errorPromo: ${errorPromo},
errorProduk: ${errorProduk},
errorMerchant: ${errorMerchant},
listProduk: ${listProduk},
listPromo: ${listPromo},
merchantDetailData: ${merchantDetailData}
    ''';
  }
}
