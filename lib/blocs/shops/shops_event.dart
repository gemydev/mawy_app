part of 'shops_bloc.dart';

abstract class ShopsEvent extends Equatable {
  const ShopsEvent();
}

class GetShops extends ShopsEvent{
  @override
  List<Object> get props => throw UnimplementedError();
}
