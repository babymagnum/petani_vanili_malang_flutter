import 'package:dribbble_clone/model/product/item_product.dart';
import 'package:dribbble_clone/networking/service/networking.dart';
import 'package:mobx/mobx.dart';

part 'produk_stores.g.dart';

class ProdukStores = _ProdukStores with _$ProdukStores;

abstract class _ProdukStores with Store {

  @observable bool loadingProduk = false;
  @observable bool errorProduk = false;
  @observable ObservableList<ItemProduct> listProduk = ObservableList.of([]);
  @observable int produkPage = 1;
  @observable int lastProdukPage = 1;

  @action
  getProduk(bool isFirst, String keyword) async {
    if (isFirst) {
      listProduk.clear();
      produkPage = 1;
      lastProdukPage = 1;
    }

    if (produkPage <= lastProdukPage) {
      loadingProduk = true;

      var data = await Networking().getMerchantProducts('16', produkPage, keyword);

      if (data.data != null) {
        errorProduk = false;
        produkPage += 1;
        lastProdukPage = data.last_page;
        data.data.forEach((element) {
          listProduk.add(element);
        });
      } else {
        errorProduk = true;
      }

      loadingProduk = false;
    }
  }
}