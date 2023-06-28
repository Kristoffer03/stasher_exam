class StashpointsModel {
  StashpointsModel({
    required this.total,
    required this.page,
    required this.pages,
    required this.hasNext,
    required this.hasPrev,
    required this.items,
  });
  late final int total;
  late final int page;
  late final int pages;
  late final bool hasNext;
  late final bool hasPrev;
  late final List<Items> items;

  StashpointsModel.fromJson(Map<String, dynamic> json){
    total = json['total'];
    page = json['page'];
    pages = json['pages'];
    hasNext = json['has_next'];
    hasPrev = json['has_prev'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['page'] = page;
    _data['pages'] = pages;
    _data['has_next'] = hasNext;
    _data['has_prev'] = hasPrev;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.latitude,
    required this.features,
    this.deactivatedAt,
    required this.bagdayPrice,
    required this.name,
    required this.bookingFee,
    required this.locationName,
    required this.nearestCity,
    required this.countryCode,
    required this.hostId,
    required this.timezone,
    this.slug,
    required this.openTwentyfourSeven,
    required this.ratingCount,
    required this.openingHours,
    required this.address,
    this.upsellText,
    required this.id,
    required this.activatedAt,
    required this.pricingStructure,
    required this.postalCode,
    required this.photos,
    required this.openingHoursExceptions,
    required this.openLate,
    this.upsellPhoto,
    required this.type,
    this.upsellLink,
    required this.treePrice,
    required this.holidayOpenType,
    required this.featured,
    required this.longitude,
    required this.capacity,
    required this.created,
    required this.rating,
    this.description,
  });
  late final double latitude;
  late final Features features;
  late final Null deactivatedAt;
  late final int bagdayPrice;
  late final String name;
  late final int bookingFee;
  late final String locationName;
  late final NearestCity nearestCity;
  late final String countryCode;
  late final String hostId;
  late final String timezone;
  late final Null slug;
  late final bool openTwentyfourSeven;
  late final int ratingCount;
  late final List<OpeningHours> openingHours;
  late final String address;
  late final Null upsellText;
  late final String id;
  late final String activatedAt;
  late final PricingStructure pricingStructure;
  late final String postalCode;
  late final List<String> photos;
  late final List<OpeningHoursExceptions> openingHoursExceptions;
  late final bool openLate;
  late final String? upsellPhoto;
  late final String type;
  late final String? upsellLink;
  late final int treePrice;
  late final String holidayOpenType;
  late final bool featured;
  late final double longitude;
  late final int capacity;
  late final String created;
  late final double? rating;
  late final String? description;

  Items.fromJson(Map<String, dynamic> json){
    latitude = json['latitude'];
    features = Features.fromJson(json['features']);
    deactivatedAt = null;
    bagdayPrice = json['bagday_price'];
    name = json['name'];
    bookingFee = json['booking_fee'];
    locationName = json['location_name'];
    nearestCity = NearestCity.fromJson(json['nearest_city']);
    countryCode = json['country_code'];
    hostId = json['host_id'];
    timezone = json['timezone'];
    slug = null;
    openTwentyfourSeven = json['open_twentyfour_seven'];
    ratingCount = json['rating_count'];
    openingHours = List.from(json['opening_hours']).map((e)=>OpeningHours.fromJson(e)).toList();
    address = json['address'];
    upsellText = null;
    id = json['id'];
    activatedAt = json['activated_at'];
    pricingStructure = PricingStructure.fromJson(json['pricing_structure']);
    postalCode = json['postal_code'];
    photos = List.castFrom<dynamic, String>(json['photos']);
    openingHoursExceptions = List.from(json['opening_hours_exceptions']).map((e)=>OpeningHoursExceptions.fromJson(e)).toList();
    openLate = json['open_late'];
    upsellPhoto = null;
    type = json['type'];
    upsellLink = null;
    treePrice = json['tree_price'];
    holidayOpenType = json['holiday_open_type'];
    featured = json['featured'];
    longitude = json['longitude'];
    capacity = json['capacity'];
    created = json['created'];
    rating = json['rating'];
    description = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['features'] = features.toJson();
    _data['deactivated_at'] = deactivatedAt;
    _data['bagday_price'] = bagdayPrice;
    _data['name'] = name;
    _data['booking_fee'] = bookingFee;
    _data['location_name'] = locationName;
    _data['nearest_city'] = nearestCity.toJson();
    _data['country_code'] = countryCode;
    _data['host_id'] = hostId;
    _data['timezone'] = timezone;
    _data['slug'] = slug;
    _data['open_twentyfour_seven'] = openTwentyfourSeven;
    _data['rating_count'] = ratingCount;
    _data['opening_hours'] = openingHours.map((e)=>e.toJson()).toList();
    _data['address'] = address;
    _data['upsell_text'] = upsellText;
    _data['id'] = id;
    _data['activated_at'] = activatedAt;
    _data['pricing_structure'] = pricingStructure.toJson();
    _data['postal_code'] = postalCode;
    _data['photos'] = photos;
    _data['opening_hours_exceptions'] = openingHoursExceptions.map((e)=>e.toJson()).toList();
    _data['open_late'] = openLate;
    _data['upsell_photo'] = upsellPhoto;
    _data['type'] = type;
    _data['upsell_link'] = upsellLink;
    _data['tree_price'] = treePrice;
    _data['holiday_open_type'] = holidayOpenType;
    _data['featured'] = featured;
    _data['longitude'] = longitude;
    _data['capacity'] = capacity;
    _data['created'] = created;
    _data['rating'] = rating;
    _data['description'] = description;
    return _data;
  }
}

