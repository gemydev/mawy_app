part of 'all_offers_bloc.dart';

abstract class AllOffersState extends Equatable {
  const AllOffersState();
}

class AllOffersInitial extends AllOffersState {
  @override
  List<Object> get props => [];
}

class OffersLoading extends AllOffersState {
  @override
  List<Object> get props => [];
}

class OffersLoaded extends AllOffersState {
  final List<Offer> allOffers;
  OffersLoaded({this.allOffers});

  @override
  List<Object> get props => [allOffers];
}

class ErrorInFetch extends AllOffersState{
  final String message ;
  ErrorInFetch({this.message});

  @override
  List<Object> get props => [message];
}