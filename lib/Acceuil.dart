import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Acceuil extends StatelessWidget {
  Acceuil({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-18.3, -5.4),
            child: SvgPicture.string(
              _svg_etnxv4,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(119.0, 437.0),
            child: Text(
              'Piece Justificative',
              style: TextStyle(
                fontFamily: 'Verdana',
                fontSize: 20,
                color: const Color(0xffe7e8ea),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(123.0, 465.0),
            child: SizedBox(
              width: 168.0,
              child: Text(
                'Solde et Passion',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 17,
                  color: const Color(0xffe7e8ea),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(131.8, 304.4),
            child: SvgPicture.string(
              _svg_wswg92,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(141.0, 311.0),
            child: Text(
              'PJSP',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 62,
                color: const Color(0xffe7e8ea),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(141.0, 315.0),
            child: Text(
              'PJSP',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 62,
                color: const Color(0xff20494f),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_etnxv4 =
    '<svg viewBox="-18.3 -5.4 464.5 766.7" ><path transform="translate(-454.0, 43.0)" d="M 454 -43 C 458.58984375 -42.99158477783203 452.210693359375 -43.64849853515625 454 -43 C 459.6091003417969 -41.00354766845703 455.5275268554688 -55.59504699707031 454 -43 C 453.1665649414063 -40.13971710205078 453.6609497070313 -16.67890548706055 454 -14.08251476287842 C 454.8969116210938 -7.157187461853027 458.7972412109375 -25.28784561157227 454 -14.08251476287842 C 454.1611022949219 17.60313987731934 452.4007873535156 14.08251476287842 454 -14.08251476287842 C 461.7969665527344 -13.00381374359131 454.234619140625 -26.93465614318848 454 -24.64439964294434 C 453.343994140625 -17.39655303955078 452.4007873535156 21.12377166748047 454 31.6856575012207 C 455.7085571289063 31.53763008117676 558.6752319335938 12.96008110046387 661.9267578125 -5.671779632568359 C 764.6875610351563 -24.2150821685791 867.7332763671875 -42.81269454956055 869.5952758789063 -43 C 878.2005615234375 -43.86565017700195 863.138916015625 -42.31195831298828 869.5952758789063 -43 C 871.3555908203125 -40.48722839355469 886.3821411132813 -43.77526092529297 869.5952758789063 -43 C 843.2579956054688 -41.78387451171875 818.546142578125 -43 818.546142578125 -43 L 707.6463623046875 -43 L 454 -43 Z" fill="#ffa914" fill-opacity="0.02" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-454.0, 43.0)" d="M 575.622802734375 10.02409934997559 C 598.0945434570313 7.245332717895508 533.0259399414063 17.83506011962891 575.622802734375 10.02409934997559 C 857.2730712890625 -42.24754333496094 960.709228515625 -58.80859756469727 866.0746459960938 -42.24754333496094 C 895.6931762695313 -47.89389038085938 872.4769897460938 -43.08325958251953 866.0746459960938 -42.24754333496094 C 862.1229248046875 -41.73418045043945 882.674560546875 -47.2996940612793 866.0746459960938 -42.24754333496094 C 919.9957885742188 -54.23881912231445 866.0746459960938 -42.24754333496094 866.0746459960938 -42.24754333496094 L 866.0746459960938 -17.6031436920166 L 575.622802734375 10.02409934997559 L 575.622802734375 10.02409934997559 Z" fill="#0384c8" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-454.0, 43.0)" d="M 492.8880004882813 711 C 532.4423217773438 705.1204223632813 670.6797485351563 683.0116577148438 670.6797485351563 683.0116577148438 C 670.6797485351563 683.0116577148438 798.084716796875 664.0679931640625 867.8349609375 654.8369140625 C 872.5841674804688 654.2083740234375 865.2546997070313 655.2599487304688 867.8349609375 654.8369140625 C 884.4896850585938 652.1092529296875 851.0474853515625 654.3111572265625 867.8349609375 654.8369140625 C 873.5003662109375 655.0143432617188 867.8349609375 711 867.8349609375 711 C 867.8349609375 711 869.3851318359375 703.4151611328125 867.8349609375 711 C 866.0746459960938 689.876220703125 867.4889526367188 706.38037109375 867.8349609375 711 C 869.0752563476563 727.4257202148438 867.8349609375 711 867.8349609375 711 L 492.8880004882813 711 L 679.7390747070313 683.0116577148438 L 867.8349609375 654.8369140625 L 867.8349609375 642.5147094726563 L 867.8349609375 711 L 867.8349609375 711 L 492.8880004882813 711 Z" fill="#ffa914" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-454.0, 35.96)" d="M 452.4007568359375 684.7622680664063 C 452.4007568359375 684.7622680664063 414.9015502929688 682.6768188476563 452.4007568359375 684.7622680664063 C 468.6756591796875 685.6674194335938 550.5458984375 691.8035278320313 570.3418579101563 691.8035278320313 C 635.0333862304688 691.8035278320313 684.7622680664063 684.7622680664063 684.7622680664063 684.7622680664063 L 563.3005981445313 709.4066772460938 L 452.4007568359375 723.4891967773438 L 452.4007568359375 684.7622680664063 Z" fill="#0b65b3" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wswg92 =
    '<svg viewBox="131.8 304.4 147.0 112.7" ><path transform="translate(20.0, 58.0)" d="M 114.4204330444336 272.8487243652344 C 113.9810638427734 286.0298156738281 112.0084228515625 316.6937255859375 114.4204330444336 329.1787719726563 C 115.6368179321289 335.4848327636719 107.9488143920898 328.1390686035156 114.4204330444336 329.1787719726563 C 123.6971206665039 339.702392578125 186.5933227539063 357.3438110351563 186.5933227539063 359.1041259765625 C 186.5933227539063 357.3438110351563 186.5933227539063 359.1041259765625 186.5933227539063 359.1041259765625 L 210.1855316162109 349.3219909667969 L 258.7662048339844 329.1787719726563 L 258.7662048339844 272.8487243652344 L 186.5933227539063 246.4440002441406 L 114.4204330444336 272.8487243652344 Z" fill="#ffa914" fill-opacity="0.84" stroke="#ffa914" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
