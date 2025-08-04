import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/social_App/models/socail_user_model.dart';
import 'package:flutter_application_1/layout/social_App/modules/register/cubit_register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(SocialRegisterLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        emit(SocialRegisterSuccesState());
        userCreate(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid,
        );
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.message ?? error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    SocailUserModel model = SocailUserModel(
      uId: uId,
      name: name,
      email: email,
      phone: phone,
      isVerifyEmail: false,
      image: 'https://img.freepik.com/photos-gratuite/homme-boheme-bras-croises_1368-3542.jpg?semt=ais_hybrid&w=740&q=80',
      bio: 'write you bio ...',
      cover: 'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg'
    );
    /*هنا بفحص اذا موجودة ببدأ يدخل فيها مش موجودة بكونها 
    doc(uId):بعتت معاه id عشان انا اشتغل عليه يعني احطط الداتا 
    */
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(model.toMap())
        .then(
      (value) {
        emit(SocialCreateUserSuccesState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorState(error.message ?? error.toString()));
    });
  }

  Widget suffixIcon = const Icon(Icons.visibility_outlined);
  bool isPassword = true;

  void changeSuffixIcon() {
    isPassword = !isPassword;
    suffixIcon = isPassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(SocialRegisterChangeIconSuffixState());
  }
}
