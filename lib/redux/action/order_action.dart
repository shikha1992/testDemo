import 'package:flutter/cupertino.dart';
import 'package:testapp/redux/model/OrderResponseModel.dart';

import '../modal.dart';

//action for list oforder
class ListOrderAction {

  ListOrderAction();
}

//response fetched here
class ListOrderApiResponseAction {
  OrderResponseModel responseOrder;

  ListOrderApiResponseAction(this.responseOrder);
}