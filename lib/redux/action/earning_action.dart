import 'package:flutter/cupertino.dart';

import '../modal.dart';

//action for upcoming movie list
class GetEarningAction {
  BuildContext contextUpComing;

  GetEarningAction(this.contextUpComing);
}

//reposnse fetched
class EarningApiResponseAction {
  EarningMoneyResponse responseUpComing;

  EarningApiResponseAction(this.responseUpComing);
}


//for loading screen init
class LoaderAction {
  bool loader;

  LoaderAction(this.loader);
}