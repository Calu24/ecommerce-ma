import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';

/// A client for interacting with the database.
class DbClient {
  /// Creates a new instance of [DbClient].
  ///
  /// If [firestore] is not provided, it will use
  /// the default Firestore instance.
  DbClient({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// The Firestore instance used by the client.
  final FirebaseFirestore _firestore;

  /// Adds a new record to the specified collection.
  ///
  /// Returns the ID of the newly created record.
  Future<String> add({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await _firestore.collection(collection).add(data);
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add record: $e');
    }
  }

  /// Fetches all records from the specified collection.
  ///
  /// Returns a list of [DbRecord] objects.
  Future<List<DbRecord>> fetchAll({
    required String collection,
  }) async {
    try {
      final colRef = await _firestore.collection(collection).get();
      final documents = colRef.docs;
      return documents
          .map((doc) => DbRecord(id: doc.id, data: doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch records: $e');
    }
  }
}
