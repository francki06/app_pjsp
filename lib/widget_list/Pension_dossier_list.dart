import 'package:flutter/material.dart';

class Pension_dossier_list extends StatelessWidget {
  final String id;
  final String nom;
  final String soustitre;
  final fichier;

  const Pension_dossier_list({
    Key key,
    this.id,
    this.nom,
    this.soustitre,
    this.fichier,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if ((nom != null && nom != "vide") &&
        (soustitre != null && soustitre != "vide")) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                nom + ": ",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff20494f),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                soustitre + " ",
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xff20494f),
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  fichier == null ? "- empty" : "- " + fichier + "; ",
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xff20494f),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      );
    } else if ((nom == null || nom == "vide") &&
        (soustitre != null && soustitre != "vide")) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                soustitre + " ",
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xff20494f),
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Text(
                  fichier == null ? "- empty" : "- " + fichier + "; ",
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xff20494f),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      );
    } else if ((nom != null && nom != "vide") &&
        (soustitre == "vide" || soustitre == null)) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                nom + ": ",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 14,
                  color: const Color(0xff20494f),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Text(
                  fichier == null ? "- empty" : "- " + fichier + "; ",
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xff20494f),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      );
    } else if ((nom == null || nom == "vide") &&
        (soustitre == "vide" || soustitre == null)) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 10, top: 8),
          child: Text(
            fichier == null ? "- empty" : "- " + fichier + "; ",
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 14,
              color: const Color(0xff20494f),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      );
    }
  }
}
