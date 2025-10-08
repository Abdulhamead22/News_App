/*
1- create class of cubit extends Cubit<classState>
2- create function of all the change process and in last create emit(state)
 */

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_App/cubit/state.dart';
import 'package:flutter_application_1/cache_helper.dart';
import 'package:flutter_application_1/layout/news_App/dioHelper/dio_helper.dart';
import 'package:flutter_application_1/layout/news_App/modules/busniess/busniess_screen.dart';
import 'package:flutter_application_1/layout/news_App/modules/science/science_screen.dart';
import 'package:flutter_application_1/layout/news_App/modules/sports/sport_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  //create object of me
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  
  ];

  List screens = [
    const BusniessScreen(),
    const SportScreen(),
    const ScienceScreen(),
    
  ];

  changeBottomBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> busniess = [];
  getBusniess() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      busniess = value?.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessFaildState());
    });
  }

  List<dynamic> sport = [];
  getSport() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sport',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      sport = value?.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsFaildState());
    });
  }

  List<dynamic> science = [];
  getSciense() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      science = value?.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceFaildState());
    });
  }

  bool isDark = false;
  changeMode({bool? fromShared}) {
    /* هلقيت انا لما اضغط من الزر تفسو سعتها مش حكون مستدعي fromshared فبالتالي حينفذ جملة ال else
     بينما انا لما اضغط على اعادة التشغيل فراح استدعي fromshared فبالتالي حنفذ جملة ال if
    */
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then(
        (value) {
          emit(NewsChangeModeState());
        },
      );
    }
  }

  List<dynamic> search = [];
  getSearch(String value) {
    search = [];
    emit(NewsLoadingSearchState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      search = value?.data['articles'];
      //  search.add(value);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchFaildState());
    });
  }
}
