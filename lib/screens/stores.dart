import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/widgest/search_container.dart';
class StoresScreen extends StatefulWidget {
  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
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
              child: GridView.builder(
                shrinkWrap: true,
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.8
                  ),
                  itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              child: Text("store name", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}