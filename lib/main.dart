import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_App/cubit/cubit.dart';
import 'package:flutter_application_1/layout/news_App/cubit/state.dart';
import 'package:flutter_application_1/cache_helper.dart';
import 'package:flutter_application_1/layout/news_App/dioHelper/dio_helper.dart';
import 'package:flutter_application_1/layout/news_App/news_layout.dart';
import 'package:flutter_application_1/style/theam.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
systemOverlayStyle: SystemUiOverlayStyle(
  statusBarColor: Colors.red,//للتغير لون الخط الي فوق الي بظهر فيه ايقونات النت والساعة
    statusBarIconBrightness: Brightness.light,//لتغير لون الايقونات حسب المود ابيض او اسود
),
WidgetsFlutterBinding.ensureInitialized(): هادا بتضمنلي انو كل async حيتنفذ
 */
  String? isToken;
void main() async {
WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: "isDark");
  
  runApp(MyApp(
    isDark: isDark,
    
  ));
}

class MyApp extends StatelessWidget {
   bool? isDark;
   MyApp({this.isDark,  super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusniess()
            ..getSciense()
            ..getSport()
            ..changeMode(fromShared: isDark),
        ),
      
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (BuildContext context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ligthTheam,
              darkTheme: darkTheam,
              // themeMode: NewsCubit.get(context).isDark
              //     ? ThemeMode.dark
              //     : ThemeMode.light,
              themeMode: ThemeMode.light,
             home: NewsLayout(),

            );
          }),
    );
  }
}

