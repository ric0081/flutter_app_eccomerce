import 'dart:convert';

import 'package:flutter_app_eccomerce/models/rest/ApiResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/Register.dart';
import 'package:flutter_app_eccomerce/models/rest/addBackRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addBackResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/addBarcodeRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addBarcodeResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/endOperationRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/endOperationResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/loginRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/loginResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/newOperationRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/newOperationResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/registerResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/scanBarcodeRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/scanBarcodeResponse.dart';
import 'package:http/http.dart' as http;

class VuOperations{
//    static const API= 'https://integration.onboarding.api.vusecurity.com/vu-onboarding-rest';
    static const API= 'https://jupiter.preventa.vusecurity.com/vu-onboarding-rest/';


    static const headers ={
//      'x-access-apikey':'db2305df-e2c0-4987-9b14-f84a177e6b10',
      'x-access-apikey':'7b7b57d6-0a7e-4136-a942-e9d121e7c304',


      'Content-Type':'application/json',
    };

    Future<APIResponse<newOperationResponse>> addOperation(newOperationRequest item) {
      return http.post(API+'/onboarding/newOperation',headers:headers,body: json.encode(item.toJson())).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          return APIResponse<newOperationResponse>(data: newOperationResponse.fromJson(jsonData));
        }
        return APIResponse<newOperationResponse>(error: true, errorMessage: 'An error occured');
      }).catchError((_) => APIResponse<newOperationResponse>(error: true, errorMessage: 'An error occured'));
    }


    Future<APIResponse<addFrontResponse>> addFront(addFrontRequest item) {
      return http.post(API+'/onboarding/addFront',headers:headers,body: json.encode(item.toJson())).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          return APIResponse<addFrontResponse>(data: addFrontResponse.fromJson(jsonData));
        }
        return APIResponse<addFrontResponse>(error: true, errorMessage: 'An error occured');
      }).catchError((_) => APIResponse<addFrontResponse>(error: true, errorMessage: 'An error occured'));
    }

    Future<APIResponse<addBackResponse>> addBack(addBackRequest item) {
      return http.post(API+'/onboarding/addBack',headers:headers,body: json.encode(item.toJson())).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          return APIResponse<addBackResponse>(data: addBackResponse.fromJson(jsonData));
        }
        return APIResponse<addBackResponse>(error: true, errorMessage: 'An error occured');
      }).catchError((_) => APIResponse<addBackResponse>(error: true, errorMessage: 'An error occured'));
    }
/*
    Future<APIResponse<registerResponse>> register(registerRequest item) {
      print(item.toJson().toString());
      return http.post(API+'/onboarding/register',headers:headers,body: json.encode(item.toJson())).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          return APIResponse<registerResponse>(data: registerResponse.fromJson(jsonData));
        }
        return APIResponse<registerResponse>(error: true, errorMessage: 'An error occured');
      }).catchError((_) => APIResponse<registerResponse>(error: true, errorMessage: 'An error occured'));
    }
*/
    Future<APIResponse<registerResponse>> register(Register item) {
      print(item.toJson().toString());
      return http.post(API+'/onboarding/register',headers:headers,body: json.encode(item.toJson())).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          return APIResponse<registerResponse>(data: registerResponse.fromJson(jsonData));
        }
        return APIResponse<registerResponse>(error: true, errorMessage: 'An error occured');
      }).catchError((_) => APIResponse<registerResponse>(error: true, errorMessage: 'An error occured'));
    }

  Future<APIResponse<endOperationResponse>> endOperation(endOperationRequest item) {
    print(item.toJson().toString());
    return http.post(API+'/onboarding/endOperation',headers:headers,body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<endOperationResponse>(data: endOperationResponse.fromJson(jsonData));
      }
      return APIResponse<endOperationResponse>(error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<endOperationResponse>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<loginResponse>> Login(loginRequest item) {
    print(item.toJson().toString());
    return http.post(API+'/face/login',headers:headers,body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<loginResponse>(data: loginResponse.fromJson(jsonData));
      }
      return APIResponse<loginResponse>(error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<loginResponse>(error: true, errorMessage: 'An error occured'));
  }


  Future<APIResponse<scanBarcodeResponse>> scanBarcode(scanBarcodeRequest item) {
    print(item.toJson().toString());
    return http.post(API+'/barcode/scan/document',headers:headers,body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<scanBarcodeResponse>(data: scanBarcodeResponse.fromJson(jsonData));
      }
      return APIResponse<scanBarcodeResponse>(error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<scanBarcodeResponse>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<addBarcodeResponse>> addBarcode(addBarcodeRequest item) {
    print(item.toJson().toString());
    return http.post(API+'/onboarding/addBarcode',headers:headers,body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<addBarcodeResponse>(data: addBarcodeResponse.fromJson(jsonData));
      }
      return APIResponse<addBarcodeResponse>(error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<addBarcodeResponse>(error: true, errorMessage: 'An error occured'));
  }

}