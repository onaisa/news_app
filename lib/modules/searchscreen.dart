import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/combonent.dart';
import 'package:news_app/shared/cubit/newsapp_cubit.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();
  final FocusNode _focusnode = FocusNode();
  var list = [];
  @override
  void dispose() {
    list.clear();
    _focusnode.dispose();

    searchcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsappCubit, NewsappState>(
      listener: (context, state) {},
      builder: (context, state) {
        list = NewsappCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  focusNode: _focusnode,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'earch must not be empty';
                    } else
                      return null;
                  },
                  onChanged: (String value) {
                    if (value.isNotEmpty) {
                      print(' value is $value');
                      NewsappCubit.get(context).getSearch(value);
                    } else {
                      NewsappCubit.get(context).finishSearch(list);
                      // setState(() {
                      //   list.clear();
                      // });
                    }
                  },
                  style: Theme.of(context).textTheme.bodyText2,
                  controller: searchcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                    labelText: 'search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: list.isEmpty
                    ? Center(
                        child: Text('not result '),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          if (list.length == 0) {
                            return Center(child: CircularProgressIndicator());
                          } else
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ArtecalesWidget(context, list[index]),
                            );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                            height: 2.0,
                          );
                        },
                        itemCount: list.length),
              )
            ],
          ),
        );
      },
    );
  }
}
