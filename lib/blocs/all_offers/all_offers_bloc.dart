import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mawy_app/blocs/all_offers/all_offers_repo.dart';
import 'package:mawy_app/models/offers.dart';

part 'all_offers_event.dart';
part 'all_offers_state.dart';

class AllOffersBloc extends Bloc<AllOffersEvent, AllOffersState> {
  AllOffersRepository repository;
  AllOffersBloc() : super(AllOffersInitial());

  @override
  Stream<AllOffersState> mapEventToState(
    AllOffersEvent event,
  ) async* {
    if (event is FetchAllOffers) {
      yield OffersLoading();
      try {
        final offers = await repository.getAllOffers();
        yield OffersLoaded(allOffers: offers);
      } catch (e) {
        yield ErrorInFetch(message: e.toString());
      }
    }
  }
}
