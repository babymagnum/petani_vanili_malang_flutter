// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStores on _SearchStores, Store {
  final _$shownQueryAtom = Atom(name: '_SearchStores.shownQuery');

  @override
  String get shownQuery {
    _$shownQueryAtom.reportRead();
    return super.shownQuery;
  }

  @override
  set shownQuery(String value) {
    _$shownQueryAtom.reportWrite(value, super.shownQuery, () {
      super.shownQuery = value;
    });
  }

  final _$searchAtom = Atom(name: '_SearchStores.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$totalProdukAtom = Atom(name: '_SearchStores.totalProduk');

  @override
  int get totalProduk {
    _$totalProdukAtom.reportRead();
    return super.totalProduk;
  }

  @override
  set totalProduk(int value) {
    _$totalProdukAtom.reportWrite(value, super.totalProduk, () {
      super.totalProduk = value;
    });
  }

  final _$alreadySearchAtom = Atom(name: '_SearchStores.alreadySearch');

  @override
  bool get alreadySearch {
    _$alreadySearchAtom.reportRead();
    return super.alreadySearch;
  }

  @override
  set alreadySearch(bool value) {
    _$alreadySearchAtom.reportWrite(value, super.alreadySearch, () {
      super.alreadySearch = value;
    });
  }

  final _$listProdukAtom = Atom(name: '_SearchStores.listProduk');

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

  final _$loadingProdukAtom = Atom(name: '_SearchStores.loadingProduk');

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

  final _$errorProdukAtom = Atom(name: '_SearchStores.errorProduk');

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

  final _$produkPageAtom = Atom(name: '_SearchStores.produkPage');

  @override
  int get produkPage {
    _$produkPageAtom.reportRead();
    return super.produkPage;
  }

  @override
  set produkPage(int value) {
    _$produkPageAtom.reportWrite(value, super.produkPage, () {
      super.produkPage = value;
    });
  }

  final _$lastProdukPageAtom = Atom(name: '_SearchStores.lastProdukPage');

  @override
  int get lastProdukPage {
    _$lastProdukPageAtom.reportRead();
    return super.lastProdukPage;
  }

  @override
  set lastProdukPage(int value) {
    _$lastProdukPageAtom.reportWrite(value, super.lastProdukPage, () {
      super.lastProdukPage = value;
    });
  }

  final _$getProdukAsyncAction = AsyncAction('_SearchStores.getProduk');

  @override
  Future getProduk(bool isFirst) {
    return _$getProdukAsyncAction.run(() => super.getProduk(isFirst));
  }

  final _$_SearchStoresActionController =
      ActionController(name: '_SearchStores');

  @override
  dynamic setSearch(String value) {
    final _$actionInfo = _$_SearchStoresActionController.startAction(
        name: '_SearchStores.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_SearchStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearListProduk() {
    final _$actionInfo = _$_SearchStoresActionController.startAction(
        name: '_SearchStores.clearListProduk');
    try {
      return super.clearListProduk();
    } finally {
      _$_SearchStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shownQuery: ${shownQuery},
search: ${search},
totalProduk: ${totalProduk},
alreadySearch: ${alreadySearch},
listProduk: ${listProduk},
loadingProduk: ${loadingProduk},
errorProduk: ${errorProduk},
produkPage: ${produkPage},
lastProdukPage: ${lastProdukPage}
    ''';
  }
}
