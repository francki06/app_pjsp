import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoldeSearch extends StatelessWidget {
  SoldeSearch({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 154.0),
            child: Container(
              width: 415.0,
              height: 600.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: const Color(0xffe7e8ea),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 697.0),
            child: SvgPicture.string(
              _svg_i9kk5i,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(308.0, 676.0),
            child: Container(
              width: 51.0,
              height: 49.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffe7e8ea),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 19,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(320.4, 689.5),
            child: SvgPicture.string(
              _svg_xg08yw,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(53.0, 702.0),
            child:
                // Adobe XD layer: 'retraite' (shape)
                Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(32.8, 730.0),
            child: SizedBox(
              width: 74.0,
              child: Text(
                'Pension',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 16,
                  color: const Color(0xff20494f),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(146.6, 730.0),
            child: SizedBox(
              width: 101.0,
              child: Text(
                'Recherche',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 16,
                  color: const Color(0xff20494f),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(307.6, 730.0),
            child: SizedBox(
              width: 53.0,
              child: Text(
                'Solde',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 16,
                  color: const Color(0xff20494f),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 414.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: const Color(0x00ffffff),
            ),
          ),
          Transform.translate(
            offset: Offset(368.0, 11.0),
            child: SvgPicture.string(
              _svg_ayskct,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 202.0),
            child: Text(
              'Reclassement d\'un \nfonctionnaire',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 262.0),
            child: Text(
              'Ajoration d\'indice d\'un \nELD',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 316.0),
            child: Text(
              'Renouvellement de contrat',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 361.5),
            child: SvgPicture.string(
              _svg_oxitp5,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 201.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 262.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 313.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 202.0),
            child: Text(
              'RE',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 263.0),
            child: Text(
              'AJ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 314.0),
            child: Text(
              'RE',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 260.5),
            child: SvgPicture.string(
              _svg_e6ir8y,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 367.0),
            child: Text(
              'Annulation d\'avenant',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 417.5),
            child: SvgPicture.string(
              _svg_fyr1ll,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 363.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(31.0, 366.0),
            child: Text(
              'AN',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 424.0),
            child: Text(
              'Indemnité compensatrice\nde congé non pris',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 473.5),
            child: SvgPicture.string(
              _svg_88n4gp,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 421.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(36.0, 422.0),
            child: Text(
              'ID',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 213.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 273.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 324.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 373.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 433.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 484.0),
            child: Text(
              'Affectation d\'un fonctionnaire\nEFA/ELD',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 532.5),
            child: SvgPicture.string(
              _svg_diry3d,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 481.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 482.0),
            child: Text(
              'AF',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 496.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 540.0),
            child: Text(
              'En disponibilité sans solde',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 585.5),
            child: SvgPicture.string(
              _svg_8g8krr,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 537.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(32.0, 538.0),
            child: Text(
              'EN',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 542.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 597.0),
            child: Text(
              'Reintegration après suspension\nde fonction',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xff20494f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(70.5, 641.5),
            child: SvgPicture.string(
              _svg_rl5x47,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 594.0),
            child: Container(
              width: 42.0,
              height: 37.0,
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
            ),
          ),
          Transform.translate(
            offset: Offset(33.0, 595.0),
            child: Text(
              'RE',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xffffa914),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(343.0, 599.0),
            child: Text(
              '>',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 414.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: const Color(0x00ffffff),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 83.0),
            child: Container(
              width: 352.0,
              height: 51.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xffe7e8ea),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29e7e8ea),
                    offset: Offset(0, 1),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 94.0),
            child: SvgPicture.string(
              _svg_rixttm,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(88.0, 94.0),
            child: Text(
              'Nature ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff5e6263),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(53.0, 12.0),
            child: Text(
              'Solde',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xfff9f9f9),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(9.4, 16.5),
            child: SvgPicture.string(
              _svg_dof3yj,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_i9kk5i =
    '<svg viewBox="0.0 697.0 415.0 57.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="19"/></filter></defs><path transform="translate(500.0, 1471.0)" d="M -84.99960327148438 -716.999267578125 L -84.99960327148438 -717.0003662109375 L -500.0003967285156 -717.0003662109375 L -500.0003967285156 -774 L -196.8519439697266 -774.0000610351563 C -196.9499053955078 -773.0133666992188 -197.0001068115234 -772.0044555664063 -197.0001068115234 -771.0003051757813 C -197.0001068115234 -754.4578857421875 -183.5422973632813 -740.9996337890625 -167.0003967285156 -740.9996337890625 C -150.4579925537109 -740.9996337890625 -136.9998016357422 -754.4578857421875 -136.9998016357422 -771.0003051757813 C -136.9998016357422 -772.0006713867188 -137.0496520996094 -773.010009765625 -137.14794921875 -774.0000610351563 L -84.99960327148438 -774.0000610351563 L -84.99960327148438 -717.0003051757813 L -84.99960327148438 -716.999267578125 Z" fill="#e7e8ea" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/><path transform="translate(178.0, 702.5)" d="M 28.60560989379883 24.20779037475586 L 22.95812225341797 18.75597953796387 C 22.70322036743164 18.50991249084473 22.35768890380859 18.37320518493652 21.99516105651855 18.37320518493652 L 21.07185554504395 18.37320518493652 C 22.63524627685547 16.44292640686035 23.56422233581543 14.01503658294678 23.56422233581543 11.37388896942139 C 23.56422233581543 5.090909004211426 18.29059791564941 0 11.78211116790771 0 C 5.273626804351807 0 -2.80492447046754e-08 5.090909004211426 -2.80492447046754e-08 11.37388896942139 C -2.80492447046754e-08 14.90490055084229 1.665621995925903 18.05940818786621 4.472634792327881 20.29583358764648 C 6.317535400390625 21.77109909057617 8.931371688842773 22.74777793884277 11.78211116790771 22.74777793884277 C 14.5180549621582 22.74777793884277 17.03307914733887 21.85099029541016 19.03264236450195 20.34176445007324 L 19.03264236450195 21.23307991027832 C 19.03264236450195 21.58304595947266 19.17425155639648 21.9166088104248 19.42915534973145 22.16267776489258 L 25.07663917541504 27.61448860168457 C 25.60909843444824 28.12850189208984 26.47010040283203 28.12850189208984 26.99689292907715 27.61448860168457 L 28.59994316101074 26.06698226928711 C 29.13240242004395 25.55297088623047 29.13240242004395 24.72179985046387 28.60560989379883 24.20779037475586 Z M 11.78211116790771 18.37320518493652 C 7.777326583862305 18.37320518493652 4.531581878662109 15.24538516998291 4.531581878662109 11.37388896942139 C 4.531581878662109 7.507859706878662 7.771663188934326 4.37457275390625 11.78211116790771 4.37457275390625 C 15.78689765930176 4.37457275390625 19.03264236450195 7.502393245697021 19.03264236450195 11.37388896942139 C 19.03264236450195 15.23991870880127 15.79255962371826 18.37320518493652 11.78211116790771 18.37320518493652 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xg08yw =
    '<svg viewBox="320.4 689.5 27.0 22.0" ><path transform="translate(317.4, 683.5)" d="M 27.30000114440918 6 L 5.699999809265137 6 C 4.201499938964844 6 3.013499736785889 7.223750114440918 3.013499736785889 8.750000953674316 L 2.999999761581421 25.25 C 2.999999761581421 26.7762508392334 4.201499938964844 28 5.699999809265137 28 L 27.30000114440918 28 C 28.79850196838379 28 30.00000190734863 26.7762508392334 30.00000190734863 25.25 L 30.00000190734863 8.750000953674316 C 30.00000190734863 7.223750114440918 28.79850196838379 6 27.30000114440918 6 Z M 27.30000114440918 25.25 L 5.699999809265137 25.25 L 5.699999809265137 17 L 27.30000114440918 17 L 27.30000114440918 25.25 Z M 27.30000114440918 11.50000095367432 L 5.699999809265137 11.50000095367432 L 5.699999809265137 8.750000953674316 L 27.30000114440918 8.750000953674316 L 27.30000114440918 11.50000095367432 Z" fill="#20494f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ayskct =
    '<svg viewBox="368.0 11.0 27.0 29.0" ><path transform="translate(368.0, 11.0)" d="M 26.6328067779541 25.07235336303711 L 21.37480354309082 19.42583465576172 C 21.13748359680176 19.17098045349121 20.81578063964844 19.02939033508301 20.47825622558594 19.02939033508301 L 19.61862182617188 19.02939033508301 C 21.07419776916504 17.03017234802246 21.93910598754883 14.5155725479126 21.93910598754883 11.7800989151001 C 21.93910598754883 5.272727012634277 17.0291748046875 0 10.96955299377441 0 C 4.909928798675537 0 -2.804924292831856e-08 5.272727012634277 -2.804924292831856e-08 11.7800989151001 C -2.804924292831856e-08 18.2874698638916 4.909929275512695 23.5601978302002 10.96955299377441 23.5601978302002 C 13.51680755615234 23.5601978302002 15.85838794708252 22.63138198852539 17.72004890441895 21.0682544708252 L 17.72004890441895 21.99140357971191 C 17.72004890441895 22.35386848449707 17.85189056396484 22.69934463500977 18.08921051025391 22.95420074462891 L 23.34721755981445 28.6007194519043 C 23.84295654296875 29.13309097290039 24.64457893371582 29.13309097290039 25.13504028320313 28.6007194519043 L 26.62753105163574 26.99794387817383 C 27.1232738494873 26.465576171875 27.1232738494873 25.60472106933594 26.6328067779541 25.07235336303711 Z M 10.96955299377441 19.02939033508301 C 7.240959644317627 19.02939033508301 4.219058990478516 15.78986263275146 4.219058990478516 11.7800989151001 C 4.219058990478516 7.775997161865234 7.235686779022217 4.530807495117188 10.96955299377441 4.530807495117188 C 14.69814300537109 4.530807495117188 17.72004890441895 7.770335674285889 17.72004890441895 11.7800989151001 C 17.72004890441895 15.78420066833496 14.70342063903809 19.02939033508301 10.96955299377441 19.02939033508301 Z" fill="#fff1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oxitp5 =
    '<svg viewBox="70.5 361.5 311.0 3.0" ><path transform="translate(70.5, 361.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e6ir8y =
    '<svg viewBox="70.5 260.5 311.0 54.0" ><path transform="translate(70.5, 311.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(70.5, 260.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fyr1ll =
    '<svg viewBox="70.5 417.5 311.0 3.0" ><path transform="translate(70.5, 417.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_88n4gp =
    '<svg viewBox="70.5 473.5 311.0 3.0" ><path transform="translate(70.5, 473.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_diry3d =
    '<svg viewBox="70.5 532.5 311.0 3.0" ><path transform="translate(70.5, 532.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_8g8krr =
    '<svg viewBox="70.5 585.5 311.0 3.0" ><path transform="translate(70.5, 585.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rl5x47 =
    '<svg viewBox="70.5 641.5 311.0 3.0" ><path transform="translate(70.5, 641.5)" d="M 0 0 L 311 3" fill="none" stroke="#5e6263" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rixttm =
    '<svg viewBox="42.0 94.0 27.0 28.0" ><path transform="translate(42.0, 94.0)" d="M 26.63280868530273 24.20779037475586 L 21.37480354309082 18.7559757232666 C 21.13748168945313 18.50991249084473 20.81578063964844 18.37320518493652 20.4782543182373 18.37320518493652 L 19.61862182617188 18.37320518493652 C 21.07419586181641 16.44292259216309 21.9391040802002 14.01503658294678 21.9391040802002 11.37388896942139 C 21.9391040802002 5.090909004211426 17.02917289733887 0 10.9695520401001 0 C 4.909928798675537 0 -2.804924292831856e-08 5.090909004211426 -2.804924292831856e-08 11.37388896942139 C -2.804924292831856e-08 17.65686988830566 4.909929275512695 22.74777793884277 10.9695520401001 22.74777793884277 C 13.51680850982666 22.74777793884277 15.8583869934082 21.85099029541016 17.72004699707031 20.34176063537598 L 17.72004699707031 21.23307991027832 C 17.72004699707031 21.58304595947266 17.85189056396484 21.91661071777344 18.08921051025391 22.16267395019531 L 23.34721565246582 27.61448860168457 C 23.84295463562012 28.12850189208984 24.64457893371582 28.12850189208984 25.13504028320313 27.61448860168457 L 26.62752914428711 26.06698226928711 C 27.1232738494873 25.55297088623047 27.1232738494873 24.7218017578125 26.63280868530273 24.20779037475586 Z M 10.9695520401001 18.37320518493652 C 7.240960121154785 18.37320518493652 4.219059467315674 15.24538516998291 4.219059467315674 11.37388896942139 C 4.219059467315674 7.507860660552979 7.235687255859375 4.374573230743408 10.9695520401001 4.374573230743408 C 14.69814205169678 4.374573230743408 17.72004699707031 7.502394199371338 17.72004699707031 11.37388896942139 C 17.72004699707031 15.2399206161499 14.70342063903809 18.37320518493652 10.9695520401001 18.37320518493652 Z" fill="#5e6263" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dof3yj =
    '<svg viewBox="9.4 16.5 27.0 22.0" ><path transform="translate(6.4, 10.5)" d="M 27.30000114440918 6 L 5.699999809265137 6 C 4.201499938964844 6 3.013499736785889 7.223750114440918 3.013499736785889 8.750000953674316 L 2.999999761581421 25.25 C 2.999999761581421 26.7762508392334 4.201499938964844 28 5.699999809265137 28 L 27.30000114440918 28 C 28.79850196838379 28 30.00000190734863 26.7762508392334 30.00000190734863 25.25 L 30.00000190734863 8.750000953674316 C 30.00000190734863 7.223750114440918 28.79850196838379 6 27.30000114440918 6 Z M 27.30000114440918 25.25 L 5.699999809265137 25.25 L 5.699999809265137 17 L 27.30000114440918 17 L 27.30000114440918 25.25 Z M 27.30000114440918 11.50000095367432 L 5.699999809265137 11.50000095367432 L 5.699999809265137 8.750000953674316 L 27.30000114440918 8.750000953674316 L 27.30000114440918 11.50000095367432 Z" fill="#e7e8ea" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
