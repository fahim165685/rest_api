class RsModel {
  String? status;
  int? statusCode;
  String? message;
  Data? data;

  RsModel({this.status, this.statusCode, this.message, this.data});

  RsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Orderinfo>? orderinfo;

  Data({this.orderinfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orderinfo'] != null) {
      orderinfo = <Orderinfo>[];
      json['orderinfo'].forEach((v) {
        orderinfo!.add(new Orderinfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderinfo != null) {
      data['orderinfo'] = this.orderinfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orderinfo {
  String? title;
  String? tokenNo;
  String? ordertime;
  String? orderdate;
  String? orderId;
  String? customerName;
  String? customerPhone;
  String? waiter;
  String? tableno;
  String? tableName;
  List<Kitcheninfo>? kitcheninfo;

  Orderinfo(
      {this.title,
        this.tokenNo,
        this.ordertime,
        this.orderdate,
        this.orderId,
        this.customerName,
        this.customerPhone,
        this.waiter,
        this.tableno,
        this.tableName,
        this.kitcheninfo});

  Orderinfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    tokenNo = json['token_no'];
    ordertime = json['ordertime'];
    orderdate = json['orderdate'];
    orderId = json['order_id'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    waiter = json['waiter'];
    tableno = json['tableno'];
    tableName = json['tableName'];
    if (json['kitcheninfo'] != null) {
      kitcheninfo = <Kitcheninfo>[];
      json['kitcheninfo'].forEach((v) {
        kitcheninfo!.add(new Kitcheninfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['token_no'] = this.tokenNo;
    data['ordertime'] = this.ordertime;
    data['orderdate'] = this.orderdate;
    data['order_id'] = this.orderId;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['waiter'] = this.waiter;
    data['tableno'] = this.tableno;
    data['tableName'] = this.tableName;
    if (this.kitcheninfo != null) {
      data['kitcheninfo'] = this.kitcheninfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kitcheninfo {
  String? kitchenName;
  String? ip;
  String? port;
  int? isitemexist;
  List<Iteminfo>? iteminfo;

  Kitcheninfo(
      {this.kitchenName, this.ip, this.port, this.isitemexist, this.iteminfo});

  Kitcheninfo.fromJson(Map<String, dynamic> json) {
    kitchenName = json['kitchenName'];
    ip = json['ip'];
    port = json['port'];
    isitemexist = json['isitemexist'];
    if (json['iteminfo'] != null) {
      iteminfo = <Iteminfo>[];
      json['iteminfo'].forEach((v) {
        iteminfo!.add(new Iteminfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kitchenName'] = this.kitchenName;
    data['ip'] = this.ip;
    data['port'] = this.port;
    data['isitemexist'] = this.isitemexist;
    if (this.iteminfo != null) {
      data['iteminfo'] = this.iteminfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Iteminfo {
  String? itemName;
  String? variantName;
  String? qty;
  String? notes;
  int? isaddons;
  List<Addonsinfo>? addonsinfo;

  Iteminfo(
      {this.itemName,
        this.variantName,
        this.qty,
        this.notes,
        this.isaddons,
        this.addonsinfo});

  Iteminfo.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    variantName = json['variantName'];
    qty = json['qty'];
    notes = json['notes'];
    isaddons = json['isaddons'];
    if (json['addonsinfo'] != null) {
      addonsinfo = <Addonsinfo>[];
      json['addonsinfo'].forEach((v) {
        addonsinfo!.add(new Addonsinfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    data['variantName'] = this.variantName;
    data['qty'] = this.qty;
    data['notes'] = this.notes;
    data['isaddons'] = this.isaddons;
    if (this.addonsinfo != null) {
      data['addonsinfo'] = this.addonsinfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addonsinfo {
  String? addOnsName;
  String? addOnsqty;

  Addonsinfo({this.addOnsName, this.addOnsqty});

  Addonsinfo.fromJson(Map<String, dynamic> json) {
    addOnsName = json['add_onsName'];
    addOnsqty = json['add_onsqty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_onsName'] = this.addOnsName;
    data['add_onsqty'] = this.addOnsqty;
    return data;
  }
}