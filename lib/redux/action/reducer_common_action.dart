//This class takes the current state and an action, and returns the next state >>>>> Reducer

import 'package:testapp/redux/reducer/app_reducer.dart';

import '../app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    contextUpComing: contextMovieReducer(state.contextUpComing, action), //context
    earningMoneyResponse: earningReducer(state.earningMoneyResponse, action), //data earning
    responseOrders: listOrderReducer(state.responseOrders, action), //list order
    loader: loaderReducer(state.loader, action), //loader for  movie page
  );
}


