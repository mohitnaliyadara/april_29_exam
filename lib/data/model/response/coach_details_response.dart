// To parse this JSON data, do
//
//     final coachDetailsResponse = coachDetailsResponseFromJson(jsonString);

import 'dart:convert';

CoachDetailsResponse coachDetailsResponseFromJson(String str) =>
    CoachDetailsResponse.fromJson(json.decode(str));

String coachDetailsResponseToJson(CoachDetailsResponse data) =>
    json.encode(data.toJson());

class CoachDetailsResponse {
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? bio;
  final double? rating;
  final int? reviewsCount;
  final int? distanceKm;
  final int? followersCount;
  final int? studentsCount;
  final int? sessionsCount;
  final bool? isVerified;
  final List<String>? sports;
  final List<String>? coachingType;
  final List<String>? availableTimeSlots;
  final List<String>? availableLevelOfCoaching;
  final List<Location>? locations;
  final AvailableGroupSessions? availableGroupSessions;

  CoachDetailsResponse({
    this.id,
    this.name,
    this.imageUrl,
    this.bio,
    this.rating,
    this.reviewsCount,
    this.distanceKm,
    this.followersCount,
    this.studentsCount,
    this.sessionsCount,
    this.isVerified,
    this.sports,
    this.coachingType,
    this.availableTimeSlots,
    this.availableLevelOfCoaching,
    this.locations,
    this.availableGroupSessions,
  });

