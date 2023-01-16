import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Solde_fichier_list extends StatelessWidget {
  final String id;
  final String nom;

  const Solde_fichier_list({
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
              width: 34.0,
              height: 34.0,
              padding: EdgeInsets.only(top:6),
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 16.0, 20.0),
                    size: Size(16.0, 20.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_qb1kx3,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(5.5, 0.0, 10.5, 10.5),
                    size: Size(16.0, 20.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_vvry2v,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
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
      );
  }
}
const String _svg_qb1kx3 =
    '<svg viewBox="6.0 3.0 16.0 20.0" ><path transform="translate(0.0, 0.0)" d="M 14.99999809265137 3.000000476837158 L 8.000001907348633 3.000000476837158 C 6.895430088043213 3.000000476837158 6.000000953674316 3.895431280136108 6.000000953674316 5.000001430511475 L 6.000000953674316 20.99999809265137 C 6.000000953674316 22.10456275939941 6.895431041717529 23 8.000001907348633 23 L 20.00000190734863 23 C 21.10457229614258 23 22.00000190734863 22.10456275939941 22.00000190734863 20.99999809265137 L 22.00000190734863 10 L 14.99999809265137 3.000000476837158 Z" fill="none" stroke="#20494f" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_vvry2v =
    '<svg viewBox="11.5 3.0 10.5 10.5" ><path transform="translate(-8.0, 0.0)" d="M 19.5 3 L 19.5 13.5 L 30 13.5" fill="none" stroke="#20494f" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" /></svg>';
