import 'dart:developer';
import 'dart:io';

import 'package:clinics_app/features/user/lacewatch/core/config/console.dart';
import 'package:clinics_app/features/user/lacewatch/model/drag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class FirebaseService<T> {
  final String collectionName;
  final T Function(Map<String, dynamic> data) fromJson;
  final Map<String, dynamic> Function(T item) toJson;

  FirebaseService({
    required this.collectionName,
    required this.fromJson,
    required this.toJson,
  });

  Future<bool> create(String id, T item) async {
    try {
      
      await FirebaseFirestore.instance.collection(collectionName).doc(id).set(toJson(item));
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to Store ${T.runtimeType}: $e");
      throw Exception('Error creating document: $e');
    }
  }

  Future<void> update(String id, T item) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).doc(id).update(toJson(item));
    } catch (e) {
      throw Exception('Error updating document: $e');
    }
  }

  Future<T?> getById(String id) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching document: $e');
    }
  }

  Future<List<T>> getAll() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();
      return querySnapshot.docs.map((doc) => fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      console(e, type: DebugType.error);
      throw Exception('Error fetching all documents: $e');
    }
  }

 Stream<List<T>> getAllStream(LatLng currentLatLng, {double radiusInKm = 5.0}) {
  return FirebaseFirestore.instance
      .collection(collectionName)
      .snapshots()
      .map((snapshot) {
        return snapshot.docs
            .map((doc) => fromJson(doc.data())) // Convert Firestore data to model
            .where((post) {
              if (post is! Drug) return false;
              if (post.lat == null || post.long == null) return false; // Skip if lat/long is missing

              double distance = Geolocator.distanceBetween(
                currentLatLng.latitude, currentLatLng.longitude, 
                post.lat!, post.long!
              ) / 1000; // Convert meters to km

              return distance <= radiusInKm; // Filter posts within the radius
            })
            .toList();
      });
}


  Future<void> delete(String id) async {
    try {
      if (await _exist(id)) {
        await FirebaseFirestore.instance.collection(collectionName).doc(id).delete();
      } else {
        throw Exception("Document Doesn't Exist");
      }
    } catch (e) {
      throw Exception('Error deleting document: $e');
    }
  }

  Future<String?> uploadImage(File image, String uploadPath) async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref('/images').child(uploadPath);
      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  Future<bool> _exist(String id) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(collectionName).doc(id).get();
    return snapshot.exists;
  }
}
