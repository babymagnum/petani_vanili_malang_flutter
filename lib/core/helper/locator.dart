import 'package:get_it/get_it.dart';
import '../../view/home/stores/home_stores.dart';
import '../../view/produk/stores/produk_stores.dart';
import '../../view/detail_produk/stores/detail_produk_stores.dart';
import '../../view/promo/stores/promo_stores.dart';
import '../../view/search/stores/search_stores.dart';
import '../../view/high_resolution/stores/high_res_stores.dart';
import '../../view/beranda/stores/beranda_stores.dart';
import '../../view/kontak_kami/stores/kontak_kami_stores.dart';

GetIt locator = GetIt.I;

void setupLocator() {

  /*
  * Use registerFactory if you need to instantiate it everytime its need
  * locator.registerFactory<LoginProvider>(() => LoginProvider());
  *
  * =================================================================
  *
  * Use registerSingleton if you dont need to instantiate it everytime
  * locator.registerSingleton(() => LoginProvider());
  * */

  locator.registerLazySingleton<HomeStores>(() => HomeStores());
  locator.registerLazySingleton<ProdukStores>(() => ProdukStores());
  locator.registerLazySingleton<DetailProdukStores>(() => DetailProdukStores());
  locator.registerLazySingleton<PromoStores>(() => PromoStores());
  locator.registerLazySingleton<SearchStores>(() => SearchStores());
  locator.registerLazySingleton<HighResStores>(() => HighResStores());
  locator.registerLazySingleton<BerandaStores>(() => BerandaStores());
  locator.registerLazySingleton<KontakKamiStores>(() => KontakKamiStores());
}
