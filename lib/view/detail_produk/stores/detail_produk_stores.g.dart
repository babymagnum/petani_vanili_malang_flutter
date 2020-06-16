// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_produk_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailProdukStores on _DetailProdukStores, Store {
  final _$productDetailDataAtom =
      Atom(name: '_DetailProdukStores.productDetailData');

  @override
  ProductDetailData get productDetailData {
    _$productDetailDataAtom.reportRead();
    return super.productDetailData;
  }

  @override
  set productDetailData(ProductDetailData value) {
    _$productDetailDataAtom.reportWrite(value, super.productDetailData, () {
      super.productDetailData = value;
    });
  }

  final _$imageIndexAtom = Atom(name: '_DetailProdukStores.imageIndex');

  @override
  int get imageIndex {
    _$imageIndexAtom.reportRead();
    return super.imageIndex;
  }

  @override
  set imageIndex(int value) {
    _$imageIndexAtom.reportWrite(value, super.imageIndex, () {
      super.imageIndex = value;
    });
  }

  final _$showMenuAtom = Atom(name: '_DetailProdukStores.showMenu');

  @override
  bool get showMenu {
    _$showMenuAtom.reportRead();
    return super.showMenu;
  }

  @override
  set showMenu(bool value) {
    _$showMenuAtom.reportWrite(value, super.showMenu, () {
      super.showMenu = value;
    });
  }

  final _$listVideoAtom = Atom(name: '_DetailProdukStores.listVideo');

  @override
  ObservableList<VideoProdukModel> get listVideo {
    _$listVideoAtom.reportRead();
    return super.listVideo;
  }

  @override
  set listVideo(ObservableList<VideoProdukModel> value) {
    _$listVideoAtom.reportWrite(value, super.listVideo, () {
      super.listVideo = value;
    });
  }

  final _$getProductDetailDataAsyncAction =
      AsyncAction('_DetailProdukStores.getProductDetailData');

  @override
  Future getProductDetailData(dynamic context, String productId) {
    return _$getProductDetailDataAsyncAction
        .run(() => super.getProductDetailData(context, productId));
  }

  final _$_DetailProdukStoresActionController =
      ActionController(name: '_DetailProdukStores');

  @override
  dynamic setImageIndex(dynamic value) {
    final _$actionInfo = _$_DetailProdukStoresActionController.startAction(
        name: '_DetailProdukStores.setImageIndex');
    try {
      return super.setImageIndex(value);
    } finally {
      _$_DetailProdukStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowMenu(dynamic value) {
    final _$actionInfo = _$_DetailProdukStoresActionController.startAction(
        name: '_DetailProdukStores.setShowMenu');
    try {
      return super.setShowMenu(value);
    } finally {
      _$_DetailProdukStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetData() {
    final _$actionInfo = _$_DetailProdukStoresActionController.startAction(
        name: '_DetailProdukStores.resetData');
    try {
      return super.resetData();
    } finally {
      _$_DetailProdukStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateListVideo(int index) {
    final _$actionInfo = _$_DetailProdukStoresActionController.startAction(
        name: '_DetailProdukStores.updateListVideo');
    try {
      return super.updateListVideo(index);
    } finally {
      _$_DetailProdukStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productDetailData: ${productDetailData},
imageIndex: ${imageIndex},
showMenu: ${showMenu},
listVideo: ${listVideo}
    ''';
  }
}
