// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produk_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdukStores on _ProdukStores, Store {
  final _$loadingProdukAtom = Atom(name: '_ProdukStores.loadingProduk');

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

  final _$errorProdukAtom = Atom(name: '_ProdukStores.errorProduk');

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

  final _$listProdukAtom = Atom(name: '_ProdukStores.listProduk');

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

  final _$produkPageAtom = Atom(name: '_ProdukStores.produkPage');

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

  final _$lastProdukPageAtom = Atom(name: '_ProdukStores.lastProdukPage');

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

  final _$getProdukAsyncAction = AsyncAction('_ProdukStores.getProduk');

  @override
  Future getProduk(bool isFirst, String keyword) {
    return _$getProdukAsyncAction.run(() => super.getProduk(isFirst, keyword));
  }

  @override
  String toString() {
    return '''
loadingProduk: ${loadingProduk},
errorProduk: ${errorProduk},
listProduk: ${listProduk},
produkPage: ${produkPage},
lastProdukPage: ${lastProdukPage}
    ''';
  }
}
