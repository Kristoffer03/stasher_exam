import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:stashpoints/features/stashpoints/model/stashpoints_model.dart';
import '../features/stashpoints/model/autocomplete_model.dart';
import '../features/stashpoints/model/place_details_model.dart';
import 'api_status.dart';
import 'constants.dart';

class UserServices {
  static Future<Object>? fetchAutocomplete(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        return Success(response: AutoCompleteModel.fromJson(jsonDecode(response.body)));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

  static Future<Object>? fetchCoordinates(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return Success(response: PlaceDetailsModel.fromJson(jsonDecode(response.body)));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

  static Future<Object>? fetchStashpoints(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        return Success(response: StashpointsModel.fromJson(jsonDecode(response.body)));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
