class Piece_model {
  int id;
  String nom;
  int type;
  String nom_soustitre;
  int n_soustitre;
  String nom_titre;
  int n_titre;
  String nom_nature;
  int n_nature;
  int n_piece;
  String nom_piece;
  Piece_model(
      {this.id, this.nom,this.type, this.nom_soustitre, this.n_soustitre, this.nom_titre, this.n_titre, this.nom_nature, this.n_nature, this.n_piece, this.nom_piece});

   Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'n_piece' : id,
      'piece' : nom,
      'n_typepiece' : type, 
      'sous_titre' : nom_soustitre,
      'n_soustitre' : n_soustitre,
      'titre' : nom_titre,
      'libelle_nature' : nom_nature,
      'n_nature' : n_nature,
    };
    return map;
  }

  Piece_model.fromMap(Map<String, dynamic> map){
      id = map['n_piece'];
      nom = map['piece'];
      type = map['n_typepiece'];
      nom_soustitre = map['sous_titre'];
      n_soustitre = map['n_soustitre'];
      nom_titre = map['titre'];
      nom_nature = map['libelle_nature'];
      n_nature = map['n_nature'];
      n_piece = map['n_piece'];
      nom_piece = map['piece'];
  }
}