class MyUser {
  String? uid;
  final String? firstName;
  final String? lastName;
  final String? major;
  final String email;
  late final String profilePic;
  final bool? isADvisor;

  MyUser(
      {this.firstName,
      this.lastName,
      this.major,
      required this.email,
      required this.profilePic,
      this.isADvisor,
      this.uid});
}
