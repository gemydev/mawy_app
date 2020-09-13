import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mawy_app/data/models/categories.dart';
import 'package:mawy_app/data/repositries/repositries.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoriesRepository repository ;
  CategoryBloc({this.repository}) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is FetchCategories) {
      yield CategoriesLoading();
      try {
        final categories = await repository.getAllCategories();
        yield CategoriesLoaded(categories: categories);
      } catch (e) {
        yield ErrorCategories(message: e.toString());
      }
    }
  }
}
