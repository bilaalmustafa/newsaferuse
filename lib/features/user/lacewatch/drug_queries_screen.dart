import 'dart:developer';
import 'dart:io';
import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/core/constants/strings.dart';
import 'package:clinics_app/features/user/lacewatch/Homscreen.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_appbar.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_submitted_button.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/console.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/di.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/extension.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/validator.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/auth_services.dart';
import 'package:clinics_app/features/user/lacewatch/core/services/user_services.dart';
import 'package:clinics_app/features/user/lacewatch/model/drag.dart';
import 'package:clinics_app/features/user/lacewatch/model/postQuery.dart';
import 'package:clinics_app/features/user/lacewatch/model/user.dart';
import 'package:clinics_app/features/user/lacewatch/viewModel/drug_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class DrugQueriesScreen extends StatefulWidget {
  final File image;
  const DrugQueriesScreen({super.key, required this.image});

  @override
  State<DrugQueriesScreen> createState() => _DrugQueriesScreenState();
}

class _DrugQueriesScreenState extends State<DrugQueriesScreen> {
  late final TextEditingController _drugNameController;
  late final TextEditingController _drugSynonymsController;
  final _formKey = GlobalKey<FormState>();
  int _drugRisk = 0;
  int _queOne = 0;
  int _queTwo = 0;

  List<PostQuery> _postQueries = [];

  String? _selectValue;
  String? _selectSynunymvalue;

  List<String> getDrugSynonyms(String value) {
    switch (value) {
      case 'Cocaine':
        return Strings.cocaineSynonyms;
      case 'Heroin':
        return Strings.heroinSynonym;
      case 'Methamphetamine':
        return Strings.methamphetamineSynonym;
      case "Oxycodone":
        return Strings.oxycodoneSynonym;
      case 'Hydrocodone':
        return Strings.hydrocodoneSynonym;
      case 'Alprazolam':
        return Strings.alprazolamSynonym;
      case 'Amphetamine':
        return Strings.amphetamineSynonym;
      default:
        return [];
    }
  }

  @override
  void initState() {
    _drugNameController = TextEditingController();
    _drugSynonymsController = TextEditingController();

    super.initState();
  }

  bool _validateAndSaveForm() {
    var form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _drugNameController.dispose();
    _drugSynonymsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.homeBackground,
      appBar: const SharedAppbar(
        title: "Additional information",
        backgroundColor: ConstColor.homeBackground,
      ),
      bottomNavigationBar: Container(
        height: context.height * 0.1,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        alignment: Alignment.topCenter,
        child: Consumer<DrugViewmodel>(builder: (context, vm, _) {
          return SharedSubmitButton(
            onPressed: () async {
              int id = DateTime.now().microsecondsSinceEpoch;
              final AuthService auth = instance<AuthService>();
              final UserService userService = instance<UserService>();

              if (_validateAndSaveForm()) {
                log(auth.currentUser!.uid);

                User? user =
                    await userService.getUserById(auth.currentUser!.uid);
                console(user?.username);

                if (user != null) {
                  console(user.username);

                  // Request location permission and get the position
                  bool locationAllowed = await vm.determinePosition();

                  if (!locationAllowed) {
                    Fluttertoast.showToast(
                        msg: "Location permission is required to post.");
                    return;
                  }

                  Drug drug = Drug(
                    drugName: _selectValue,
                    drugSynonyms: _selectSynunymvalue,
                    drugRisk: _drugRisk,
                    queOne: _queOne,
                    queTwo: _queTwo,
                    address: "IT Park Peshawar",
                    lat: vm.lat,
                    long: vm.long,
                    createdAt: id,
                    isVerified: false,
                    user: user,
                    id: id,
                    queries: _postQueries,
                  );

                  bool success =
                      await vm.createPost(id.toString(), drug, widget.image);
                  if (success && context.mounted) {
                    Fluttertoast.showToast(msg: "Drug Posted Successfully!");
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_) => const DummyHomeScreen()) , (route) => false);
                    


                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, Routes.dashboard, (val) => val.isFirst);
                  }
                }
              } else {
                log("Please fill the required fields");
              }
            },
            width: double.infinity,
            height: Sizes.s54,
            loading: vm.isLoading,
            title: "Post result",
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Symbols.help, size: Sizes.s24),
                        const Gap(Sizes.s10),
                        Text(
                          "What is the name of this drug?",
                          style: context.titleMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),
                    const Gap(Sizes.s4),

