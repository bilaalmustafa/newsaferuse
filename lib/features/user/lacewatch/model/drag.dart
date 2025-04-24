import 'package:clinics_app/features/user/lacewatch/model/postQuery.dart';
import 'package:clinics_app/features/user/lacewatch/model/user.dart';


class Drug {
  final String? drugName;
  final String? drugSynonyms;
  final int? drugRisk;
  final String? drugImage;
  final double? lat;
  final double? long;
  final String? address;
  final bool? isVerified;
  final User? user;
  final List<PostQuery>? queries;
  final int? queOne;
  final int? queTwo;
  final int? createdAt;
  final int? id;

  Drug({
    this.drugName,
    this.drugSynonyms,
    this.drugRisk,
    this.drugImage,
    this.lat,
    this.long,
    this.address,
    this.isVerified,
    this.user,
    this.queries,
    this.queOne,
    this.queTwo,
    this.createdAt,
    this.id,
  });

  Drug copyWith(
          {String? drugName,
          String? drugSynonyms,
          int? drugRisk,
          String? drugImage,
          double? lat,
          double? long,
          String? address,
          bool? isVerified,
          User? user,
          List<PostQuery>? queries,
          int? queOne,
          int? queTwo,
          int? createdAt,
          int? id}) =>
      Drug(
          drugName: drugName ?? this.drugName,
          drugSynonyms: drugSynonyms ?? this.drugSynonyms,
          drugRisk: drugRisk ?? this.drugRisk,
          drugImage: drugImage ?? this.drugImage,
          lat: lat ?? this.lat,
          long: long ?? this.long,
          address: address ?? this.address,
          isVerified: isVerified ?? this.isVerified,
          user: user ?? this.user,
          queries: queries ?? this.queries,
          queOne: queOne ?? this.queOne,
          queTwo: queTwo ?? this.queTwo,
          createdAt: createdAt ?? this.createdAt,
          id: id ?? this.id);

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
        drugName: json["drug_name"],
        drugSynonyms: json["drug_synonyms"],
        drugRisk: json["drug_risk"],
        drugImage: json["drug_image"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        address: json["address"],
        isVerified: json["is_verified"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        queOne: json["que_one"],
        queTwo: json["que_two"],
        queries: json["queries"] == null
            ? []
            : List<PostQuery>.from(
                json["queries"]!.map((x) => PostQuery.fromJson(x))),
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "drug_name": drugName,
        "drug_synonyms": drugSynonyms,
        "drug_risk": drugRisk,
        "drug_image": drugImage,
        "lat": lat,
        "long": long,
        "address": address,
        "is_verified": isVerified,
        "user": user?.toJson(),
        "que_one": queOne,
        "que_two": queTwo,
        "queries": queries == null
            ? []
            : List<dynamic>.from(queries!.map((x) => x.toJson())),
        "created_at": createdAt,
        "id": id,
      };
}
