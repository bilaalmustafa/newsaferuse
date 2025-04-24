import 'dart:convert';

import 'package:clinics_app/features/user/lacewatch/core/app_url.dart';
import 'package:clinics_app/features/user/lacewatch/model/place_autocomplete.dart';
import 'package:clinics_app/features/user/lacewatch/model/place_details.dart';
import 'package:http/http.dart' as http;

class Networkplacesservices {
  Future<List<PlaceAutocomplete>> getPlaces(String input) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=${Appkeys.key}";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PlaceAutocomplete.fromJsonList(data['predictions']);
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<PlaceDetails> getPlaceDetails(String placeId) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${Appkeys.key}";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PlaceDetails.fromJson(data);

    }else {
      throw Exception('Failed to load place details');
    }
  }
}
