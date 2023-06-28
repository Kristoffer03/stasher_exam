class AutoCompleteModel {
  AutoCompleteModel({
    required this.predictions,
    required this.status,
  });
  late final List<Predictions> predictions;
  late final String status;

  AutoCompleteModel.fromJson(Map<String, dynamic> json){
    predictions = List.from(json['predictions']).map((e)=>Predictions.fromJson(e)).toList();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['predictions'] = predictions.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    return _data;
  }
}

class Predictions {
  Predictions({
    required this.description,
    required this.placeId,
    required this.reference,
    required this.types,
  });
  late final String description;
  late final String placeId;
  late final String reference;
  late final List<String> types;

  Predictions.fromJson(Map<String, dynamic> json){
    description = json['description'];
    placeId = json['place_id'];
    reference = json['reference'];
    types = List.castFrom<dynamic, String>(json['types']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['place_id'] = placeId;
    _data['reference'] = reference;
    _data['types'] = types;
    return _data;
  }
}