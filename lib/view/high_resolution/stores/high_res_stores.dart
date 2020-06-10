import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'high_res_stores.g.dart';

class HighResStores = _HighResStores with _$HighResStores;

abstract class _HighResStores with Store {

  @observable bool onPanUpdate = false;
  @observable Offset notificationPosition = Offset(0, 0);
  @observable double notificationHeight = 0;
  @observable double titleHeight = 0;

  @action setTitleHeight(value) => titleHeight = value;
  @action changeNotificationHeight(value) => notificationHeight = value;
  @action changeNotificationPosition(value) => notificationPosition = value;
  @action changePanUpdate(value) => onPanUpdate = value;

  @action
  resetBottomSheetPosition() {
    notificationPosition = Offset(0, 0);
  }
}