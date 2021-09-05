import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/combonent.dart';
import 'package:news_app/shared/cubit/newsapp_cubit.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsappCubit, NewsappState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsappCubit.get(context).business;
        if (list.length == 0) {
          return Center(child: CircularProgressIndicator());
        } else
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ArtecalesWidget(context, list[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 5.0);
              },
              itemCount: list.length);
      },
    );
  }
}
