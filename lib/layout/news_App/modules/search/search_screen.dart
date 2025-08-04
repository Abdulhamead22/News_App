import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_App/cubit/cubit.dart';
import 'package:flutter_application_1/layout/news_App/cubit/state.dart';
import 'package:flutter_application_1/layout/widget/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var searchController = TextEditingController();
class SearchScreen extends StatelessWidget {
  

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: textField(
                  controller: searchController,
                  keytype: TextInputType.text,
                  input: 'Search',
                  icon: const Icon(Icons.search),
                  validate: (value) {
                    if (value==null) {
                      return "Search must not empty  ";
                    } else {
                      return null;
                    }
                  },
                  onchange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(child: blocBuilder("search"))
            ],
          ),
        );
      },
    );
  }
}
