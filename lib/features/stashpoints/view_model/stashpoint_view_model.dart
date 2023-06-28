import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stashpoints/features/stashpoints/model/place_details_model.dart';
import 'package:stashpoints/features/stashpoints/model/stash_params_model.dart';
import 'package:stashpoints/features/stashpoints/model/stashpoints_model.dart';

import '../../../utlities/api_status.dart';
import '../../../utlities/constants.dart';
import '../../../utlities/enum.dart';
import '../../../utlities/user_services.dart';
import '../model/autocomplete_model.dart';
import '../model/user_error.dart';

class StashpointViewModel extends ChangeNotifier {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _loading = false;
  int _skip = 0;
  UserError? _userError;
  AutoCompleteModel? _autoCompleteModel;
  StashParamsModel? _stashParamsModel;
  StashpointsModel? _stashpointsModel;
  PlaceDetailsModel? _placeDetailsModel;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  Map<String, dynamic> _params = {};

  Map<String, dynamic> get params => _params;

  PlaceDetailsModel? get placeDetailsModel => _placeDetailsModel;

  StashpointsModel? get stashpointsModel => _stashpointsModel;

  StashParamsModel? get stashParamsModel => _stashParamsModel;

  AutoCompleteModel? get autoCompleteModel => _autoCompleteModel;

  TextEditingController get phoneNumberController => _phoneNumberController;

  bool get loading => _loading;

  int get skip => _skip;

  UserError? get userError => _userError;

  DateTime? get selectedDate => _selectedDate;

  TimeOfDay? get selectedTime => _selectedTime;

  setSelectedDate(DateTime? selectedDate) {
    _selectedDate = selectedDate;
    notifyListeners();
  }

  setSelectedTime(TimeOfDay? selectedTime) {
    _selectedTime = selectedTime;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setAutoCompleteModel(AutoCompleteModel autoCompleteModel) {
    _autoCompleteModel = autoCompleteModel;
    notifyListeners();
  }

  setPlaceDetailsModel(PlaceDetailsModel placeDetailsModel) {
    _placeDetailsModel = placeDetailsModel;

    print("LATITUDE ${_placeDetailsModel?.result}");

    _params.containsKey("lat")
        ? _params["lat"] = _placeDetailsModel?.result.geometry.location.lat.toString()
        : _params.addAll({
            "lat": _placeDetailsModel?.result.geometry.location.lat.toString()
          });
    _params.containsKey("lng")
        ? _params["lng"] = _placeDetailsModel?.result.geometry.location.lng.toString()
        : _params.addAll({
            "lng": _placeDetailsModel?.result.geometry.location.lng.toString()
          });

    getStashpoints();
    notifyListeners();
  }

  setStashPointsModel(StashpointsModel stashpointsModel) {
    _stashpointsModel = stashpointsModel;
    notifyListeners();
  }

  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
        googleDomain, placeAutocompleteUrl, {'input': query, 'key': apiKey});
    final response = await UserServices.fetchAutocomplete(uri);

    if (response is Success) {
      setAutoCompleteModel(response.response as AutoCompleteModel);
    }

    if (response is Failure) {
      UserError userError = UserError(
          code: response.code ?? -1, errorResponse: response.errorResponse);
      setUserError(userError);
    }
  }

  void placeCoordinates(String placeId) async {
    Uri uri = Uri.https(googleDomain, placeCoordinatesUrl,
        {'place_id': placeId, 'key': apiKey});
    final response = await UserServices.fetchCoordinates(uri);

    if (response is Success) {
      setPlaceDetailsModel(response.response as PlaceDetailsModel);
    }

    if (response is Failure) {
      UserError userError = UserError(
          code: response.code ?? -1, errorResponse: response.errorResponse);
      setUserError(userError);
    }
  }

  void getStashpoints() async {
    setLoading(true);
    Uri uri = Uri.https(stasherDomain, stashpointUrl, _params);
    print("URI ${uri}");
    final response = await UserServices.fetchStashpoints(uri);
    setLoading(false);
    if (response is Success) {
      setStashPointsModel(response.response as StashpointsModel);
    }

    if (response is Failure) {
      UserError userError = UserError(
          code: response.code ?? -1, errorResponse: response.errorResponse);
      setUserError(userError);
    }
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  void updateStashParamsModel(StashParamsEnum paramEnum, dynamic value) {
    if (paramEnum == StashParamsEnum.pickup) {
      _params.containsKey("pickup")
          ? _params["pickup"] = value
          : _params.addAll({"pickup": value.toString()});
    }

    if (paramEnum == StashParamsEnum.dropoff) {
      _params.containsKey("dropoff")
          ? _params["dropoff"] = value
          : _params.addAll({"dropoff": value.toString()});
    }

    if (paramEnum == StashParamsEnum.capacity) {
      _params.containsKey("capacity")
          ? _params["capacity"] = value
          : _params.addAll({"capacity": value.toString()});
    }

    getStashpoints();
    notifyListeners();
  }
}
