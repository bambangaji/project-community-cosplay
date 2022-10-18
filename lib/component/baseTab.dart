// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomTabBar {
//   AnimationController? _animationController;
//   Tween<double>? _positionTween;
//   Animation<double>? _positionAnimation;

//   AnimationController? _fadeOutController;
//   Animation<double>? _fadeFabOutAnimation;
//   Animation<double>? _fadeFabInAnimation;

//   List<String>? labels;
//   Map<String, IconData>? icons;

//   get tabAmount => icons!.keys.length;
//   get index => labels!.indexOf(selectedTab!);
//   get position {
//     double pace = 2 / (labels!.length - 1);
//     return (pace * index) - 1;
//   }

//   double? fabIconAlpha = 1;
//   IconData? activeIcon;
//   String? selectedTab;

//     Widget customTabBar(){
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: <Widget>[
//         Container(
//           height: 55,
//           //margin: EdgeInsets.only(top: 45),
//           decoration: BoxDecoration(color: Colors.white, boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               offset: Offset(0, -1),
//               blurRadius: 5,
//             ),
//           ]),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: generateTabItems(),
//           ),
//         ),
//         IgnorePointer(
//           child: Container(
//             decoration: BoxDecoration(color: Colors.transparent),
//             child: Align(
//               heightFactor: 0,
//               alignment: Alignment(_positionAnimation!.value, 0),
//               child: FractionallySizedBox(
//                 widthFactor: 1 / tabAmount,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 50,
//                       width: 90,
//                       child: ClipRect(
//                         clipper: HalfClipper(),
//                         child: Container(
//                           child: Center(
//                             child: Container(
//                               width: 70,
//                               height: 70,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 8,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 60,
//                       width: 90,
//                       child: CustomPaint(painter: HalfPainter()),
//                     ),
//                     SizedBox(
//                       height: 50,
//                       width: 60,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: widget.tabSelectedColor,
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 5,
//                             style: BorderStyle.none,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(0.0),
//                           child: Opacity(
//                             opacity: fabIconAlpha!,
//                             child: Icon(
//                               activeIcon,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//    }

//     List<Widget> generateTabItems() {
//     return labels!.map((tabLabel) {
//       IconData? icon = icons![tabLabel];

//       return TabItem(
//         selected: selectedTab == tabLabel,
//         iconData: icon!,
//         title: tabLabel,
//         textStyle: widget.textStyle,
//         tabSelectedColor: widget.tabSelectedColor,
//         tabIconColor: widget.tabIconColor,
//         callbackFunction: () {
//           setState(() {
//             activeIcon = icon;
//             selectedTab = tabLabel;
//             widget.onTabItemSelected(index);
//           });
//           _initAnimationAndStart(_positionAnimation!.value, position);
//         },
//       );
//     }).toList();
//   }

//   _initAnimationAndStart(double from, double to) {
//     _positionTween!.begin = from;
//     _positionTween!.end = to;

//     _animationController!.reset();
//     _fadeOutController!.reset();
//     _animationController!.forward();
//     _fadeOutController!.forward();
//   }

//   class HalfClipper extends CustomClipper<Rect> {
//   @override
//   Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height / 2);

//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
// }

// class HalfPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
//     final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
//     final Rect afterRect =
//         Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

//     final path = Path();
//     path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
//     path.lineTo(20, size.height / 2);
//     path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
//     path.moveTo(size.width - 10, size.height / 2);
//     path.lineTo(size.width - 10, (size.height / 2) - 10);
//     path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
//     path.close();

//     canvas.drawPath(path, Paint()..color = Colors.white);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
// }

