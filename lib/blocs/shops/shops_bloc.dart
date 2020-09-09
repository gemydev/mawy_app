import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mawy_app/data/models/models.dart';
import 'package:mawy_app/data/repositries/repositries.dart';


part 'shops_event.dart';
part 'shops_state.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  ShopsRepository repository ;
  ShopsBloc({this.repository}) : super(ShopsInitial());

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
