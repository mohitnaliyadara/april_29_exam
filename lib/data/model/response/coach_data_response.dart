// To parse this JSON data, do
//
//     final coacheDataResponse = coacheDataResponseFromJson(jsonString);

import 'dart:convert';

CoacheDataResponse coacheDataResponseFromJson(String str) => CoacheDataResponse.fromJson(json.decode(str));

String coacheDataResponseToJson(CoacheDataResponse data) => json.encode(data.toJson());

class CoacheDataResponse {
  final Filters? filters;
  final List<Coach>? topCoaches;
  final List<Coach>? otherCoaches;

  CoacheDataResponse({
    this.filters,
    this.topCoaches,
    this.otherCoaches,
  });

  CoacheDataResponse copyWith({
    Filters? filters,
    List<Coach>? topCoaches,
    List<Coach>? otherCoaches,
  }) =>
      CoacheDataResponse(
        filters: filters ?? this.filters,
        topCoaches: topCoaches ?? this.topCoaches,
        otherCoaches: otherCoaches ?? this.otherCoaches,
      );

  factory CoacheDataResponse.fromJson(Map<String, dynamic> json) => CoacheDataResponse(
    filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
    topCoaches: json["top_coaches"] == null ? [] : List<Coach>.from(json["top_coaches"]!.map((x) => Coach.fromJson(x))),
    otherCoaches: json["other_coaches"] == null ? [] : List<Coach>.from(json["other_coaches"]!.map((x) => Coach.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": filters?.toJson(),
    "top_coaches": topCoaches == null ? [] : List<dynamic>.from(topCoaches!.map((x) => x.toJson())),
    "other_coaches": otherCoaches == null ? [] : List<dynamic>.from(otherCoaches!.map((x) => x.toJson())),
  };
}

class Filters {
  final List<String>? sports;
  final List<String>? coachingTypes;
  final List<String>? distances;
  final List<String>? genders;
  final List<String>? languages;

  Filters({
    this.sports,
    this.coachingTypes,
    this.distances,
    this.genders,
    this.languages,
  });

  Filters copyWith({
    List<String>? sports,
    List<String>? coachingTypes,
    List<String>? distances,
    List<String>? genders,
    List<String>? languages,
  }) =>
      Filters(
        sports: sports ?? this.sports,
        coachingTypes: coachingTypes ?? this.coachingTypes,
        distances: distances ?? this.distances,
        genders: genders ?? this.genders,
        languages: languages ?? this.languages,
      );

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    sports: json["sports"] == null ? [] : List<String>.from(json["sports"]!.map((x) => sportValues.map[x]!)),
    coachingTypes: json["coaching_types"] == null ? [] : List<String>.from(json["coaching_types"]!.map((x) => x)),
    distances: json["distances"] == null ? [] : List<String>.from(json["distances"]!.map((x) => x)),
    genders: json["genders"] == null ? [] : List<String>.from(json["genders"]!.map((x) => x)),
    languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "sports": sports == null ? [] : List<dynamic>.from(sports!.map((x) => sportValues.reverse[x])),
    "coaching_types": coachingTypes == null ? [] : List<dynamic>.from(coachingTypes!.map((x) => x)),
    "distances": distances == null ? [] : List<dynamic>.from(distances!.map((x) => x)),
    "genders": genders == null ? [] : List<dynamic>.from(genders!.map((x) => x)),
    "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
  };
}


final sportValues = EnumValues({
  "Cricket": "Cricket",
  "Padel": "Padel",
  "Table Tennis": "Table Tennis"
});

class Coach {
  final int? id;
  final String? name;
  final String? sport;
  final String? imageUrl;
  final bool? isVerified;
  final double? rating;
  final int? reviewsCount;
  final int? distanceKm;
  final String? levelOfCoaching;

  Coach({
    this.id,
    this.name,
    this.sport,
    this.imageUrl,
    this.isVerified,
    this.rating,
    this.reviewsCount,
    this.distanceKm,
    this.levelOfCoaching,
  });

  Coach copyWith({
    int? id,
    String? name,
    String? sport,
    String? imageUrl,
    bool? isVerified,
    double? rating,
    int? reviewsCount,
    int? distanceKm,
    String? levelOfCoaching,
  }) =>
      Coach(
        id: id ?? this.id,
        name: name ?? this.name,
        sport: sport ?? this.sport,
        imageUrl: imageUrl ?? this.imageUrl,
        isVerified: isVerified ?? this.isVerified,
        rating: rating ?? this.rating,
        reviewsCount: reviewsCount ?? this.reviewsCount,
        distanceKm: distanceKm ?? this.distanceKm,
        levelOfCoaching: levelOfCoaching ?? this.levelOfCoaching,
      );

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    id: json["id"],
    name: json["name"],
    sport: sportValues.map[json["sport"]]!,
    imageUrl: json["image_url"],
    isVerified: json["is_verified"],
    rating: json["rating"]?.toDouble(),
    reviewsCount: json["reviews_count"],
    distanceKm: json["distance_km"],
    levelOfCoaching: json["level_of_coaching"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sport": sportValues.reverse[sport],
    "image_url": imageUrl,
    "is_verified": isVerified,
    "rating": rating,
    "reviews_count": reviewsCount,
    "distance_km": distanceKm,
    "level_of_coaching": levelOfCoaching,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
