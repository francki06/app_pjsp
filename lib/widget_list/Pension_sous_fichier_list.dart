import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pension_sous_fichier_list extends StatelessWidget {
  final String id;
  final String nom;

  const Pension_sous_fichier_list({
    Key key,
    this.id,
    this.nom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0), 
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:10, right: 10, top: 8),
          child: Row(
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
                        color: const Color(0xff20494f),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),    
            ],
          ),
        ),
      );
  }
}