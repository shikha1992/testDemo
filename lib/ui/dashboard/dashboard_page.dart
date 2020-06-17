
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';
import 'package:testapp/redux/action/earning_action.dart';
import 'package:testapp/redux/app_state.dart';
import 'package:testapp/redux/modal.dart';
import 'package:testapp/redux/model/OrderResponseModel.dart';
import 'package:testapp/utils/TriangleClipper.dart';
import 'package:testapp/utils/app_colors.dart';
import 'package:testapp/utils/constants.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Store<AppState> store;
  int _selected = 0;


  //adding listener for animation controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 664)..init(context);
    return StoreConnector<AppState, _DashBoardModel>(
        converter: (Store<AppState> store) {
      this.store = store;
      return _DashBoardModel.create(store, context);
    }, onInit: (Store store) async {
      store.dispatch(GetEarningAction(context)); //api
    }, onDidChange: (data) {

    }, builder: (BuildContext context, _DashBoardModel data) {
      return Scaffold(
        backgroundColor: AppColors.colorWhite,
        body:
        data.loader ?
        Container(
          color: Colors.transparent,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator(
              valueColor:
              AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        )
          :
          SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: <Widget>[
                _topMoneyList(data),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                _tabsList(),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                _instantView(),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
//                _listOfOrders(data)
              ],
            ),
          ),
        ),
      );
    });
  }


//parent of items at top order
  Widget _topMoneyList(_DashBoardModel data) {
    return
      Container(
        height: 150.0,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          alignment: WrapAlignment.spaceAround,
//          direction: Axis.horizontal,
          children: <Widget>[
            _topMoneyItem(0,data),
            Spacer(),
            _topMoneyItem(1,data),
            Spacer(),
            _topMoneyItem(2,data)

          ],
        )
      );
  }


  Widget _topMoneyItem(int index, _DashBoardModel data){
    return
      Container(
          width: ScreenUtil.getInstance().setWidth(120),
          child:
          ClipPath(
              clipper: TriangleClipper(),
              child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          elevation: 4,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[

                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: index == 0? Colors.orange :
                  index == 1 ? Colors.deepPurple :
                  Colors.pinkAccent,
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    index == 0? StringLiteral.allOrders :
                    index == 1 ?
                    data.dataUpComing != null ?
                    data.tot.toString()+ "\n" +StringLiteral.earningDay
                        : StringLiteral.earningDay :
                    StringLiteral.allCustomers,
                    textAlign: TextAlign.center,
                    style: Style.topOrderStyle,
                  ),
                ),
              ),
            ],
          ),
        ))
      );
  }

//parent of items at top order
  Widget _tabsList() {
    return
      Container(
        height: 40.0,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _tabsItem(0),
            _tabsItem(1),
            _tabsItem(2)

          ],
        )
      );
  }


  Widget _tabsItem(int index){
    return
      Container(
          width: ScreenUtil.getInstance().setWidth(120),
        child:
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          elevation: 4,
          child:
          InkWell(
            onTap: ()async {
              setState(() {
                _selected = index;
              });
            },
            child:
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color:_selected == index ? Colors.orange :
                    Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(

                    child: Text(
                      index == 0? StringLiteral.ongoing :
                      index == 1 ? StringLiteral.tom :
                      StringLiteral.history,
                      textAlign: TextAlign.center,
                      style: _selected == index ? Style.middleStyleSel : Style.middleStyleUnSel,
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      );
  }

  //instant view header
  Widget _instantView(){
    return
        Align(
          alignment: Alignment.topLeft,
          child:
          Row(
           children: <Widget>[
             Container(
               child:const Icon(Icons.watch_later, color: Colors.orange,size: 20,),
             ),
             Container(
               child:
                 Text(StringLiteral.instant,
                 style: Style.instantStyle,)
             )
           ],
          ),
        );
  }

  //order data
  Widget _listOfOrders(_DashBoardModel data){
    return
        Expanded(
          child:
          Container(
            child:
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.orderList !=null ? data.orderList.data.orders.length : 0,
              reverse: false,
              itemBuilder: (context, index) {
                return
                  Container(
                    width: 200,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          elevation: 4,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: ScreenUtil.getInstance().setWidth(240),
                                  margin: EdgeInsets.fromLTRB(
                                      ScreenUtil.getInstance().setHeight(20),
                                      ScreenUtil.getInstance().setHeight(0),
                                      ScreenUtil.getInstance().setHeight(20),
                                      ScreenUtil.getInstance().setHeight(30)),
                                  child: Text(
                                    ",",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: AppColors.colorWhite,
                                        fontSize: ScreenUtil(allowFontScaling: true)
                                            .setSp(32)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
              },
            ),
          ),
        );
  }
}

class _DashBoardModel {
  final Store<AppState> store;
  final EarningMoneyResponse dataUpComing;
  final bool loader;
  final double tot;
  final OrderResponseModel orderList;

  _DashBoardModel(
      this.store, this.dataUpComing, this.loader, this.tot, this.orderList);

  factory _DashBoardModel.create(Store<AppState> store, BuildContext context) {
    double total = 0.0;
    if(store.state.earningMoneyResponse!=null) {
      total = store.state.earningMoneyResponse.data.cashSale +
          store.state.earningMoneyResponse.data.khataSale +
          store.state.earningMoneyResponse.data.onlineSale;
    }
    return _DashBoardModel(store, store.state.earningMoneyResponse, store.state.loader,total, store.state.responseOrders);
  }
}