class Features {
  Features({
    required this.oftenFullyBooked,
    required this.premiumStashpoint,
  });
  late final bool oftenFullyBooked;
  late final bool premiumStashpoint;

  Features.fromJson(Map<String, dynamic> json){
    oftenFullyBooked = json['often_fully_booked'];
    premiumStashpoint = json['premium_stashpoint'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['often_fully_booked'] = oftenFullyBooked;
    _data['premium_stashpoint'] = premiumStashpoint;
    return _data;
  }
}

class NearestCity {
  NearestCity({
    required this.slug,
    this.partnerPromoPhoto,
    required this.parentId,
    required this.bbox,
    required this.name,
    required this.id,
    this.partnerPromoLink,
    this.partnerPromoText,
  });
  late final String slug;
  late final String? partnerPromoPhoto;
  late final String parentId;
  late final Bbox bbox;
  late final String name;
  late final String id;
  late final String? partnerPromoLink;
  late final String? partnerPromoText;

  NearestCity.fromJson(Map<String, dynamic> json){
    slug = json['slug'];
    partnerPromoPhoto = null;
    parentId = json['parent_id'];
    bbox = Bbox.fromJson(json['bbox']);
    name = json['name'];
    id = json['id'];
    partnerPromoLink = null;
    partnerPromoText = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['partner_promo_photo'] = partnerPromoPhoto;
    _data['parent_id'] = parentId;
    _data['bbox'] = bbox.toJson();
    _data['name'] = name;
    _data['id'] = id;
    _data['partner_promo_link'] = partnerPromoLink;
    _data['partner_promo_text'] = partnerPromoText;
    return _data;
  }
}

class Bbox {
  Bbox({
    required this.northeast,
    required this.southwest,
  });
  late final Northeast northeast;
  late final Southwest southwest;

  Bbox.fromJson(Map<String, dynamic> json){
    northeast = Northeast.fromJson(json['northeast']);
    southwest = Southwest.fromJson(json['southwest']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['northeast'] = northeast.toJson();
    _data['southwest'] = southwest.toJson();
    return _data;
  }
}

class Northeast {
  Northeast({
    required this.lat,
    required this.lng,
  });
  late final double lat;
  late final double lng;

  Northeast.fromJson(Map<String, dynamic> json){
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

class Southwest {
  Southwest({
    required this.lat,
    required this.lng,
  });
  late final double lat;
  late final double lng;

  Southwest.fromJson(Map<String, dynamic> json){
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

class OpeningHours {
  OpeningHours({
    required this.open,
    required this.day,
    required this.close,
  });
  late final String open;
  late final int day;
  late final String close;

  OpeningHours.fromJson(Map<String, dynamic> json){
    open = json['open'];
    day = json['day'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['open'] = open;
    _data['day'] = day;
    _data['close'] = close;
    return _data;
  }
}

class PricingStructure {
  PricingStructure({
    required this.ccy,
    required this.ccyMinorInMajor,
    required this.firstDayCost,
    required this.extraDayCost,
    required this.ccySymbol,
  });
  late final String ccy;
  late final int ccyMinorInMajor;
  late final int firstDayCost;
  late final int extraDayCost;
  late final String ccySymbol;

  PricingStructure.fromJson(Map<String, dynamic> json){
    ccy = json['ccy'];
    ccyMinorInMajor = json['ccy_minor_in_major'];
    firstDayCost = json['first_day_cost'];
    extraDayCost = json['extra_day_cost'];
    ccySymbol = json['ccy_symbol'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ccy'] = ccy;
    _data['ccy_minor_in_major'] = ccyMinorInMajor;
    _data['first_day_cost'] = firstDayCost;
    _data['extra_day_cost'] = extraDayCost;
    _data['ccy_symbol'] = ccySymbol;
    return _data;
  }
}

class OpeningHoursExceptions {
  OpeningHoursExceptions({
    required this.endTime,
    required this.startTime,
    required this.date,
    required this.name,
    required this.type,
  });
  late final String endTime;
  late final String startTime;
  late final String date;
  late final String name;
  late final String type;

  OpeningHoursExceptions.fromJson(Map<String, dynamic> json){
    endTime = json['end_time'];
    startTime = json['start_time'];
    date = json['date'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['end_time'] = endTime;
    _data['start_time'] = startTime;
    _data['date'] = date;
    _data['name'] = name;
    _data['type'] = type;
    return _data;
  }
}