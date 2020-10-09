class MyModel{
  String _name;
  String _address;

  MyModel(this._name, this._address);

  MyModel.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _address = json['address'];


  String get address => _address;

  String get name => _name;
}