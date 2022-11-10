//create table
final String tableStars = 'stars';

class StarFields {
  static final List<String> values = [
    id, name, description   /* add all fields */
  ];
  //representing all of our fields of our model objects
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

  //insert 
  Stars copy({
    int? id,
    String? name,
    String? description
  }) => 
      //copy of our current node object
      Stars(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description
      );

  static Stars fromJson(Map<String,Object?> json) => Stars(
      id: json[StarFields.id] as int?,
      name: json[StarFields.name] as String,
      description: json[StarFields.description] as String
      );

  Map<String, Object?> toJson() => {
    StarFields.id : id,
    StarFields.name : name, 
    StarFields.description : description
  };
}