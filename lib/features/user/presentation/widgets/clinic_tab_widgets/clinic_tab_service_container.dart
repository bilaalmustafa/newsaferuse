import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';
import 'clinic_tab_select_container.dart';

class ClinicTabServiceContainer extends StatelessWidget {
   ClinicTabServiceContainer({super.key});
  final controller = sl<UserController>();

  @override
  Widget build(BuildContext context) {
    return  Obx(()=> SizedBox(
      width: 90.w,
      child: Wrap(
        runSpacing: 2.w,
        children: [
          ClinicTabSelectContainer(color: controller.categoryIndex.contains(0) ? Colors.grey.withOpacity(0.5) : Colors.white ,text: ' All ',categoryIndex: 0,),
          SizedBox(width: 2.w,),
          ClinicTabSelectContainer( color: controller.categoryIndex.contains(1) ? Colors.grey.withOpacity(0.5) : Colors.white ,text: 'Syringes',categoryIndex: 1,),

          SizedBox(width: 2.w,),
          ClinicTabSelectContainer( color: controller.categoryIndex.contains(2) ? Colors.grey.withOpacity(0.5) : Colors.white, text: 'Safer smoking kits',categoryIndex: 2,),

          SizedBox(width: 2.w,),
          ClinicTabSelectContainer(color: controller.categoryIndex.contains(3) ? Colors.grey.withOpacity(0.5) : Colors.white ,text: 'Medical Care',categoryIndex: 3,),

          SizedBox(width: 2.w,),

          ClinicTabSelectContainer(color: controller.categoryIndex.contains(4) ? Colors.grey.withOpacity(0.5) : Colors.white ,text: ' CBR',categoryIndex: 4,),
          SizedBox(width: 2.w,),
          ClinicTabSelectContainer( color: controller.categoryIndex.contains(5) ? Colors.grey.withOpacity(0.5) : Colors.white,text: ' Blood Test',categoryIndex: 5,),
          SizedBox(width: 2.w,),
          ClinicTabSelectContainer( color: controller.categoryIndex.contains(6) ? Colors.grey.withOpacity(0.5) : Colors.white,text: ' HIV Test',categoryIndex: 6,),
          SizedBox(width: 2.w,),
        ],
      ),
    ));
  }
}












// class ClinicTabServiceContainer extends StatelessWidget {
//   ClinicTabServiceContainer({super.key});
//   final controller = sl<UserController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return  Obx(()=> SizedBox(
//       width: 90.w,
//       child: Wrap(
//         runSpacing: 2.w,
//         children: [
//           ClinicTabSelectContainer(color: controller.categoryIndex.value == 0 ? Colors.grey.withOpacity(0.5) : Colors.white ,text: ' All ',categoryIndex: 0,),
//           SizedBox(width: 3.w,),
//           ClinicTabSelectContainer( color: controller.categoryIndex.value == 1 ? Colors.grey.withOpacity(0.5) : Colors.white ,text: 'Syringes',categoryIndex: 1,),
//
//           SizedBox(width: 3.w,),
//           ClinicTabSelectContainer( color: controller.categoryIndex.value == 2 ? Colors.grey.withOpacity(0.5) : Colors.white, text: 'Safer smoking kits',categoryIndex: 2,),
//
//           SizedBox(width: 3.w,),
//           ClinicTabSelectContainer(color: controller.categoryIndex.value == 3 ? Colors.grey.withOpacity(0.5) : Colors.white ,text: 'Medical Care',categoryIndex: 3,),
//
//           SizedBox(width: 3.w,),
//
//           ClinicTabSelectContainer(color: controller.categoryIndex.value == 4 ? Colors.grey.withOpacity(0.5) : Colors.white ,text: ' CBR',categoryIndex: 4,),
//           SizedBox(width: 3.w,),
//           ClinicTabSelectContainer( color: controller.categoryIndex.value == 5 ? Colors.grey.withOpacity(0.5) : Colors.white,text: ' Blood Test',categoryIndex: 5,),
//           SizedBox(width: 3.w,),
//           ClinicTabSelectContainer( color: controller.categoryIndex.value == 6 ? Colors.grey.withOpacity(0.5) : Colors.white,text: ' HIV Test',categoryIndex: 6,),
//           SizedBox(width: 3.w,),
//         ],
//       ),
//     ));
//   }
// }
