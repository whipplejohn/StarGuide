// note object
class Stars {
  int _id = 0;
  String _starName = "";
  String _description = "";

  // Define Structure
  // to make a new object
  Stars(this._starName, [this._description])
  
  // Object for id's
  
  Stars(this._id, this._starName, [this._description])
  
  // getters
  
  int get id => _id;
  String get title => _starName;
  String get description => _description 
  
  //setters

  set title(String newTitle){
    if (newTitle.length != 0)
      this._starName = newTitle;
    else
      {print('enter a star name');
      }
  }

  set description(String newDescription){
    if (description.length != 0)
      this._description = description;
    else
      {print('enter a star name');
      }
  }
  // convert a not object into map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null){
      map['id'] = _id;
    }
    map['title'] = _starName;
    map['description'] = _description;
    return map;
  }
  //extraction
  Stars.fromMapObject(Map<String, dynamic> map){
    this._id - map ['id'];
    this._starName = map['title'];
    this._description = map['description'];
  }

}