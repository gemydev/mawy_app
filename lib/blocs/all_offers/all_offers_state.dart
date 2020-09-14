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

class OfferAdding extends AllOffersState {
  @override
  List<Object> get props => [];
}

class OfferAdded extends AllOffersState {
  @override
  List<Object> get props => [];
}

class ErrorInAdding extends AllOffersState{
  final String message ;
  ErrorInAdding({this.message});

  @override
  List<Object> get props => [message];
}

class MyAllOffersLoaded extends AllOffersState{
  final List<Offer> myOffers;
  MyAllOffersLoaded({this.myOffers});

  @override
  List<Object> get props => [myOffers];
}

class MyWaitOffersLoaded extends AllOffersState{
  final List<Offer> myWaitOffers;
  MyWaitOffersLoaded({this.myWaitOffers});

  @override
  List<Object> get props => [myWaitOffers];
}

class MyRefusedOffersLoaded extends AllOffersState{
  final List<Offer> myRefusedOffers;
  MyRefusedOffersLoaded({this.myRefusedOffers});

  @override
  List<Object> get props => [myRefusedOffers];
}
