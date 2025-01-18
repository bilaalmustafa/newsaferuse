import 'package:clinics_app/features/user/domain/entities/clinic_details_model.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:clinics_app/features/user/presentation/widgets/clinic_tab_widgets/clinic_tab_main_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/injections.dart';

class CheckPaggeee extends StatefulWidget {
  const CheckPaggeee({super.key});

  @override
  State<CheckPaggeee> createState() => _checkPageState();
}

class _checkPageState extends State<CheckPaggeee> {

final controller =sl<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => controller.runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: controller.model.isNotEmpty
                  ? ListView.builder(
                itemCount:  controller.model.length,
                itemBuilder: (context, index) {
                  ClinicDetailsModel mdl = controller.model[index];
                  return ClinicTabMainContainer(model: mdl);
                }
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}