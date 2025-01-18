

class UserModel {

  String? uid;
  String? role;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? mobileNumber;
  String? imgUrl;


  UserModel({
    this.uid,
    this.role,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.mobileNumber,
    this.imgUrl,

  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['role'] = role;
    map['name'] = name;
    map['email'] =email;
    map['password'] =password;
    map['confirmPassword'] =confirmPassword;
    map['mobileNumber'] =mobileNumber;
    map['imgUrl'] =imgUrl;


    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    uid = map['uid'];
    role = map['role'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
    confirmPassword = map['confirmPassword'];
    mobileNumber = map['mobileNumber'];
    imgUrl = map['imgUrl'];

  }



  UserModel copyWith({
    String? uid,
    String? role,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? mobileNumber,
    String? imgUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      role: role ?? this.role,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      imgUrl: imgUrl ?? this.imgUrl,


    );
  }
}

