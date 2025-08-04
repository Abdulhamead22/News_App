import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/layout/social_App/modules/newpost/newpost_screen.dart';
import 'package:flutter_application_1/layout/social_App/modules/settings/settings_screen.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_state.dart';
import 'package:flutter_application_1/layout/social_App/models/socail_user_model.dart';
import 'package:flutter_application_1/layout/social_App/modules/chats/chats_screen.dart';
import 'package:flutter_application_1/layout/social_App/modules/feeds/feeds_screen.dart';
import 'package:flutter_application_1/layout/social_App/modules/users/users_screen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  SocailUserModel? userModel;

  void getUserDate() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('user').doc(uId).get().then(
      (value) {
        print(value.data());
        userModel = SocailUserModel.fromJson(value.data());
        emit(SocialGetUserSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  List<String> title = [
    'Feeds',
    'Chats',
    'post',
    'Users',
    'Settings',
  ];
  int currentIndex = 0;
  List<Widget> page = [
    FeedsScreen(),
    ChatsScreen(),
    NewpostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }
}
