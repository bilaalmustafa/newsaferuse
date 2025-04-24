import 'package:clinics_app/features/user/lacewatch/core/services/firebase_services.dart';
import 'package:clinics_app/features/user/lacewatch/model/query_model.dart' show Query;


class QueriesService extends FirebaseService<Query> {
  QueriesService()
      : super(
          collectionName: "queries",
          fromJson: Query.fromJson,
          toJson: (drug) => drug.toJson(),
        );

  Future<List<Query>> getQueries() async {
    List<Query> queries = await getAll();
    return queries;
  }
}
