import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mawy_app/blocs/shops/shop_repo.dart';
import 'package:mawy_app/models/shop.dart';

part 'shops_event.dart';
part 'shops_state.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  ShopsRepository repository ;
  ShopsBloc() : super(ShopsInitial());

  @override
  Stream<ShopsState> mapEventToState(
    ShopsEvent event,
  ) async* {
    if (event is GetShops) {
      yield ShopsLoading();
      try {
        final shops = await repository.getAllShops();
        yield ShopsLoaded(shops: shops);
      } catch (e) {
        yield ErrorInFetchShops(message: e.toString());
      }
    }

  }
}
