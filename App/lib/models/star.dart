//Created model class

// note object
class Stars {
  int _id;
  String _starName; //known as title
  String _description;

  // Define contructor to make a new star object
  Stars(this._starName, [this._description]);

  // constructor that accepts id as varible (Object for id's)
  Stars.withId(this._id, this._starName, [this._description]);

  // getters
  int get id => _id;
  String get title => _starName;
  String get description => _description;

  //setters

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._starName = newTitle;
    }
  }

  set description(String newDescription) {
    if (description.length <= 255) {
      this._description = newDescription;
    }
  }

  // convert a not object into map object (dynamic to handle int and strings)
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    //the key
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _starName;
    map['description'] = _description;

    return map;
  }

  //extract a note object from a map object
  Stars.fromMapObject(Map<String, dynamic> map) {
    this._id - map['id'];
    this._starName = map['title'];
    this._description = map['description'];
  }
}
