import 'package:flutter/material.dart';

import '../DetailSolde.dart';

class Solde_list extends StatelessWidget {
  final String id;
  final String nom;
  final String article;

  const Solde_list({
    Key key,
    this.id,
    this.nom,
    this.article,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailSolde(
                  id: this.id,
                  nom: this.nom,
                  article: this.article,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:10, right: 10, top: 8),
          child: Row(
            children: <Widget>[
              Container(
              width: 34.0,
              height: 34.0,
              padding: EdgeInsets.only(top:6),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xff5e6263),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                nom[0].toUpperCase() + nom[1].toUpperCase(),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            ),
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
      ),
    );
  }
}
