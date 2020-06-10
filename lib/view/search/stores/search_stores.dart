import 'package:dribbble_clone/model/product/item_product.dart';
import 'package:dribbble_clone/networking/service/networking.dart';
import 'package:mobx/mobx.dart';

part 'search_stores.g.dart';

class SearchStores = _SearchStores with _$SearchStores;

abstract class _SearchStores with Store {

  @observable String shownQuery = '';
  @observable String search = '';
  @observable int totalProduk = 0;
  @observable bool alreadySearch = false;
  @observable ObservableList<ItemProduct> listProduk = ObservableList.of([]);
  @observable bool loadingProduk = false;
  @observable bool errorProduk = false;
  @observable int produkPage = 1;
  @observable int lastProdukPage = 1;

  @action setSearch(String value) => search = value;
  @action clearListProduk() => listProduk.clear();

  @action
  getProduk(bool isFirst) async {
    shownQuery = search;
    alreadySearch = true;

    if (isFirst) {
      listProduk.clear();
      produkPage = 1;
      lastProdukPage = 1;
    }

    if (produkPage <= lastProdukPage) {
      loadingProduk = true;

      var data = await Networking().getMerchantProducts('16', produkPage, search);

      if (data.data != null) {
        totalProduk = data.total;
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