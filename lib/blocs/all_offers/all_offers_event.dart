part of 'all_offers_bloc.dart';

abstract class AllOffersEvent extends Equatable {
  const AllOffersEvent();
}

class FetchAllOffers extends AllOffersEvent {
  @override
  List<Object> get props => [];
}