                    DropdownButtonFormField<String>(
                        menuMaxHeight: 400,
                        validator: (value) => Validator.valueExists(value),
                        hint: const Text(
                          "e.g Cocaine",
                          style: TextStyle(
                              color: ConstColor.greyA1A1, fontSize: Sizes.s14),
                        ),
                        value: _selectValue,
                        items: Strings.drugName
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child:
                                        Text(value, style: context.bodyMedium),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectValue = value;
                            _selectSynunymvalue = null;
                          });
                        }),

                    // TextFormField(
                    //   controller: _drugNameController,
                    //   validator: (val) => Validator.valueExists(val),
                    //   decoration: const InputDecoration(
                    //     hintText: "e.g Cocaine",
                    //   ),
                    // ),
                    const Gap(Sizes.s8),
                    Row(
                      children: [
                        const Icon(Symbols.help, size: Sizes.s24),
                        const Gap(Sizes.s10),
                        Expanded(
                          child: Text(
                            "What are the local synonyms used for this drug?",
                            style: context.titleMedium
                                .copyWith(color: ConstColor.black2422),
                          ),
                        ),
                      ],
                    ),
                    const Gap(Sizes.s4),
                    DropdownButtonFormField<String>(
                        validator: (value) => Validator.valueExists(value),
                        menuMaxHeight: 400,
                        hint: const Text(
                          "e.g Coke",
                          style: TextStyle(
                              color: ConstColor.greyA1A1, fontSize: Sizes.s14),
                        ),
                        value: _selectSynunymvalue,
                        items: getDrugSynonyms(_selectValue ?? '')
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child:
                                        Text(value, style: context.bodyMedium),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectSynunymvalue = value;
                          });
                        }),

                    // TextFormField(
                    //   controller: _drugSynonymsController,
                    //   validator: (val) => Validator.valueExists(val),
                    //   decoration: const InputDecoration(
                    //     hintText: "e.g Coke",
                    //   ),
                    // ),
                    const Gap(Sizes.s8),
                    Row(
                      children: [
                        const Icon(Symbols.help, size: Sizes.s24),
                        const Gap(Sizes.s10),
                        Expanded(
                          child: Text(
                            "What is the level of risk associated with this drug?",
                            style: context.titleMedium
                                .copyWith(color: ConstColor.black2422),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _drugRisk,
                              onChanged: (val) =>
                                  setState(() => _drugRisk = val!),
                            ),
                            Text(
                              "Low",
                              style: context.bodyMedium
                                  .copyWith(color: ConstColor.black2422),
                            ),
                          ],
                        ),
                        const Gap(Sizes.s20),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _drugRisk,
                              onChanged: (val) =>
                                  setState(() => _drugRisk = val!),
                            ),
                            Text(
                              "Medium",
                              style: context.bodyMedium
                                  .copyWith(color: ConstColor.black2422),
                            ),
                          ],
                        ),
                        const Gap(Sizes.s20),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _drugRisk,
                              onChanged: (val) =>
                                  setState(() => _drugRisk = val!),
                            ),
                            Text(
                              "High",
                              style: context.bodyMedium
                                  .copyWith(color: ConstColor.black2422),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(Sizes.s8),
                    Row(
                      children: [
                        const Icon(Symbols.help, size: Sizes.s24),
                        const Gap(Sizes.s10),
                        Expanded(
                          child: Text(
                            "Was it given for you or did you pay for it?",
                            style: context.titleMedium
                                .copyWith(color: ConstColor.black2422),
                          ),
                        ),
                      ],
                    ),
                    const Gap(Sizes.s10),
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: _queOne,
                          onChanged: (val) => setState(() => _queOne = val!),
                        ),
                        Text(
                          "It was given to me",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _queOne,
                          onChanged: (val) => setState(() => _queOne = val!),
                        ),
                        Text(
                          "I payed for it",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),

                    const Gap(Sizes.s8),
                    Row(
                      children: [
                        const Icon(Symbols.help, size: Sizes.s24),
                        const Gap(Sizes.s10),
                        Expanded(
                          child: Text(
                            "Do you think your source knew?",
                            style: context.titleMedium
                                .copyWith(color: ConstColor.black2422),
                          ),
                        ),
                      ],
                    ),
                    const Gap(Sizes.s10),
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: _queTwo,
                          onChanged: (val) => setState(() => _queTwo = val!),
                        ),
                        Text(
                          "Definitely yes",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _queTwo,
                          onChanged: (val) => setState(() => _queTwo = val!),
                        ),
                        Text(
                          "Probably yes",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: _queTwo,
                          onChanged: (val) => setState(() => _queTwo = val!),
                        ),
                        Text(
                          "Not sure",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: _queTwo,
                          onChanged: (val) => setState(() => _queTwo = val!),
                        ),
                        Text(
                          "Probably not",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 4,
                          groupValue: _queTwo,
                          onChanged: (val) => setState(() => _queTwo = val!),
                        ),
                        Text(
                          "Definitely not",
                          style: context.bodyMedium
                              .copyWith(color: ConstColor.black2422),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // FutureBuilder<List<Query>>(
            //     future: instance<QueriesService>().getQueries(),
            //     builder: (ctx, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(child: CircularProgressIndicator());
            //       }

            //       _postQueries = List.generate(
            //           snapshot.data?.length ?? 0, (i) => PostQuery());

            //       return ListView.separated(
            //         itemCount: snapshot.data?.length ?? 0,
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: Sizes.s20, vertical: Sizes.s20),
            //         itemBuilder: (ctx, i) {
            //           return Consumer<DrugViewmodel>(builder: (context, vm, _) {
            //             return QueryItem(
            //               query: snapshot.data![i],
            //               onQueryAdd: (query) {
            //                 _postQueries[i] = query;
            //                 for (int i = 0; i < _postQueries.length; i++) {
            //                   log(_postQueries[i].toJson().toString());
            //                 }
            //               },
            //             );
            //           });
            //         },
            //         separatorBuilder: (ctx, i) =>
            //             const SizedBox(height: Sizes.s20),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
