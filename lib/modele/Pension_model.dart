class Pension_model {
  int id;
  String nom;
  int type;
  Pension_model(
      {this.id, this.nom,this.type});

   Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'n_nature' : id,
      'libelle_nature' : nom,
      'n_typedocuemnt' : type, 
    };
    return map;
  }

  Pension_model.fromMap(Map<String, dynamic> map){
      id = map['n_nature'];
      nom = map['libelle_nature'];
      type = map['n_typedocument'];
  }
}
