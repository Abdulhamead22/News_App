class SocailUserModel {
  late String uId;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String bio;
  late String cover;
  late bool isVerifyEmail;
//اجيب بستخدم fromjson
  SocailUserModel(
      {required this.uId,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
        required this.bio,
        required this.cover,
      required this.isVerifyEmail});
  SocailUserModel.fromJson(Map<String, dynamic>? josn) {
    uId = josn?['id'];
    name = josn?['name'];
    email = josn?['email'];
    phone = josn?['phone'];
    image = josn?['image'];
    bio = josn?['bio'];
    cover = josn?['cover'];
    isVerifyEmail = josn?['isVerifyEmail'];
  }
  //اودي بستخدم tomap
  Map<String, dynamic> toMap() {
    return {
      'id': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'image':image,
      'bio':bio,
      'cover':cover,
      'isVerifyEmail': isVerifyEmail,
    };
  }
}
