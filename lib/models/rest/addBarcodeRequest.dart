class addBarcodeRequest {
  String operationId;
  String userName;
  Document document;
  Data data;

  addBarcodeRequest(
      {this.operationId, this.userName, this.document, this.data});

  addBarcodeRequest.fromJson(Map<String, dynamic> json) {
    operationId = json['operationId'];
    userName = json['userName'];
    document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operationId'] = this.operationId;
    data['userName'] = this.userName;
    if (this.document != null) {
      data['document'] = this.document.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Document {
  String names;
  String lastNames;
  String number;
  String birthdate;
  String gender;

  Document(
      {this.names, this.lastNames, this.number, this.birthdate, this.gender});

  Document.fromJson(Map<String, dynamic> json) {
    names = json['names'];
    lastNames = json['lastNames'];
    number = json['number'];
    birthdate = json['birthdate'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['names'] = this.names;
    data['lastNames'] = this.lastNames;
    data['number'] = this.number;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    return data;
  }
}

class Data {
  int code;
  String message;
  DocumentIN document;

  Data({this.code, this.message, this.document});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    document = json['document'] != null
        ? new DocumentIN.fromJson(json['document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.document != null) {
      data['document'] = this.document.toJson();
    }
    return data;
  }
}

class DocumentIN {
  String dateOfIssue;
  String dateOfExpiry;
  Address address;

  DocumentIN({this.dateOfIssue, this.dateOfExpiry, this.address});

  DocumentIN.fromJson(Map<String, dynamic> json) {
    dateOfIssue = json['dateOfIssue'];
    dateOfExpiry = json['dateOfExpiry'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateOfIssue'] = this.dateOfIssue;
    data['dateOfExpiry'] = this.dateOfExpiry;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class Address {
  String street;
  String city;
  String state;
  String zipCode;
  String country;

  Address({this.street, this.city, this.state, this.zipCode, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    return data;
  }
}