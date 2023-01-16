import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pjsp/modele/Fichier_sous_model.dart';
import 'package:pjsp/widget_list/Pension_sous_fichier_list.dart';

class Pension_fichier_list extends StatelessWidget {
  final String id;
  final String nom;
  final List<Fichier_sous_model> fichier;
  const Pension_fichier_list({
    Key key,
    this.id,
    this.nom,
    this.fichier,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
      if(nom !=""){
      return 
     Expanded(
        child: Padding(
          padding: const EdgeInsets.only( right: 0, top: 8),
          child: Column(
            children: [
                Row(
                  children: <Widget>[
                   
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 1.7,
                      margin: EdgeInsets.only(left:10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            nom,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff20494f),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),    
                  ],
                ),
              
              Column(
                children: [
                   
                     Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: fichier.length == null
                        ? 0
                        : fichier.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(index);
                      return Padding(
                        padding:
                            const EdgeInsets.only( top: 10),
                        child: Pension_sous_fichier_list(
                          id:  fichier[index].id,
                          nom: fichier[index].nom,
                        ),
                      );
                    },
                  ),
            ),
                ],
              ),
            ],
          ),
        ),
      );
  
    }
     else {
    return  Expanded(
          child: Padding(
            padding: const EdgeInsets.only( right: 0, top: 8),
            child: Column(
              children: [
                
                Column(
                  children: [
                    Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: fichier.length == null
                          ? 0
                          : fichier.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(index);
                        return Padding(
                          padding:
                              const EdgeInsets.only( top: 10),
                          child: Pension_sous_fichier_list(
                            id: fichier[index].id,
                            nom: fichier[index].nom,
                          ),
                        );
                      },
                    ),
              ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
  }
}