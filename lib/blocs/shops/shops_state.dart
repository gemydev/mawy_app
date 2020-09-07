part of 'shops_bloc.dart';

abstract class ShopsState extends Equatable {
  const ShopsState();
}

class ShopsInitial extends ShopsState {
  @override
  List<Object> get props => [];
}

class ShopsLoaded extends ShopsState{
  final List<ShopData> shops;
  ShopsLoaded({this.shops});

  @override
  List<Object> get props => [shops];
}

class ShopsLoading extends ShopsState {
  @override
  List<Object> get props => [];
}


class ErrorInFetchShops extends ShopsState{
  final String message ;
  ErrorInFetchShops({this.message});

  @override
  List<Object> get props => [message];
}