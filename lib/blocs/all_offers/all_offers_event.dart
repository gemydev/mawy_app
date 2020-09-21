part of 'all_offers_bloc.dart';

abstract class AllOffersEvent extends Equatable {
  const AllOffersEvent();
}

class FetchAllOffers extends AllOffersEvent {
  @override
  List<Object> get props => [];
}

class FetchMyAllOffers extends AllOffersEvent {
  final int shopId;

  FetchMyAllOffers({this.shopId});

  @override
  List<Object> get props => [shopId];
}

class FetchWaitOffers extends AllOffersEvent {
  final int shopId;

  FetchWaitOffers({this.shopId});
  @override
  List<Object> get props => [shopId];
}

class FetchRefusedOffers extends AllOffersEvent {
  final int shopId;

  FetchRefusedOffers({this.shopId});
  @override
  List<Object> get props => [shopId];
}

class AddOffer extends AllOffersEvent {
  final String offerName;
  final List<FullCategory> selectedCategories;
  final String copon;
  final String shopID;
  final String cityId;

  AddOffer(
      {this.selectedCategories,
      this.copon,
      this.shopID,
      this.cityId,
      this.offerName,
      });

  @override
  List<Object> get props => [];
}
