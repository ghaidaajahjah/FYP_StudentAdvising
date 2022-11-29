class MyUser {
  String? uid;
  final String? firstName;
  final String? lastName;
  final String? major;
  final String email;
  final bool? isADvisor;

  MyUser(
      {this.firstName,
      this.lastName,
      this.major,
      required this.email,
      this.isADvisor,
      this.uid});
}
