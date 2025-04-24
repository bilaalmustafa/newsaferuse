// import 'package:clinics_app/core/constants/const_colors.dart';
// import 'package:clinics_app/features/user/lacewatch/component/drugItem.dart';
// import 'package:clinics_app/features/user/lacewatch/controller.dart/location_viewModel.dart';
// import 'package:clinics_app/features/user/lacewatch/core/config/di.dart';
// import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
// import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
// import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
// import 'package:clinics_app/features/user/lacewatch/core/services/drug_services.dart';
// import 'package:clinics_app/features/user/lacewatch/model/drag.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final locationVM = Provider.of<LocationViewmodel>(context);
//     return Scaffold(
//       backgroundColor: ConstColor.kPrimaryColor,
//       body: locationVM.currentLatLng == null
//           ? CircularProgressIndicator()
//           // const HomeLoader()
//           : StreamBuilder<List<Drug>>(
//               stream: instance<DrugService>()
//                   .getDrugsStream(locationVM.currentLatLng, radiusInKm: 5),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting ||
//                     !snapshot.hasData) {
//                   return CircularProgressIndicator();
//                   // const HomeLoader();
//                 }
//                 if (snapshot.hasError) {
//                   return Center(child: Text(snapshot.error.toString()));
//                 }
//                 if (snapshot.hasData) {
//                   return SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Gap(Sizes.s20),
//                         Padding(
//                           padding:
//                               const EdgeInsets.symmetric(horizontal: Sizes.s20),
//                           child: Text(
//                             "List of locally identified drugs near you ",
//                             style: context.titleLarge,
//                           ),
//                         ),
//                         const Gap(Sizes.s30),
//                         ListView.separated(
//                           shrinkWrap: true,
//                           padding:
//                               const EdgeInsets.symmetric(horizontal: Sizes.s20),
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: snapshot.data?.length ?? 0,
//                           itemBuilder: (ctx, i) => DrugItem(
//                             // onTap: () => Navigator.pushNamed(
//                             //   context,
//                             //   Routes.drugDetail,
//                             //   arguments: snapshot.data![i].id,
//                             // ),
//                             drug: snapshot.data![i],
//                           ),
//                           separatorBuilder: (ctx, i) =>
//                               const SizedBox(height: Sizes.s30),
//                         ),
//                         const Gap(Sizes.s30),
//                       ],
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               }),
//     );
//   }
// }
