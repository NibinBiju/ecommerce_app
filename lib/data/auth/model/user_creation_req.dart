class UserCreationReqModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? gender;
  String? age;

  UserCreationReqModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
  });
}
