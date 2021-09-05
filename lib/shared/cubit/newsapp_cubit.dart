import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/shared/dio_helper.dart';
import 'package:news_app/shared/shared_pref.dart';

part 'newsapp_state.dart';

class NewsappCubit extends Cubit<NewsappState> {
  NewsappCubit() : super(NewsappInitial());
  static NewsappCubit get(context) => BlocProvider.of(context);
  Future<bool?> fromshar = CachHelper.getBoolean(key: 'isdark');
  int currentindex = 0;
  bool isdark = false;
  void changeIndex({required int index}) {
    // if (index == 0) {
    //   getBusiness();
    // } else if (index == 1) {
    //   getSciness();
    // } else if (index == 2) {
    //   getSport();
    // }
    currentindex = index;
    emit(AppChangeBottomNavBarState());
  }

  void changeMode({bool? fromshar}) {
    // if (fromshar != null) {
    //   print('fromshar is $fromshar');

    //   isdark = fromshar;
    //   emit(AppChangeModeState());
    // } else {

    isdark = !isdark;
    CachHelper.putboolean(key: 'isdark', value: isdark).then((value) {
      print('isdark is $isdark');
      emit(AppChangeModeState());
    });
    // }
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(GetBusinessLoudingState());
    DioHilper.getData(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '480a493a18d645fd828f98ca01756ee6',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(GetBusinessSucessesState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> scinece = [];
  void getSciness() {
    emit(GetScienceLoudingState());
    DioHilper.getData(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '480a493a18d645fd828f98ca01756ee6',
    }).then((value) {
      scinece = value.data['articles'];
      print(scinece[0]['title']);
      emit(GetScienceSucessesState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];
  void getSport() {
    emit(GetsportLoudingState());
    DioHilper.getData(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': '480a493a18d645fd828f98ca01756ee6',
    }).then((value) {
      sport = value.data['articles'];
      print(sport[0]['title']);
      emit(GetsportSucessesState());
    }).catchError((error) {
      print(error.toString());
      emit(GetsportErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    search = [];
    emit(GetSearchLoudingState());

    DioHilper.getData(url: 'v2/everything', quary: {
      'q': '$value',
      'apiKey': '480a493a18d645fd828f98ca01756ee6',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);

      emit(GetSearchSucessesState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErrorState(error.toString()));
    });
  }

  void finishSearch(List list) {
    list.clear();
    emit(FinishSearchState());
  }
}