  CoachDetailsResponse copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? bio,
    double? rating,
    int? reviewsCount,
    int? distanceKm,
    int? followersCount,
    int? studentsCount,
    int? sessionsCount,
    bool? isVerified,
    List<String>? sports,
    List<String>? coachingType,
    List<String>? availableTimeSlots,
    List<String>? availableLevelOfCoaching,
    List<Location>? locations,
    AvailableGroupSessions? availableGroupSessions,
  }) => CoachDetailsResponse(
    id: id ?? this.id,
    name: name ?? this.name,
    imageUrl: imageUrl ?? this.imageUrl,
    bio: bio ?? this.bio,
    rating: rating ?? this.rating,
    reviewsCount: reviewsCount ?? this.reviewsCount,
    distanceKm: distanceKm ?? this.distanceKm,
    followersCount: followersCount ?? this.followersCount,
    studentsCount: studentsCount ?? this.studentsCount,
    sessionsCount: sessionsCount ?? this.sessionsCount,
    isVerified: isVerified ?? this.isVerified,
    sports: sports ?? this.sports,
    coachingType: coachingType ?? this.coachingType,
    availableTimeSlots: availableTimeSlots ?? this.availableTimeSlots,
    availableLevelOfCoaching:
        availableLevelOfCoaching ?? this.availableLevelOfCoaching,
    locations: locations ?? this.locations,
    availableGroupSessions:
        availableGroupSessions ?? this.availableGroupSessions,
  );

  factory CoachDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CoachDetailsResponse(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        bio: json["bio"],
        rating: json["rating"]?.toDouble(),
        reviewsCount: json["reviews_count"],
        distanceKm: json["distance_km"],
        followersCount: json["followers_count"],
        studentsCount: json["students_count"],
        sessionsCount: json["sessions_count"],
        isVerified: json["is_verified"],
        sports: json["sports"] == null
            ? []
            : List<String>.from(json["sports"]!.map((x) => x)),
        coachingType: json["coaching_type"] == null
            ? []
            : List<String>.from(json["coaching_type"]!.map((x) => x)),
        availableTimeSlots: json["available_time_slots"] == null
            ? []
            : List<String>.from(json["available_time_slots"]!.map((x) => x)),
        availableLevelOfCoaching: json["available_level_of_coaching"] == null
            ? []
            : List<String>.from(
                json["available_level_of_coaching"]!.map((x) => x),
              ),
        locations: json["locations"] == null
            ? []
            : List<Location>.from(
                json["locations"]!.map((x) => Location.fromJson(x)),
              ),
        availableGroupSessions: json["available_group_sessions"] == null
            ? null
            : AvailableGroupSessions.fromJson(json["available_group_sessions"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
    "bio": bio,
    "rating": rating,
    "reviews_count": reviewsCount,
    "distance_km": distanceKm,
    "followers_count": followersCount,
    "students_count": studentsCount,
    "sessions_count": sessionsCount,
    "is_verified": isVerified,
    "sports": sports == null ? [] : List<dynamic>.from(sports!.map((x) => x)),
    "coaching_type": coachingType == null
        ? []
        : List<dynamic>.from(coachingType!.map((x) => x)),
    "available_time_slots": availableTimeSlots == null
        ? []
        : List<dynamic>.from(availableTimeSlots!.map((x) => x)),
    "available_level_of_coaching": availableLevelOfCoaching == null
        ? []
        : List<dynamic>.from(availableLevelOfCoaching!.map((x) => x)),
    "locations": locations == null
        ? []
        : List<dynamic>.from(locations!.map((x) => x.toJson())),
    "available_group_sessions": availableGroupSessions?.toJson(),
  };
}

class AvailableGroupSessions {
  final String? sport;
  final String? timing;
  final String? gender;
  final String? levelOfCoaching;
  final String? location;
  final String? sessionsCount;
  final int? totalMembers;
  final int? availableMembers;
  final List<Member>? members;

  AvailableGroupSessions({
    this.sport,
    this.timing,
    this.gender,
    this.levelOfCoaching,
    this.location,
    this.sessionsCount,
    this.totalMembers,
    this.availableMembers,
    this.members,
  });

  AvailableGroupSessions copyWith({
    String? sport,
    String? timing,
    String? gender,
    String? levelOfCoaching,
    String? location,
    String? sessionsCount,
    int? totalMembers,
    int? availableMembers,
    List<Member>? members,
  }) => AvailableGroupSessions(
    sport: sport ?? this.sport,
    timing: timing ?? this.timing,
    gender: gender ?? this.gender,
    levelOfCoaching: levelOfCoaching ?? this.levelOfCoaching,
    location: location ?? this.location,
    sessionsCount: sessionsCount ?? this.sessionsCount,
    totalMembers: totalMembers ?? this.totalMembers,
    availableMembers: availableMembers ?? this.availableMembers,
    members: members ?? this.members,
  );

  factory AvailableGroupSessions.fromJson(Map<String, dynamic> json) =>
      AvailableGroupSessions(
        sport: json["sport"],
        timing: json["timing"],
        gender: json["gender"],
        levelOfCoaching: json["level_of_coaching"],
        location: json["location"],
        sessionsCount: json["sessions_count"],
        totalMembers: json["total_members"],
        availableMembers: json["available_members"],
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "sport": sport,
    "timing": timing,
    "gender": gender,
    "level_of_coaching": levelOfCoaching,
    "location": location,
    "sessions_count": sessionsCount,
    "total_members": totalMembers,
    "available_members": availableMembers,
    "members": members == null
        ? []
        : List<dynamic>.from(members!.map((x) => x.toJson())),
  };
}

class Member {
  final String? name;
  final String? imageUrl;
  final String? levelOfCoaching;

  Member({this.name, this.imageUrl, this.levelOfCoaching});

  Member copyWith({String? name, String? imageUrl, String? levelOfCoaching}) =>
      Member(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        levelOfCoaching: levelOfCoaching ?? this.levelOfCoaching,
      );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    name: json["name"],
    imageUrl: json["image_url"],
    levelOfCoaching: json["level_of_coaching"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "level_of_coaching": levelOfCoaching,
  };
}

class Location {
  final String? name;
  final String? imageUrl;
  final int? distanceKm;

  Location({this.name, this.imageUrl, this.distanceKm});

  Location copyWith({String? name, String? imageUrl, int? distanceKm}) =>
      Location(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        distanceKm: distanceKm ?? this.distanceKm,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    imageUrl: json["image_url"],
    distanceKm: json["distance_km"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "distance_km": distanceKm,
  };
}
