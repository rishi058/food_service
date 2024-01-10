import 'package:flutter/material.dart';
import 'package:food_delivery/assets/categories_icon/caegories_icon.dart';
import 'package:food_delivery/dynamic_size.dart';
import 'package:food_delivery/screens/home_page/components/customCard.dart';
import 'package:food_delivery/screens/home_page/components/custom_chip.dart';
import 'package:food_delivery/screens/home_page/components/display_location.dart';
import 'package:food_delivery/services/food_api/get_resturants.dart';
import 'package:food_delivery/services/food_api/interceptor.dart';
import 'package:food_delivery/services/location_api/get_location.dart';
import '../../global_widgets/custom_background.dart';
import '../../models/resturant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  TextEditingController searchKey = TextEditingController();
  List<Restaurant> data = [];
  List<Restaurant> allRestaurants = [];
  String? address ;

  loadData() {

    getLocation().then((value) async {
      if(value!=null){
        String x = value.latitude.toString();
        String y = value.longitude.toString();
        await FoodApi().getRestaurants(x, y).then((value) {
          setState(() {
            address = 'Lat : $x, Lng : $y';
            allRestaurants = value;
            data = value;
          });
        });
      }
    });

  }

  search(String keyWord){
    data.clear();
    for (Restaurant restaurant in allRestaurants) {
      if (restaurant.tags.contains(keyWord)) {
        data.add(restaurant);
      }
    }
    setState(() {});
  }

  filter(){
    if(selectedIndex==0){
      setState(() {
        data = allRestaurants;
      });
    }
    else{
      search(categories[selectedIndex]['category_name']!);
    }
  }

  @override
  void dispose() {
    searchKey.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                displayLocation(address),
                SizedBox(
                  height: 65.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                        child: GestureDetector(
                            onTap: () {
                              selectedIndex = i;
                              filter();
                            },
                            child: customChip(categories[i]['category_name']!,
                                categories[i]['icon']!, selectedIndex == i)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.sp), // Adjust the value as needed
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: const Icon(Icons.search_outlined),
                          ),
                          Expanded(
                            child: TextField(
                              controller: searchKey,
                              onChanged: (_){
                                search(searchKey.text);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search Food Items',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10.h, left: 12.w),
                  child: const Text(
                    'Nearby Restaurants',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                buildLabTests(data)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildLabTests(List<Restaurant> data, ) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 1,
    childAspectRatio: 330 / 170,
    children: List.generate(data.length, (i) {
      return customCard(data[i].primaryImage, data[i].rating.toString(), data[i].name, data[i].discount.toString());
    }),
  );
}

