class StashParamsModel {
  StashParamsModel(
      {this.lng,
      this.lat,
      this.placeId,
      this.name,
      this.dropOffTime,
      this.pickUpTime,
      this.capacity});

  final String? lng;
  final String? lat;
  final String? placeId;
  final String? name;
  final DateTime? dropOffTime;
  final DateTime? pickUpTime;
  final int? capacity;

  Map<String, dynamic> toJson() => {
    "dropoff": dropOffTime,
    "pickup": pickUpTime,
    "capacity": capacity,
    "lat": lat,
    "lng": lng,
  };
}
