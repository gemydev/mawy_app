import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/shops/shops_bloc.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/models/models.dart';
import 'package:mawy_app/widgest/drop_down_button.dart';
import 'package:mawy_app/widgest/list_of_shops.dart';
import 'package:mawy_app/widgest/search_container.dart';

class StoresScreen extends StatefulWidget {
  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  ShopsBloc shopsBloc;
  TextEditingController _searchQueryInShops;
  List<ShopData> filteredShopRecord = [];
  List<ShopData> shopsList ;
  String dropDownValue ;

  @override
  void initState() {

    _searchQueryInShops = new TextEditingController();
    shopsBloc = BlocProvider.of<ShopsBloc>(context);
    shopsBloc.add(GetShops());
    dropDownValue = "الكل";
    super.initState();
  }

  @override
  void dispose() {
    shopsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        title: dropDownButton(
            dropdownValue: dropDownValue,
          function: updateShopSearchQueryDrop
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            searchBox(
                context: context,
                controller: _searchQueryInShops,
                updateFunction: updateSearchQuery),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              color: Colors.grey,
            ),
            Expanded(
              child:
                  BlocBuilder<ShopsBloc, ShopsState>(builder: (context, state) {
                if (state is ShopsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ShopsLoaded) {
                  shopsList = state.shops;
                  return filteredShopRecord != null &&
                          filteredShopRecord.length > 0
                      ? listOfShops(shops: filteredShopRecord)
                      : shopsList == null
                          ? new Center(child: new CircularProgressIndicator())
                          : listOfShops(shops: shopsList);
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

  void updateSearchQuery(String newQuery) {
    filteredShopRecord.clear();
    if (newQuery.length > 0) {
      Set<ShopData> set = Set.from(shopsList);
      set.forEach((element) => filterList(element, newQuery));
    }

    if (newQuery.isEmpty) {
      filteredShopRecord.addAll(shopsList);
    }
    setState(() {});
  }

  filterList(ShopData shop, String searchQuery) {
    setState(() {
      if (shop.shopName.toLowerCase().contains(searchQuery) ||
          shop.shopName.contains(searchQuery) ) {
        filteredShopRecord.add(shop);
      }
    });
  }

  void updateShopSearchQueryDrop(String selectedItem) {
    filteredShopRecord.clear();
    if (selectedItem.length > 0) {
      Set<ShopData> set = Set.from(shopsList);
      set.forEach((element) => filterShopsListDrop(element, selectedItem));
    }

    if (selectedItem.isEmpty) {
      filteredShopRecord.addAll(shopsList);
    }
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      dropDownValue = selectedItem;
    });
  }

  filterShopsListDrop(ShopData shop, String searchQuery) {
    setState(() {
      if (shop.cityName == searchQuery ) {
        filteredShopRecord.add(shop);
      }
    });
  }
}
