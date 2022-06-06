class User {
  int? _id;
  String? _name;
  String? _firstName;
  String? _password;
  String? _mail;

  User({id, name, firstName, password, mail}){
    this._id=id;
    this._name=name;
    this._firstName=firstName;
    this._password=password;
    this._mail=mail;
  }

  User.fromJson(Map<String, dynamic> json)
  : _id=json['id'],
        _name=json['name'],
        _firstName=json['firstName'],
        _password=json['password'],
        _mail=json['mail'];

  Map<String, dynamic> toJson()=>{
    'name':_name,
    'firstName': _firstName,
    'password':_password,
    'mail':_mail
  };

  int? getId(){
    return this._id;
  }

  void setId(int id){
    this._id=id;
  }

  String? getName(){
    return this._name;
  }
  void setName(String? name){
    this._name=name;
  }

  String? getFirstName(){
    return this._firstName;
  }
  void setFirstName(String? firstName){
    this._firstName=firstName;
  }

  String? getPassword(){
    return this._password;
  }
  void setPassword(String? password){
    this._password=password;
  }

  String? getMail(){
    return this._mail;
  }
  void setMail(String? mail){
    this._mail=mail;
  }

}