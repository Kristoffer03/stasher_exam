class PlaceDetailsModel {
  PlaceDetailsModel({
    required this.htmlAttributions,
    required this.result,
    required this.status,
  });
  late final List<dynamic> htmlAttributions;
  late final Result result;
  late final String status;

  PlaceDetailsModel.fromJson(Map<String, dynamic> json){
    htmlAttributions = List.castFrom<dynamic, dynamic>(json['html_attributions']);
    result = Result.fromJson(json['result']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['html_attributions'] = htmlAttributions;
    _data['result'] = result.toJson();
    _data['status'] = status;
    return _data;
  }
}

class Result {
  Result({
    required this.geometry,
    required this.name,
    required this.placeId,
  });

  late final Geometry geometry;
  late final String name;
  late final String placeId;


  Result.fromJson(Map<String, dynamic> json){

    geometry = Geometry.fromJson(json['geometry']);
    name = json['name'];
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['geometry'] = geometry.toJson();
    _data['name'] = name;
    _data['place_id'] = placeId;
    return _data;
  }
}

class Geometry {
  Geometry({
    required this.location,
  });

  late final Location location;

  Geometry.fromJson(Map<String, dynamic> json){
    location = Location.fromJson(json['location']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });
  late final double lat;
  late final double lng;

  Location.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}
