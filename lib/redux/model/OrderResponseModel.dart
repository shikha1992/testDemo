class OrderResponseModel {
  String message;
  Data data;

  OrderResponseModel({this.message, this.data});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Orders> orders;
  int totalAmount;
  int totalOrder;

  Data({this.orders, this.totalAmount, this.totalOrder});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    totalOrder = json['totalOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = this.totalAmount;
    data['totalOrder'] = this.totalOrder;
    return data;
  }
}

class Orders {
  String createdOn;
  String modifiedOn;
  int createdBy;
  int modifiedBy;
  int id;
  Customer customer;
  Vendor vendor;
  List<Products> products;
  int vendorId;
  int customerId;
  String orderType;
  Payment payment;
  Amount amount;
  bool khata;
  String mode;
  String status;
  Time time;
  bool pack;
  bool testOrder;
  bool scheduled;
  String fulfillmentDate;
  String paymentSlipUrl;
  int delayTime;

  Orders(
      {this.createdOn,
        this.modifiedOn,
        this.createdBy,
        this.modifiedBy,
        this.id,
        this.customer,
        this.vendor,
        this.products,
        this.vendorId,
        this.customerId,
        this.orderType,
        this.payment,
        this.amount,
        this.khata,
        this.mode,
        this.status,
        this.time,
        this.pack,
        this.testOrder,
        this.scheduled,
        this.fulfillmentDate,
        this.paymentSlipUrl,
        this.delayTime});

