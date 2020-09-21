import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mawy_app/data/models/categories.dart';
import 'package:mawy_app/data/models/offers.dart';
import 'package:mawy_app/data/repositries/repositries.dart';


part 'all_offers_event.dart';
part 'all_offers_state.dart';

class AllOffersBloc extends Bloc<AllOffersEvent, AllOffersState> {
  AllOffersRepository repository;
  AllOffersBloc({this.repository}) : super(AllOffersInitial());

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
    if(event is AddOffer){
      yield OfferAdding();
      try {
        await repository.makeOffer(
          shopId: event.shopID,
          name: event.offerName,
          categoryId: event.selectedCategories,
        );
        yield OfferAdded();
      } catch (e) {
        yield ErrorInFetch(message: e.toString());
      }
    }
    if(event is FetchMyAllOffers){
      yield OffersLoading();
      try {
        final offers = await repository.getAllMyOffers(shopId: event.shopId);
        yield OffersLoaded(allOffers: offers);
      } catch (e) {
        yield ErrorInFetch(message: e.toString());
      }
    }
    if(event is FetchWaitOffers){
      yield OffersLoading();
      try {
        final offers = await repository.getMyWaitOffers(shopId: event.shopId);
        yield MyWaitOffersLoaded(myWaitOffers: offers);
      } catch (e) {
        yield ErrorInFetch(message: e.toString());
      }
    }
    if(event is FetchRefusedOffers){
      yield OffersLoading();
      try {
        final offers = await repository.getMyRefusedOffers(shopId: event.shopId);
        yield MyRefusedOffersLoaded(myRefusedOffers: offers);
      } catch (e) {
        yield ErrorInFetch(message: e.toString());
      }
    }
  }
}
