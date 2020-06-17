
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:testapp/redux/action/order_action.dart';
import 'package:testapp/redux/action/earning_action.dart';
import 'dart:convert';
import 'dart:io';

import 'package:testapp/redux/app_state.dart';
import 'package:testapp/redux/modal.dart';
import 'package:testapp/redux/model/OrderResponseModel.dart';


enum Environment { DEV, PROD }

class ApiProvider {
  String _baseUrl = "";
  String _version = "v2";
  Client client = Client();
  final _apiKey = "f55fbda0cb73b855629e676e54ab6d8e";

  static final ApiProvider _apiProvider = ApiProvider._internal();
  static final Environment _setEnv = Environment.DEV;

  ApiProvider._internal() {
    // initialization logic here
    if(_setEnv == Environment.DEV){
      _baseUrl = 'https://d3rrgc1io7q2aj.cloudfront.net/qa/api/';
    }else{
      _baseUrl = 'https://d3rrgc1io7q2aj.cloudfront.net/qa/api/';
    }


  }

  factory ApiProvider() {
    return _apiProvider;
  }

  Future<int> getUpComingList(
      Store<AppState> store, GetEarningAction action) async {
    EarningMoneyResponse _earnResponse;
    Map<String, String> header = new Map();
    header["yelo-auth-token"] = "SllzS3VkNVg3UUVMR0JWVVVoWk9NM3BVaCthWkxYQjdpVCtHdkNnRUtTQT0=";

    try {
      final response = await client.get("$_baseUrl$_version/vapp/vendor/5/report/sale?date=2020-06-15", headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response earning: ${response.body}");
        _earnResponse = EarningMoneyResponse.fromJson(json.decode(response.body));
        store.dispatch(EarningApiResponseAction(_earnResponse));

        return response.statusCode;
      }  else {
        return 500;
      }
    } catch (e) {
      return 500;
    }

  }

Future<int> getOrder(
      Store<AppState> store, ListOrderAction action) async {
    OrderResponseModel _orderResponse;
    Map<String, String> header = new Map();
    header["yelo-auth-token"] = "SllzS3VkNVg3UUVMR0JWVVVoWk9NM3BVaCthWkxYQjdpVCtHdkNnRUtTQT0=";

    try {
      final response = await client.get("$_baseUrl$_version/vapp/order?_pageNo=1&_pageSize=10&orderMode=ALL_CURRENT_ORDER",
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response earning: ${response.body}");
        _orderResponse = OrderResponseModel.fromJson(json.decode(response.body));
        store.dispatch(ListOrderApiResponseAction(_orderResponse));

        return response.statusCode;
      }  else {
        return 500;
      }
    } catch (e) {
      return 500;
    }

  }



}

