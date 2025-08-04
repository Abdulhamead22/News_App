import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_App/cubit/cubit.dart';
import 'package:flutter_application_1/layout/news_App/cubit/state.dart';
import 'package:flutter_application_1/layout/news_App/modules/search/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
1- create blocprovider
2- the create of the appCubit
3- create blocConsumer<appCubit,appState> in child of blocProvider
 appCubit,appState:بعملهم عشان يكون عارف هوا بتنقل وين

 */
class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeMode();
                },
                icon: const Icon(Icons.light_mode_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomBar(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
