import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/model/kontak_model.dart';
import 'package:mobx/mobx.dart';
import '../../beranda/stores/beranda_stores.dart';

part 'kontak_kami_stores.g.dart';

class KontakKamiStores = _KontakKamiStores with _$KontakKamiStores;

abstract class _KontakKamiStores with Store {

  var _berandaStores = locator<BerandaStores>();

  @observable ObservableList<KontakModel> listKontak = ObservableList.of([]);

  @action
  getKontakData() {
    final merchantData = _berandaStores.merchantDetailData.merchant;
    listKontak.add(KontakModel('assets/images/ic_shopping_bag.png', merchantData.address, merchantData.name));
    listKontak.add(KontakModel('assets/images/ic_phone_red.png', merchantData.phone, 'Telepon'));
    listKontak.add(KontakModel('assets/images/ic_smartphone.png', merchantData.whatsapp, 'WhatsApp'));
    listKontak.add(KontakModel('assets/images/ic_mail.png', merchantData.email, 'e-Mail'));
  }

}