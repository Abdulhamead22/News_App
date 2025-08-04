import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_cubit.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_state.dart';
import 'package:flutter_application_1/layout/social_App/modules/newpost/newpost_screen.dart';
import 'package:flutter_application_1/layout/widget/widget.dart';
import 'package:flutter_application_1/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigatTo(context, NewpostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.title[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Notification),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Search),
              ),
            ],
          ),

          // body: ConditionalBuilder(
          //   condition: SocialCubit.get(context).model != null,
          //   builder: (BuildContext context) {
          //     //  var model = SocialCubit.get(context).model;

          //     return Column(
          //       children: [
          //         if (!FirebaseAuth.instance.currentUser!.emailVerified)
          //           emailVerified(),
          //       ],
          //     );
          //   },
          //   fallback: (BuildContext context) => Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
          body: cubit.page[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNav(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Paper_Upload),
                  label: "Post",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Location),
                  label: "Users",
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: "Settings",
                ),
              ]),
        );
      },
    );
  }
}
