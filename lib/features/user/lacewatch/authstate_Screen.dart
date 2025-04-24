import 'package:clinics_app/features/user/lacewatch/core/config/di.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/auth_services.dart';
import 'package:clinics_app/features/user/lacewatch/drug_camera_Screen.dart';
import 'package:clinics_app/features/user/lacewatch/sign_in_screen.dart';
import 'package:clinics_app/features/user/lacewatch/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: instance<AuthService>().authStateChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return const DrugCameraScreen();
          } else {
            return ChangeNotifierProvider(create: (_) => AuthViewmodel(), child: const SigninScreen());
          }
        });
  }
}
