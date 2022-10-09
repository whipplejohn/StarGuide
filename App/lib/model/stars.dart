//create table
final String tableStars = 'stars';

class StarFields {
  static final String id = '_id';
  static final String name = 'name';
  static final String description = 'description';
}

class Stars{
  final int? id;
  final String name;
  final String description;

  const Stars({
    this.id,
    required this.name,
    required this.description
  });
}