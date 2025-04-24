
import 'package:clinics_app/features/user/lacewatch/core/services/firebase_services.dart';
import 'package:clinics_app/features/user/lacewatch/model/drag.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrugService extends FirebaseService<Drug> {
  DrugService()
      : super(
          collectionName: "drugs",
          fromJson: Drug.fromJson,
          toJson: (drug) => drug.toJson(),
        );

  Future<Drug?> getDrugById(String id) async {
    Drug? drug = await getById(id);
    if (drug != null) {
      return drug;
    }
    return null;
  }

  Future<List<Drug>> getDrugs() async {
    List<Drug> drugs = await getAll();
    return drugs;
  }

  Stream<List<Drug>> getDrugsStream(LatLng currentLatLng, {double radiusInKm = 5.0}) => getAllStream(currentLatLng, radiusInKm: radiusInKm);

  Future<bool> createDrug(String id, Drug item) async {
    return create(id, item);
  }

  updateDrug(String id, Drug item) {
    update(id, item);
  }

  deleteDrug(String id) {
    delete(id);
  }
}
