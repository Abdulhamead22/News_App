import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_cubit.dart';
import 'package:flutter_application_1/layout/social_App/cubits/social_state.dart';
import 'package:flutter_application_1/layout/widget/widget.dart';
import 'package:flutter_application_1/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var userModel = SocialCubit.get(context).userModel;
    TextEditingController nameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context,
            "Edit Profile",
            [
              defaultTextButton(
                function: () {},
                text: 'Update',
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
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
                            IconButton(
                              onPressed: () {},
                              icon: CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(userModel.image),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 15,
                              child: Icon(
                                IconBroken.Camera,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                textField(
                  controller: nameController,
                  input: 'Name',
                  icon: Icon(IconBroken.User),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "must have name!!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                textField(
                  controller: bioController,
                  input: 'Bio',
                  icon: Icon(IconBroken.Info_Circle),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "must have bio!!";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
