import 'dart:io';
import 'package:camera/camera.dart';
import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_appbar.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_dynamic_icon.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/console.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/extension.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:clinics_app/features/user/lacewatch/core/constants/assets.dart';
import 'package:clinics_app/features/user/lacewatch/drug_queries_screen.dart';
import 'package:clinics_app/features/user/lacewatch/viewModel/drug_veiw_model.dart';
import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class DrugCameraScreen extends StatefulWidget {
  const DrugCameraScreen({super.key});

  @override
  State<DrugCameraScreen> createState() => _DrugCameraScreenState();
}

class _DrugCameraScreenState extends State<DrugCameraScreen> {
  late List<CameraDescription> _cameras;
  late CameraController controller;
  bool _isInitialized = false;
  bool _isCameraReverted = false;
  File? _image;
  bool _enableFlash = false;

  checkForAvailableCameras() async {
    _cameras = await availableCameras();
    console(_cameras.length, name: "Cameras Length");
  }

  @override
  void initState() {
    _initCameraModule(1);
    super.initState();
  }

  _initCameraModule(int code) async {
    await checkForAvailableCameras();
    if (_cameras.isNotEmpty) {
      _initCamera(_cameras[code]);
    }
  }

  _initCamera(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isInitialized = true;
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            console(e.description, type: DebugType.error);
            break;
          default:
            console(e.description, type: DebugType.error);
            break;
        }
      }
    });
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   final CameraController? cameraController = controller;

  //   // App state changed before we got the chance to initialize.
  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     return;
  //   }

  //   if (state == AppLifecycleState.inactive) {
  //     cameraController.dispose();
  //   } else if (state == AppLifecycleState.resumed) {
  //     _initializeCameraController(cameraController.description);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(title: "Post testing result"),
      body: Column(
        children: [
          const Gap(Sizes.s10),
          Expanded(
            child: !_isInitialized
                ? const Center(
                    child: Text("Camera isn't initialized"),
                  )
                : _image != null
                    ? Image.file(_image!)
                    : CameraPreview(controller),
          ),
          const Gap(Sizes.s20),
          Text("Take a photo of your testing strip", style: context.titleLarge),
          const Gap(Sizes.s30),
          Container(
            height: context.height * 0.17,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (_image == null) {
                      setState(() {
                        _enableFlash = !_enableFlash;
                      });
                      if (_enableFlash) {
                        controller.setFlashMode(FlashMode.always);
                      } else {
                        controller.setFlashMode(FlashMode.off);
                      }
                    } else {
                      setState(() {
                        _image = null;
                      });
                    }
                  },
                  icon: _image == null
                      ? Icon(
                          Symbols.bolt,
                          size: Sizes.s30,
                          fill: _enableFlash ? Sizes.s1 : Sizes.s0,
                        )
                      : const Icon(Symbols.close, size: Sizes.s30),
                ),
                InkWell(
                  onTap: _image == null
                      ? () async {
                          XFile image = await controller.takePicture();
                          setState(() {
                            _image = File(image.path);
                          });

                          console(_image?.path);
                        }
                      : null,
                  borderRadius: BorderRadius.circular(Sizes.s120),
                  child: _image == null
                      ? Container(
                          height: Sizes.s72,
                          width: Sizes.s72,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: ConstColor.primary, width: Sizes.s5)),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.s120),
                          child: Image.file(
                            _image!,
                            height: Sizes.s72,
                            width: Sizes.s72,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                IconButton(
                  onPressed: () {
                    if (_image == null) {
                      setState(() {
                        _isCameraReverted = !_isCameraReverted;
                      });
                      if (_isCameraReverted) {
                        _initCamera(_cameras[0]);
                      } else {
                        _initCamera(_cameras[1]);
                      }
                    } else {
                      // _image = null;
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (_) => DrugViewmodel(),
                                child: DrugQueriesScreen(image: _image!),
                              ),
                            ));

                        // Navigator.pushNamed(
                        //   context,
                        //   Routes.drugQuestions,
                        //   arguments: _image,
                        // );
                      }
                    }
                  },
                  icon: _image == null
                      ? const SharedDynamicIcon(
                          SvgAssets.switchCamera,
                          height: Sizes.s24,
                        )
                      : const Icon(
                          Symbols.check,
                          weight: 700,
                          size: Sizes.s30,
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
