import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/searchscreen.dart';
import 'package:news_app/modules/settinges.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/combonent.dart';
import 'package:news_app/shared/cubit/newsapp_cubit.dart';
import 'package:news_app/shared/shared_pref.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);
  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    // SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsappCubit, NewsappState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsappCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'news app',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    gotoNavgate(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changeMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeIndex(index: index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'science'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'sports'),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.settings), label: 'settings')
              ]),
        );
      },
    );
  }
}
