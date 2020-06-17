
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:testapp/redux/action/order_action.dart';
import 'package:testapp/redux/action/earning_action.dart';
import 'package:testapp/utils/service/api_service.dart';
import '../app_state.dart';

//This class provides way to interact with actions that have been dispatched to the store before they reach the store's reducer
//here actions for API are dispatched(async requests)

List<Middleware<AppState>> createAppMiddleware() {
  return <Middleware<AppState>>[
    thunkMiddleware,
    TypedMiddleware<AppState, GetEarningAction>(_upcomingMovie),
    TypedMiddleware<AppState, ListOrderAction>(_orderList),
  ];
}


//to get earning
void _upcomingMovie(
    Store<AppState> store, GetEarningAction action, NextDispatcher next) async {
  next(action);
  ApiProvider()
      .getUpComingList(store, action)
      .then((int status) {
//    store.dispatch(ListOrderAction());

  });
  print(action);
}



//to get earning
void _orderList(
    Store<AppState> store, ListOrderAction action, NextDispatcher next) async {
  next(action);
  ApiProvider()
      .getOrder(store, action)
      .then((int status) {

  });
  print(action);
}


