import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/repositries/categories.dart';
import 'package:mawy_app/functions/work_with_api/categories.dart';
import 'package:mawy_app/widgest/list_of_offers.dart';
import 'package:mawy_app/widgest/search_container.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  AllOffersBloc allOffersBloc;
  CategoriesRepositoryApi repositoryOfCategories;
  @override
  void initState() {
    allOffersBloc = BlocProvider.of<AllOffersBloc>(context);
    allOffersBloc.add(FetchAllOffers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
      ),
      body: Column(
        children: [
          SearchContainer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.045,
            child: FutureBuilder(
              future:  getAllCategories() ,
                builder: (context , AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 2 , bottom: 2 , left: 2 , right: 2),
                        child: Container(
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(snapshot.data[index].name.toString()),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      );
                    });
              }else{
                return Container(color: Colors.transparent,);
              }
            }),
          ),
          Expanded(
            child: BlocBuilder<AllOffersBloc, AllOffersState>(
                builder: (context, state) {
              if (state is OffersLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is OffersLoaded) {
                return listOfOffers(offers: state.allOffers);
              } else if (state is ErrorInFetch) {
                return Text(state.message);
              }
              return Center(child: CircularProgressIndicator());
            }),
          )
        ],
      ),
    );
  }
}


