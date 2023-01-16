import 'package:pjsp/modele/Fichier_sous_model.dart';

class Fichier_pension_model {
  String id;
  String nom;
  List<Fichier_sous_model> fichiersous;
  Fichier_pension_model(
      {this.id, this.nom,this.fichiersous});

}
