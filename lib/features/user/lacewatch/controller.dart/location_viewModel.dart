import 'dart:async';
import 'dart:developer';
import 'package:clinics_app/features/user/lacewatch/model/place_autocomplete.dart';
import 'package:clinics_app/features/user/lacewatch/networkservices.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationViewmodel extends ChangeNotifier {
  final Networkplacesservices _networkplacesservices = Networkplacesservices();
  LatLng _currentLatLng = const LatLng(37.42796133580664, -122.085749655962);
  BitmapDescriptor customicon = BitmapDescriptor.defaultMarker;
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  GoogleMapController? _mapController;
  String _currentAddress = "Set Location";

  Set<Marker> _markers = {};
  List<PlaceAutocomplete> _places = [];
  List<PlaceAutocomplete> get places => _places;

  LatLng get currentLatLng => _currentLatLng;
  String get currentAddress => _currentAddress;
  Set<Marker> get markers => _markers;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  LocationViewmodel() {
    determinePosition();
    loadmarker();
  }

  Future<void> loadmarker() async {
    await BitmapDescriptor.asset(
            const ImageConfiguration(), "assets/images/pin.png")
        .then((icon) {
      customicon = icon;
    });
  }

  /// Function to request permission and get current location
  Future<void> determinePosition() async {
    _isSearching = true;
    log("Determining position...");
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      _isSearching = false;
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    _currentLatLng = LatLng(position.latitude, position.longitude);
    _markers = {
      Marker(
        markerId: const MarkerId("current_location"),
        position: _currentLatLng,
        infoWindow: const InfoWindow(title: "You are here"),
        icon: customicon,
      )
    };

    await _getAddressFromLatLng(position);

    notifyListeners();

    _moveToCurrentLocation();
  }

  /// Move camera to current location
  Future<void> _moveToCurrentLocation() async {
    _isSearching = true;
    if (_mapController != null) {
      _mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentLatLng, zoom: 15),
      ));
      _isSearching = false;
    }
    _isSearching = false;
  }

  /// Convert coordinates to a readable address
  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;

      _currentAddress = place.street ?? "Unknown Location";
      _isSearching = false;
      notifyListeners();
    } catch (e) {
      log("Error getting address: $e");
      _isSearching = false;
    }
  }

  /// 🔹 Fetch place suggestions
  Future<void> getPlaceSuggestions(String input) async {
    if (input.isEmpty) {
      _places.clear();

      return;
    }

    try {
      final suggestions = await _networkplacesservices.getPlaces(input);

      _places = suggestions;
    } catch (e) {
      print("Error fetching place suggestions: $e");
    }
    notifyListeners();
  }

  /// 🔹 Get Place Details and Move Map
  Future<void> selectPlace(String placeId) async {
    try {
      _isSearching = true;
      final details = await _networkplacesservices.getPlaceDetails(placeId);

      _currentLatLng = LatLng(details.lat, details.lng);
      log("lat: ${details.lat}, lng: ${details.lng}");
      _places.clear();
      _markers = {
        Marker(
          markerId: const MarkerId("selected_location"),
          position: _currentLatLng,
          infoWindow: const InfoWindow(title: "you are here"),
          icon: customicon,
        ),
      };

      if (_mapController != null) {
        _mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _currentLatLng, zoom: 15),
        ));
      }
      await _getAddressFromLatLng(Position(
        longitude: details.lng,
        latitude: details.lat,
        timestamp: DateTime.now(),
        accuracy: 1.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 1.0,
      ));
    } catch (e) {
      print("Error fetching place details: $e");
    }
    notifyListeners();
  }
}
