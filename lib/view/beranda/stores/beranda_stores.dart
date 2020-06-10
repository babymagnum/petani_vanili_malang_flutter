import 'package:dribbble_clone/model/product/item_product.dart';
import 'package:dribbble_clone/model/promo_model.dart';
import 'package:dribbble_clone/networking/service/networking.dart';
import 'package:mobx/mobx.dart';
import '../../../model/merchant_detail/merchant_detail_data.dart';

part 'beranda_stores.g.dart';

class BerandaStores = _BerandaStores with _$BerandaStores;

abstract class _BerandaStores with Store {

  @observable int drawerIndex = 0;
  @observable bool loadingPromo = false;
  @observable bool loadingProduk = false;
  @observable bool loadingMerchant = false;
  @observable bool errorPromo = false;
  @observable bool errorProduk = false;
  @observable bool errorMerchant = false;
  @observable ObservableList<ItemProduct> listProduk = ObservableList.of([]);
  @observable ObservableList<PromoModel> listPromo = ObservableList.of([]);
  @observable MerchantDetailData merchantDetailData;

  @action setDrawerIndex(int value) => drawerIndex = value;

  @action
  getMerchantDetailData() async {
    loadingMerchant = true;

    final data = await Networking().getMerchantDetail('16');

    if (data != null) {
      errorMerchant = false;
      merchantDetailData = data.data;
    } else {
      errorMerchant = true;
    }

    loadingMerchant = false;
  }

  @action
  getPromo() {
    loadingPromo = true;

    Future.delayed(Duration(seconds: 1), () {
      listPromo.add(PromoModel('https://www.static-src.com/siva/asset//03_2019/Shop-n-drive-maret-microsite-maret-2019.jpg', 'title', 'description'));
      listPromo.add(PromoModel('https://www.static-src.com/siva/asset//03_2019/Shop-n-drive-maret-microsite-maret-2019.jpg', 'title', 'description'));
      listPromo.add(PromoModel('https://www.static-src.com/siva/asset//03_2019/Shop-n-drive-maret-microsite-maret-2019.jpg', 'title', 'description'));

      loadingPromo = false;
    });
  }

  @action
  getProduk() async {
    loadingProduk = true;

    final data = await Networking().getMerchantProducts('16', 1, '');

    if (data != null) {
      errorProduk = false;
      data.data.forEach((element) {
        listProduk.add(element);
      });
    } else {
      errorProduk = true;
    }

    loadingProduk = false;
  }
}