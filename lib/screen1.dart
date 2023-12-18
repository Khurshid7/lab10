import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCustomCard(title: 'fade in', content: 'Custom card that fades in',),
         Align(
             alignment: Alignment.bottomRight,
             child: ElevatedButton(
               onPressed: () {
                 Navigator.push(
                   context,
                 PageRouteBuilder(
                 pageBuilder: (context, animation, secondaryAnimation) => Screen2(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
                 }
                 ),
                 );
                 },
               child: Text('Screen 2'),
             ),
           ),
        ],
      ),
    );
  }
}
