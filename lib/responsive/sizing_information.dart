import 'dart:ui';

import 'package:pjsp/enums/Device_screen_type.dart';

class SizingInformation{
   final DeviceScreenType deviceScreenType;
   final Size screenSize;
   final Size localWidgetSize;

   SizingInformation({
     this.deviceScreenType,
     this.screenSize,
     this.localWidgetSize
   });

   @override
   String toString(){
     return 'DeviceType:$deviceScreenType screenSize:$screenSize LocalWidgetSize';
   }
}