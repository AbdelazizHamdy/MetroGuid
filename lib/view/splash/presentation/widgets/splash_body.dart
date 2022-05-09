// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../constants/size_config.dart';
// import '../../../metro_home_screen.dart';
//
// class SplashViewBody extends StatefulWidget {
//   const SplashViewBody({Key? key}) : super(key: key);
//
//   @override
//   _SplashViewBodyState createState() => _SplashViewBodyState();
// }
//
// class _SplashViewBodyState extends State<SplashViewBody>
//     with SingleTickerProviderStateMixin {
//   AnimationController? animationController;
//   Animation<double>? fadingAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
//     fadingAnimation =
//         Tween<double>(begin: .2, end: 1).animate(animationController!);
//
//     animationController?.repeat(reverse: true);
//   }
//
//   @override
//   void dispose() {
//     animationController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       child: Column(
//         children: [
//           const Spacer(),
//           FadeTransition(
//             opacity: fadingAnimation!,
//             child: const Text(
//               'Metro Cairo',
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 51,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepOrange,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 color: Colors.deepOrange,
//                   child: Image.asset('assets/images/train.png',),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   void goToNextView() {
//     Future.delayed(const Duration(seconds: 3), () {
//       Get.to(() => const MetroHome(), transition: Transition.fade);
//     });
//   }
// }