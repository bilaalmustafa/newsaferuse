class PlaceAutocomplete {
  final String placeId;
  final String description;

  PlaceAutocomplete({required this.placeId, required this.description});

  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutocomplete(
      placeId: json['place_id'],
      description: json['description'],
    );
  }

  static List<PlaceAutocomplete> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => PlaceAutocomplete.fromJson(item)).toList();
  }
}
