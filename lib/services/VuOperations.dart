import 'dart:convert';

import 'package:flutter_app_eccomerce/models/rest/ApiResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/newOperationRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/newOperationResponse.dart';
import 'package:http/http.dart' as http;

class VuOperations{
    static const API= 'https://integration.onboarding.api.vusecurity.com/vu-onboarding-rest';
    static const headers ={
      'x-access-apikey':'db2305df-e2c0-4987-9b14-f84a177e6b10',
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


}