  Orders.fromJson(Map<String, dynamic> json) {
    createdOn = json['createdOn'];
    modifiedOn = json['modifiedOn'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    id = json['id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    vendorId = json['vendorId'];
    customerId = json['customerId'];
    orderType = json['orderType'];
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    amount =
    json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
    khata = json['khata'];
    mode = json['mode'];
    status = json['status'];
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    pack = json['pack'];
    testOrder = json['testOrder'];
    scheduled = json['scheduled'];
    fulfillmentDate = json['fulfillmentDate'];
    paymentSlipUrl = json['paymentSlipUrl'];
    delayTime = json['delayTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdOn'] = this.createdOn;
    data['modifiedOn'] = this.modifiedOn;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['id'] = this.id;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['vendorId'] = this.vendorId;
    data['customerId'] = this.customerId;
    data['orderType'] = this.orderType;
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    data['khata'] = this.khata;
    data['mode'] = this.mode;
    data['status'] = this.status;
    if (this.time != null) {
      data['time'] = this.time.toJson();
    }
    data['pack'] = this.pack;
    data['testOrder'] = this.testOrder;
    data['scheduled'] = this.scheduled;
    data['fulfillmentDate'] = this.fulfillmentDate;
    data['paymentSlipUrl'] = this.paymentSlipUrl;
    data['delayTime'] = this.delayTime;
    return data;
  }
}

class Customer {
  int id;
  String name;
  String mobile;
  String countryCode;
  bool testUser;
  Address address;
  String nickName;

  Customer(
      {this.id,
        this.name,
        this.mobile,
        this.countryCode,
        this.testUser,
        this.address,
        this.nickName});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    testUser = json['testUser'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    nickName = json['nickName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['testUser'] = this.testUser;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['nickName'] = this.nickName;
    return data;
  }
}

class Address {
  String saveAs;
  String landmark;
  String address1;
  String address2;
  String pincode;
  String city;
  String uuid;

  Address(
      {this.saveAs,
        this.landmark,
        this.address1,
        this.address2,
        this.pincode,
        this.city,
        this.uuid});

  Address.fromJson(Map<String, dynamic> json) {
    saveAs = json['saveAs'];
    landmark = json['landmark'];
    address1 = json['address1'];
    address2 = json['address2'];
    pincode = json['pincode'];
    city = json['city'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saveAs'] = this.saveAs;
    data['landmark'] = this.landmark;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['uuid'] = this.uuid;
    return data;
  }
}

class Vendor {
  int id;
  String name;
  String mobile;
  String businessName;
  String businessImage;
  String businessImageUrl;
  String category;
  Address address;
  MiniMarket miniMarket;
  DeliveryConfig deliveryConfig;
  Delivery delivery;
  bool testUser;

  Vendor(
      {this.id,
        this.name,
        this.mobile,
        this.businessName,
        this.businessImage,
        this.businessImageUrl,
        this.category,
        this.address,
        this.miniMarket,
        this.deliveryConfig,
        this.delivery,
        this.testUser});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    businessName = json['businessName'];
    businessImage = json['businessImage'];
    businessImageUrl = json['businessImageUrl'];
    category = json['category'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    miniMarket = json['miniMarket'] != null
        ? new MiniMarket.fromJson(json['miniMarket'])
        : null;
    deliveryConfig = json['deliveryConfig'] != null
        ? new DeliveryConfig.fromJson(json['deliveryConfig'])
        : null;
    delivery = json['delivery'] != null
        ? new Delivery.fromJson(json['delivery'])
        : null;
    testUser = json['testUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['businessName'] = this.businessName;
    data['businessImage'] = this.businessImage;
    data['businessImageUrl'] = this.businessImageUrl;
    data['category'] = this.category;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.miniMarket != null) {
      data['miniMarket'] = this.miniMarket.toJson();
    }
    if (this.deliveryConfig != null) {
      data['deliveryConfig'] = this.deliveryConfig.toJson();
    }
    if (this.delivery != null) {
      data['delivery'] = this.delivery.toJson();
    }
    data['testUser'] = this.testUser;
    return data;
  }
}



class Location {
  String type;
  List<double> coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class MiniMarket {
  int id;
  String name;
  Address address;
  bool active;
  List<String> alias;

  MiniMarket({this.id, this.name, this.address, this.active, this.alias});

  MiniMarket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    active = json['active'];
    alias = json['alias'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['active'] = this.active;
    data['alias'] = this.alias;
    return data;
  }
}



class DeliveryConfig {
  int deliveryTime;
  int maxDistance;
  int minAmount;
  List<Charges> charges;

  DeliveryConfig(
      {this.deliveryTime, this.maxDistance, this.minAmount, this.charges});

  DeliveryConfig.fromJson(Map<String, dynamic> json) {
    deliveryTime = json['deliveryTime'];
    maxDistance = json['maxDistance'];
    minAmount = json['minAmount'];
    if (json['charges'] != null) {
      charges = new List<Charges>();
      json['charges'].forEach((v) {
        charges.add(new Charges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryTime'] = this.deliveryTime;
    data['maxDistance'] = this.maxDistance;
    data['minAmount'] = this.minAmount;
    if (this.charges != null) {
      data['charges'] = this.charges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Charges {
  int amountUpto;
  int deliveryCharge;

  Charges({this.amountUpto, this.deliveryCharge});

  Charges.fromJson(Map<String, dynamic> json) {
    amountUpto = json['amountUpto'];
    deliveryCharge = json['deliveryCharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountUpto'] = this.amountUpto;
    data['deliveryCharge'] = this.deliveryCharge;
    return data;
  }
}

class Delivery {
  int maxDistance;
  int minAmount;
  List<Charges> charges;

  Delivery({this.maxDistance, this.minAmount, this.charges});

  Delivery.fromJson(Map<String, dynamic> json) {
    maxDistance = json['maxDistance'];
    minAmount = json['minAmount'];
    if (json['charges'] != null) {
      charges = new List<Charges>();
      json['charges'].forEach((v) {
        charges.add(new Charges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxDistance'] = this.maxDistance;
    data['minAmount'] = this.minAmount;
    if (this.charges != null) {
      data['charges'] = this.charges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String name;
  String description;
  String image;
  bool veg;
  List<Units> units;
  Category category;

  Products(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.veg,
        this.units,
        this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    veg = json['veg'];
    if (json['units'] != null) {
      units = new List<Units>();
      json['units'].forEach((v) {
        units.add(new Units.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['veg'] = this.veg;
    if (this.units != null) {
      data['units'] = this.units.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Units {
  String type;
  String unit;
  int value;
  int price;
  int quantity;
  int happyHourPrice;

  Units(
      {this.type,
        this.unit,
        this.value,
        this.price,
        this.quantity,
        this.happyHourPrice});

  Units.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    unit = json['unit'];
    value = json['value'];
    price = json['price'];
    quantity = json['quantity'];
    happyHourPrice = json['happyHourPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['unit'] = this.unit;
    data['value'] = this.value;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['happyHourPrice'] = this.happyHourPrice;
    return data;
  }
}

class Category {
  String name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Payment {
  String mode;
  int amount;
  bool paid;
  String time;

  Payment({this.mode, this.amount, this.paid, this.time});

  Payment.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    amount = json['amount'];
    paid = json['paid'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    data['amount'] = this.amount;
    data['paid'] = this.paid;
    data['time'] = this.time;
    return data;
  }
}

class Amount {
  int sellingPrice;
  int price;
  int deliveryFee;

  Amount({this.sellingPrice, this.price, this.deliveryFee});

  Amount.fromJson(Map<String, dynamic> json) {
    sellingPrice = json['sellingPrice'];
    price = json['price'];
    deliveryFee = json['deliveryFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellingPrice'] = this.sellingPrice;
    data['price'] = this.price;
    data['deliveryFee'] = this.deliveryFee;
    return data;
  }
}

class Time {
  String estimatePreparationTime;
  String actualPreparationTime;
  String acceptTime;
  String actualDeliverTime;
  String estimateDeliveryTime;

  Time(
      {this.estimatePreparationTime,
        this.actualPreparationTime,
        this.acceptTime,
        this.actualDeliverTime,
        this.estimateDeliveryTime});

  Time.fromJson(Map<String, dynamic> json) {
    estimatePreparationTime = json['estimatePreparationTime'];
    actualPreparationTime = json['actualPreparationTime'];
    acceptTime = json['acceptTime'];
    actualDeliverTime = json['actualDeliverTime'];
    estimateDeliveryTime = json['estimateDeliveryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estimatePreparationTime'] = this.estimatePreparationTime;
    data['actualPreparationTime'] = this.actualPreparationTime;
    data['acceptTime'] = this.acceptTime;
    data['actualDeliverTime'] = this.actualDeliverTime;
    data['estimateDeliveryTime'] = this.estimateDeliveryTime;
    return data;
  }
}