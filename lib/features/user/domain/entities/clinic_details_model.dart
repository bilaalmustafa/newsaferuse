
class ClinicDetailsModel {

  String? id;
  List<dynamic>? serviceCategory;
  String? title;
  String? clinicDescription;
  String? address;
  String? mobileNumber;
  double? lat;
  double? long;
  List<dynamic>? clinicImages;
  int? date;
  int? fromMinute;
  int? fromHour;
  int? toHour;
  int? toMinute;
  String? website;

  ClinicDetailsModel({
    this.id,
    this.serviceCategory,
    this.title,
    this.clinicDescription,
    this.address,
    this.fromHour,
    this.fromMinute,
    this.toHour,
    this.toMinute,
    this.mobileNumber,
    this.lat,
    this.long,
    this.clinicImages,
    this.date,
    this.website,
  });


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['serviceCategory'] = clinicImages == null ? [] : List<dynamic>.from(serviceCategory!.map((x) => x));;
    map['title'] = title;
    map['clinicDescription'] = clinicDescription;
    map['address'] = address;
    map['fromHour'] = fromHour;
    map['fromMinute'] = fromMinute;
    map['toHour'] = toHour;
    map['toMinute'] = toMinute;
    map['mobileNumber'] = mobileNumber;
    map['lat'] = lat;
    map['long'] = long;
    map["clinicImages"] =  clinicImages == null ? [] : List<dynamic>.from(clinicImages!.map((x) => x));
    map['clinicImages'] = clinicImages;
    map['date'] =date ;
    map['website'] =website ;

    return map;
  }

  ClinicDetailsModel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    serviceCategory = map['serviceCategory'];
    title = map['title'];
    clinicDescription = map['clinicDescription'];
    address = map['address'];
    fromHour = map['fromHour'];
    fromMinute = map['fromMinute'];
    toHour = map['toHour'];
    toMinute = map['toMinute'];
    mobileNumber = map['mobileNumber'];
    lat = map['lat'];
    long = map['long'];
    clinicImages = map['clinicImages'];
    date = map['date'];
    website = map['website'];
  }

  ClinicDetailsModel? copyWith({
    String? id,
    List<String>? serviceCategory,
    String? title,
    String? clinicDescription,
    String? address,
    int? fromMinute,
    int? fromHour,
    int? toHour,
    int? toMinute,
    String? mobileNumber,
    double? lat,
    double? long,
    List<String>? clinicImages,
    int? date,
    String? website,

  }) =>
      ClinicDetailsModel(
        id: id??this.id,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        title: title ?? this.title,
        clinicDescription: clinicDescription ?? this.clinicDescription,
        address: address ?? this.address,
        fromHour: fromHour ?? this.fromHour,
        fromMinute: fromMinute ?? this.fromMinute,
        toHour: toHour ?? this.toHour,
        toMinute: toMinute ?? this.toMinute,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        clinicImages: clinicImages?? this.clinicImages,
        date: date?? this.date,
        website: website?? this.website,
      );

}











