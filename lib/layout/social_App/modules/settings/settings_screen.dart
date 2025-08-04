import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_cubit.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_state.dart';
import 'package:flutter_application_1/layout/social_App/modules/edit_profile/edit_profile.dart';
import 'package:flutter_application_1/layout/widget/widget.dart';
import 'package:flutter_application_1/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              userModel!.cover,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(userModel.image),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userModel.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                userModel.bio,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '36',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Photo',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '253',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '642',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Add Photo'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      navigatTo(context, EditProfile());
                    },
                    child: Icon(
                      IconBroken.Edit,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
