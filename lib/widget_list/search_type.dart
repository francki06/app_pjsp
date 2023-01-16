

import 'package:flutter/material.dart';

class Search_type extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
            );
  }
}
