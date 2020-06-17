
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:testapp/redux/action/order_action.dart';
import 'package:testapp/redux/action/earning_action.dart';
import 'package:testapp/redux/model/OrderResponseModel.dart';


import '../app_state.dart';
import '../modal.dart';

//This class provides way to interact with actions that have been dispatched to the store before they reach the store's reducer
//here actions for API are dispatched(async requests)

final contextMovieReducer = TypedReducer<BuildContext, GetEarningAction>(_contextMovieReducer); // to share context of movie page
final earningReducer = TypedReducer<EarningMoneyResponse, EarningApiResponseAction>(_earningDataReducer); // response of money
final listOrderReducer = TypedReducer<OrderResponseModel, ListOrderApiResponseAction>(_listOrderReducer); //response of orders
final loaderReducer = TypedReducer<bool, LoaderAction>(_loaderReducer); //loader for movies


//All methods declared in reducer are defined here...part of reducer only!


//............................................Reducer..............................................

BuildContext _contextMovieReducer(BuildContext state, GetEarningAction action) {
  return action.contextUpComing;
}

EarningMoneyResponse  _earningDataReducer(EarningMoneyResponse data, EarningApiResponseAction action) {
  return action.responseUpComing;
}

OrderResponseModel  _listOrderReducer(OrderResponseModel data, ListOrderApiResponseAction action) {
  return action.responseOrder;
}


bool  _loaderReducer(bool data, LoaderAction action) {
  return action.loader;
}

