import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pjsp/modele/Fichier_visa_model.dart';
import 'package:pjsp/widget_list/Visa_fichier_list.dart';

class Solde_dossier_list extends StatelessWidget {
  final String id;
  final String nom;
  final List<Fichier_visa_model> fichier;

  const Solde_dossier_list({
    Key key,
    this.id,
    this.nom,
    this.fichier,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:10, right: 10, top: 8),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                  width: 34.0,
                  height: 34.0,
                  padding: EdgeInsets.only(top:6),
                  child: SvgPicture.string(
                  _svg_o4brcy,
                  allowDrawingOutsideViewBox: true,
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
                            const EdgeInsets.only(left: 15, top: 10),
                        child: Visa_fichier_list(
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

const String _svg_o4brcy =
    '<svg viewBox="13.0 18.0 12.6 14.7" ><path transform="translate(11.07, 15.35)" d="M 2.267979621887207 9.426718711853027 L 11.53020668029785 2.884708642959595 C 11.97675800323486 2.569288969039917 12.70114707946777 2.569288969039917 13.14770126342773 2.884708642959595 L 14.22809314727783 3.6478431224823 C 14.67416763305664 3.96292519569397 14.67464351654053 4.473252296447754 14.23000144958496 4.789007663726807 L 6.889322757720947 9.99797534942627 L 14.22952461242676 15.20727825164795 C 14.67464351654053 15.52303504943848 14.67369079589844 16.03336334228516 14.22761726379395 16.34844207763672 L 13.14722156524658 17.1115779876709 C 12.70067024230957 17.42700004577637 11.97627830505371 17.42700004577637 11.52972793579102 17.1115779876709 L 2.267979621887207 10.56923294067383 C 1.821428298950195 10.25381088256836 1.821428298950195 9.74213695526123 2.267979621887207 9.426718711853027 Z" fill="#e7e8ea" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
