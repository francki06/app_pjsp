class Solde_model {
  int id;
  String nom;
  int type;
  String article;
  Solde_model({this.id, this.nom, this.type, this.article});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'n_nature': id,
      'libelle_nature': nom,
      'n_typedocuemnt': type,
      'text_article': article,
    };
    return map;
  }

  Solde_model.fromMap(Map<String, dynamic> map) {
    id = map['n_nature'];
    nom = map['libelle_nature'];
    type = map['n_typedocument'];
    article = map['text_article'];
  }
}
