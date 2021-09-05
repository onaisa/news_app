import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/blocobserver.dart';
import 'package:news_app/shared/cubit/newsapp_cubit.dart';
import 'package:news_app/shared/dio_helper.dart';
import 'package:news_app/shared/shared_pref.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  CachHelper.init();
  // bool isdark = false;
  // isdark = CachHelper.sharedPref!.getBool('isdark')!;
  DioHilper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final bool? isdark;
  // MyApp(this.isdark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsappCubit()
        ..getBusiness()
        ..getSciness()
        ..getSport(),
      child: BlocBuilder<NewsappCubit, NewsappState>(
        builder: (context, state) {
          bool? isdark = CachHelper.sharedPref.getBool('isdark');
          print('isdark in main is $isdark');
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.orange,
              primaryColor: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  titleSpacing: 20.0,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 30.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  bodyText2: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[800],
                      fontSize: 14.0)),
            ),
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  backgroundColor: HexColor('333739'),
                  titleSpacing: 20.0,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: HexColor('333739'),
                  ),
                  titleTextStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                  backgroundColor: HexColor('333739'),
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    bodyText2: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[100],
                        fontSize: 14.0))),
            themeMode: isdark == true
                //  NewsappCubit.get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
