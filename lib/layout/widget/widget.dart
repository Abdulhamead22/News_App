import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_App/cubit/cubit.dart';
import 'package:flutter_application_1/layout/news_App/cubit/state.dart';
import 'package:flutter_application_1/layout/news_App/modules/web_view/web_viewscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildArticalItem(artical, context) {
  String imageUrl = artical['urlToImage'] ?? '';
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WebViewscreen(url: artical['url']);
        },
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageUrl.isNotEmpty
                    ? NetworkImage('${artical['urlToImage']}')
                    : AssetImage('assets/placeholder_image.png')
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${artical['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget blocBuilder(String type) {
  return BlocConsumer<NewsCubit, NewsStates>(
    listener: (context, state) {},
    builder: (context, state) {
      var list = [];
      if (type == "busniess") {
        list = NewsCubit.get(context).busniess;
      } else if (type == "science") {
        list = NewsCubit.get(context).science;
      } else if (type == "sport") {
        list = NewsCubit.get(context).sport;
      } else if (type == "search") {
        list = NewsCubit.get(context).search;
      }
      return ConditionalBuilder(
        condition: list.isNotEmpty,
        builder: (context) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildArticalItem(list[index], context);
            },
            separatorBuilder: (context, index) {
              return myDrevider();
            },
            itemCount: 10,
          );
        },
        fallback: (context) {
          return type == "search"
              ? Container()
              : const Center(child: CircularProgressIndicator());
        },
      );
    },
  );
}

Widget myDrevider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      width: double.infinity,
      height: 2,
      color: Colors.black,
    ),
  );
}

TextFormField textField({
  required TextEditingController controller,
  required String input,
  TextInputType keytype = TextInputType.emailAddress,
  required Icon icon,
  Widget? suffixIcons,
  required FormFieldValidator<String> validate,
  GestureTapCallback? ontap,
  var onchange,
  FocusNode? focusNode,
  ValueChanged<String>? onsubmit,
  bool isPassword = false,
}) {
  return TextFormField(
    style: const TextStyle(color: Colors.black),
    focusNode: focusNode,
    onEditingComplete: () {
      focusNode?.unfocus();
      scheduleMicrotask(
          focusNode!.requestFocus); // need to `import 'dart:async';`
    },
    decoration: InputDecoration(
      labelText: input,
      hintText: "Enter $input",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: icon,
      suffixIcon: suffixIcons,
    ),
    obscureText: isPassword, //للنص مخفي ولا لا
    keyboardType: keytype,
    onFieldSubmitted: onsubmit,
    onTap: ontap,
    onChanged: onchange,
    controller: controller,
    validator: validate,
  );
}

Widget defaultButton({
  double width = double.infinity,
  Color backgraund = Colors.blue,
  bool isuper = true,
  double radies = 3.0,
  required VoidCallback? function,
  required String text,
  double fontsize = 30,
}) {
  return Container(
    width: width,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radies),
      color: backgraund,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontsize,
        ),
      ),
    ),
  );
}



Widget defaultTextButton({
  required VoidCallback? function,
  required String text,
}) {
  return TextButton(
    onPressed: function,
    child: Text(text),
  );
}

Future<dynamic> navigatFinish(context, builder) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) {
        return builder;
      },
    ),
    (route) {
      return false;
    },
  );
}

Future<dynamic> navigatTo(context, builder) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return builder;
      },
    ),
  );
}

Future<bool?> toast(String text, Color color) {
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}




