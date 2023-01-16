import 'Fichier_visa_model.dart';

class Dossier_visa_model {
  String id;
  String nom;
  List<Fichier_visa_model> fichier;
  Dossier_visa_model(
      {this.id, this.nom,fichier});
}
