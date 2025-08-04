import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/social_App/modules/login/cubit_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<SocialLoginState> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  // دالة تسجيل الدخول
  void userLogin({required String email, required String password}) {
    emit(SocialLoginLodingState()); // بدء التحميل
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        emit(SocialLoginSuccesState(value.user!.uid));
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialLoginErrorState(error.message ?? error.toString()));
    });
  }

  // التعامل مع الأيقونة الخاصة بكلمة المرور
  Widget suffixIcon = const Icon(Icons.visibility_outlined);
  bool isPassword = true;

  void changeSuffixIcon() {
    isPassword = !isPassword;
    suffixIcon = isPassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(SocialChangeIconSuffixState()); // تغيير الحالة للأيقونة
  }
}
