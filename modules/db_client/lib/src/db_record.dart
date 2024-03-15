/// Represents a database record.
class DbRecord {
  /// Constructs a DbRecord instance.
  DbRecord({
    required this.id,
    required this.data,
  });

  /// The ID of the record.
  final String id;

  /// The data of the record.
  final Map<String, dynamic> data;
}
