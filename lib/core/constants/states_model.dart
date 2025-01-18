class StatesModel {
  String? title;
  String? subTitle;
  String? subTitleTwo;
  String? lastDesc;

  bool? arrest;
  bool? charge;
  bool? prosecution;

  bool? arrestTwo;
  bool? chargeTwo;
  bool? prosecutionTwo;

  StatesModel({
    this.title,
    this.subTitle,
    this.subTitleTwo,
    this.arrest,
    this.charge,
    this.prosecution,
    this.arrestTwo,
    this.chargeTwo,
    this.prosecutionTwo,
    this.lastDesc,
  });

  // StatesModel(title: "",subTitle: "",subTitleTwo: "",lastDesc: "",arrest: true,charge: true,prosecution: true,arrestTwo: true,chargeTwo: true,prosecutionTwo: true),

  static List<StatesModel> statesModelList = [
    StatesModel(
        title: "ALAMABA",
        subTitle: "[ 1 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION:",
        subTitleTwo: "[ 1 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION:",
        lastDesc:
            "Read the Law: Ala. Code § 20-2-281 (under Title 20, Ch. 2, Article 13)",
        arrest: false,
        charge: false,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: false,
        prosecutionTwo: true),

    StatesModel(
        title: "ALASKA",
        subTitle: "[ 1 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 0 of 3 ] NO PROTECTION FOR PARAPHERNALIA POSSESSION: ",
        lastDesc: "Read the Law: Alaska Stat. § 11.71.311",
        arrest: false,
        charge: false,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: false,
        prosecutionTwo: false),

    StatesModel(
        title: "ARIZONA",
        subTitle: "[ 2 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 2 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc: "Read the Law: Ariz. Rev. Stat. Sec. 13-3423(A)(B)",
        arrest: false,
        charge: true,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "ARKANSAS",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 0 of 3 ] NO PROTECTION FOR PARAPHERNALIA POSSESSION: ",
        lastDesc: "Read the Law: A.C.A. § 20-13-1704 (2024)",
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: false,
        prosecutionTwo: false),



    StatesModel(
        title: "CALIFORNIA",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc: "Read the Law: Cal. Health & Safety Code § 11376.5 ",
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),




    StatesModel(
        title: "COLORADO",
        subTitle: "[ 2 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION ",
        subTitleTwo: "[ 2 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc: "Read the Law: C.R.S. 18-1-711 (2024) ",
        arrest: true,
        charge: false,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: false,
        prosecutionTwo: true),

    StatesModel(
        title: "CONNECTICUT",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION:",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION:",
        lastDesc:  '''Read the Law: Conn. Gen. Stat. § 21a-279(d) Conn. Gen. Stat. § 21a-267(d)''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "DELAWARE",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the Law: Del. Code. tit. 16, § 4769(b)''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "DISTRICT OF COLUMBIA",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the Law: D.C. Code § 7-403.''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),


    StatesModel(
        title: "FLORIDA",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the Law: Fla. Stat. § 893.21''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "GEORGIA",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the Law: Ga. Code § 16-13-5''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "HAWAII",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION:",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the Law: Haw. Rev. Stat. § 329-43.6''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "IDAHO",
        subTitle: "[ 2 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 2 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the law: Idaho Code § 37-2739C (2023)''',
        arrest: false,
        charge: true,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: true,
        prosecutionTwo: true),


    StatesModel(
        title: "ILLINOIS",
        subTitle: "[ 3 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 3 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the law: 720 Ill. Comp. Stat. 570/414''',
        arrest: true,
        charge: true,
        prosecution: true,
        arrestTwo: true,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "INDIANA",
        subTitle: "[ 2 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION: ",
        subTitleTwo: "[ 2 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the law: Ind. Code § 16-42-27-2''',
        arrest: false,
        charge: true,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: true,
        prosecutionTwo: true),

    StatesModel(
        title: "IOWA",
        subTitle: "[ 1 of 3 ] PROTECTED FOR SUBSTANCE POSSESSION:  ",
        subTitleTwo: "[ 1 of 3 ] PROTECTED FOR PARAPHERNALIA POSSESSION: ",
        lastDesc:  '''Read the Law: Iowa Code § 124.418''',
        arrest: false,
        charge: false,
        prosecution: true,
        arrestTwo: false,
        chargeTwo: false,
        prosecutionTwo: true),



  ];
}
