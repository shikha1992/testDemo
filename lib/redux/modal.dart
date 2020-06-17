
class EarningMoneyResponse {
  Data data;

  EarningMoneyResponse({this.data});

  EarningMoneyResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  double onlineSale;
  double cashSale;
  double khataSale;

  Data({this.onlineSale, this.cashSale, this.khataSale});

  Data.fromJson(Map<String, dynamic> json) {
    onlineSale = json['onlineSale'];
    cashSale = json['cashSale'];
    khataSale = json['khataSale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onlineSale'] = this.onlineSale;
    data['cashSale'] = this.cashSale;
    data['khataSale'] = this.khataSale;
    return data;
  }
}