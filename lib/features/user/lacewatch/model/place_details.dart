class PlaceDetails {
  final double lat;
  final double lng;

  PlaceDetails({required this.lat, required this.lng});

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      lat: json['result']['geometry']['location']['lat'],
      lng: json['result']['geometry']['location']['lng'],
    );
  }
}
