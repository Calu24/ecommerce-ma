import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_client/src/db_record.dart';
import 'package:http/http.dart' as http;

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

  /// Fetches all records from bundle.
  Future<List<DbRecord>> fetchAllFromBundle({
    required String bundleId,
    required String bundleUrl,
  }) async {
    final response = await http.get(Uri.parse('$bundleUrl/$bundleId'));
    final buffer = Uint8List.fromList(response.body.codeUnits);
    final task = _firestore.loadBundle(buffer);

    task.stream.listen((state) {
      if (state.taskState == LoadBundleTaskState.success) {
        log('Bundle loaded successfully');
      }
    });

    await task.stream.last;

    final querySnap = _firestore
        .collection(bundleId)
        .get(const GetOptions(source: Source.cache));

    return querySnap.then(
      (querySnap) => querySnap.docs
          .map((doc) => DbRecord(id: doc.id, data: doc.data()))
          .toList(),
    );
  }

  /// Streams all records from the specified collection.
  Stream<List<DbRecord>> streamAll({
    required String collection,
  }) {
    final query = _firestore.collection(collection);
    return query.snapshots().map(
          (querySnap) => querySnap.docs
              .map((doc) => DbRecord(id: doc.id, data: doc.data()))
              .toList(),
        );
  }

  /// Streams all records from the specified collection where the field
  Stream<List<DbRecord>> streamAllByField({
    required String collection,
    required String field,
    required dynamic value,
  }) {
    final query =
        _firestore.collection(collection).where(field, isEqualTo: value);
    return query.snapshots().map(
          (querySnap) => querySnap.docs
              .map((doc) => DbRecord(id: doc.id, data: doc.data()))
              .toList(),
        );
  }
}
