// // ignore_for_file: must_be_immutable

// import 'package:coscos/page/main_controller.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DropdownModel {
//   String value;
//   String name;
//   DropdownModel({required this.value, required this.name});
// }

// class CustomDropDown extends GetView<MainController> {
//   List<DropdownModel> items = [
//     DropdownModel(value: "ITEM1", name: "item1"),
//     DropdownModel(value: "ITEM2", name: "item2"),
//   ];
//   String? selectedValue;

//   CustomDropDown({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MainController>(
//       init: MainController(), // INIT IT ONLY THE FIRST TIME
//       builder: (_) => DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           isExpanded: true,
//           hint: Row(
//             children: [
//               Icon(
//                 Icons.list,
//                 size: 16,
//                 color: Colors.yellow,
//               ),
//               SizedBox(
//                 width: 4,
//               ),
//               Expanded(
//                 child: Text(
//                   controller.titleDropdown,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.yellow,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//           items: controller.items
//               .map((item) => DropdownMenuItem<String>(
//                     value: item.value,
//                     child: Text(
//                       item.name,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ))
//               .toList(),
//           value: controller.selectedItem,
//           onChanged: (value) {
//             controller.selectedDropdown(value as String);
//             controller.callBackSelected!(value as String);
//           },
//           icon: const Icon(
//             Icons.arrow_forward_ios_outlined,
//           ),
//           iconSize: 14,
//           iconEnabledColor: Colors.yellow,
//           iconDisabledColor: Colors.grey,
//           buttonHeight: 50,
//           buttonWidth: 160,
//           buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//           buttonDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(
//               color: Colors.black26,
//             ),
//             color: Colors.redAccent,
//           ),
//           buttonElevation: 2,
//           itemHeight: 40,
//           itemPadding: const EdgeInsets.only(left: 14, right: 14),
//           dropdownMaxHeight: 200,
//           dropdownWidth: 200,
//           dropdownPadding: null,
//           dropdownDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             color: Colors.redAccent,
//           ),
//           dropdownElevation: 8,
//           scrollbarRadius: const Radius.circular(40),
//           scrollbarThickness: 6,
//           scrollbarAlwaysShow: true,
//           offset: const Offset(-20, 0),
//         ),
//       ),
//     );
//   }
// }
