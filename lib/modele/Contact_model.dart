
class Contact_model {
  int id;
  String nom;
  String telephone;
  int type;
  Contact_model(
      {this.id, this.nom, this.telephone, this.type});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'n_service' : id,
      'nom_service' : nom,
      'telephone' : telephone,
      'type' : type, 
    };
    return map;
  }

  Contact_model.fromMap(Map<String, dynamic> map){
      id = map['n_service'];
      nom = map['nom_service'];
      telephone = map['telephone'];
      type = map['type'];
  }

}
