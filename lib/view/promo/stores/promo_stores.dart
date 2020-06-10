import 'package:dribbble_clone/model/promo_model.dart';
import 'package:mobx/mobx.dart';

part 'promo_stores.g.dart';

class PromoStores = _PromoStores with _$PromoStores;

abstract class _PromoStores with Store {

  @observable
  bool isLoading = true;

  List<PromoModel> listPromo = [
    PromoModel('https://www.static-src.com/siva/asset//03_2016/BANNER-microheader-TEASER-toyota.jpg', 'Diskon 20% untuk Setiap Mobil Kuning', 'Periode 12 Maret 2020 - 1 April 2020'),
    PromoModel('https://www.static-src.com/siva/asset//03_2016/BANNER-microheader-TEASER-toyota.jpg', 'Gratis Aksesori di Setiap Pembelian Mobil', 'Periode 12 Maret 2020 - 1 April 2020'),
    PromoModel('https://www.static-src.com/siva/asset//03_2016/BANNER-microheader-TEASER-toyota.jpg', 'Diskon 20% untuk Setiap Mobil Kuning', 'Periode 12 Maret 2020 - 1 April 2020'),
    PromoModel('https://www.static-src.com/siva/asset//03_2016/BANNER-microheader-TEASER-toyota.jpg', 'Gratis Aksesori di Setiap Pembelian Mobil', 'Periode 12 Maret 2020 - 1 April 2020'),
  ];
}