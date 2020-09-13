import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/shops/shops_bloc.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/models/models.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/screens/shop_details.dart';
import 'package:mawy_app/widgest/search_container.dart';


class StoresScreen extends StatefulWidget {
  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {

  ShopsBloc shopsBloc;
  @override
  void initState() {
    shopsBloc = BlocProvider.of<ShopsBloc>(context);
    shopsBloc.add(GetShops());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
      ),
      body: Center(
        child: Column(
          children: [
            SearchContainer(),
            Container(height: MediaQuery.of(context).size.height*0.05,color: Colors.grey,),
            Expanded(
              child: BlocBuilder<ShopsBloc , ShopsState>(builder: (context , state){
                if (state is ShopsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ShopsLoaded) {
                  return _listOfShops(shops: state.shops);
                } else if (state is ErrorInFetchShops) {
                  return Text(state.message);
                }
                return Center(child: CircularProgressIndicator());
              }),
            )
          ],
        ),
      ),
    );
  }
}

Widget _listOfShops({List<ShopData> shops}){
  return GridView.builder(
      shrinkWrap: true,
      itemCount: shops.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          childAspectRatio: 0.8
      ),
      itemBuilder: (context , index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              normalShift(context, ShopDetails(shop: shops[index],));
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.1,
              decoration: BoxDecoration(
                  color: MAIN_COLOR,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.white,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(shops[index].shopName ?? "", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}