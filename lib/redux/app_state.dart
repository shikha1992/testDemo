import 'package:flutter/cupertino.dart';

import 'modal.dart';
import 'model/OrderResponseModel.dart';

//store state for application
@immutable
class AppState {
  final BuildContext contextUpComing;  //context movies page
  final EarningMoneyResponse earningMoneyResponse;  //earnings
  final OrderResponseModel responseOrders;  //list of data for order
  final bool loader;  //list of data for top R movies

  const AppState({
  this.contextUpComing,
  this.earningMoneyResponse,
  this.responseOrders,
  this.loader,
  });
}
