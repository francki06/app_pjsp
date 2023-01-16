
import 'package:pjsp/modele/Fichier_sous_model.dart';

class Dossier_pension_model {
  String id;
  String nom;
  String soustitre;
  List<Fichier_sous_model> fichier;
  Dossier_pension_model(
      {this.id, this.nom,this.fichier, this.soustitre});

}
