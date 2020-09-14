part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoriesLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoriesLoaded extends CategoryState {
  final List<FullCategory> categories;

  CategoriesLoaded({this.categories});

  @override
  List<Object> get props => [];
}

class ErrorCategories extends CategoryState {
  final String message;
  ErrorCategories({this.message});

  @override
  List<Object> get props => [message];
}
