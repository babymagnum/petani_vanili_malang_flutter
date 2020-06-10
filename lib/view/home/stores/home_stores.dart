import 'package:mobx/mobx.dart';

part 'home_stores.g.dart';

class HomeStores = _HomeStores with _$HomeStores;

abstract class _HomeStores with Store {

  @observable
  int drawerIndex = 0;

  @action
  setDrawerIndex(int value) => drawerIndex = value;

}