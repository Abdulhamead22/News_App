/*
1- create abstract class of state
2- create initialState extends of abstract class
3- create class of all the change in the app(يعني كل شي بدي من خلالو اغير قيم بعمل الو كلاس) 
 */

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {
  //اعملناه عشان بدي لما اضغط على زر يتنقل لصفحة اخرى وهيك قصدي بالشرح فوق
}

class NewsLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessFaildState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsFaildState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceFaildState extends NewsStates {}

class NewsChangeModeState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchFaildState extends NewsStates {}
class NewsLoadingSearchState extends NewsStates {}