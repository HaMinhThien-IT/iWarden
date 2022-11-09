class BaseModel {
  final int Id;
  final DateTime Created;
  final DateTime? Deleted;

  const BaseModel({
    required this.Id,
    required this.Created,
    this.Deleted,
  });
}
