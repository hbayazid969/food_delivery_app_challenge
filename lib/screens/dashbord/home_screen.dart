import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:food_delivery_app/models/model.dart';
import 'package:food_delivery_app/screens/dashbord/item_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var item_list = ['PIZZA', 'BURGER', 'DRINKS', 'SNACKS', 'COMBO'];

  int SelectedIndex = 0;

  double? _ratingValue;

  PageController _pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(children: [
              SizedBox(
                height: 10.h,
              ),
              Row(children: [
                Container(
                  height: 50.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                        ),
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                    height: 50.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.line_weight,
                      color: Colors.white,
                    ))
              ]),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 50.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item_list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            SelectedIndex = index;
                            _pagecontroller.jumpToPage(index);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10.w),
                          height: 50.h,
                          child: Center(
                            child: Text(
                              item_list[index],
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: PageView(
                  controller: _pagecontroller,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 5 / 8,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: pizzaList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsScren(
                                              img: pizzaList[index].img,
                                              name: pizzaList[index].name,
                                              description:
                                                  pizzaList[index].description,
                                              price: pizzaList[index].price,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: 230.h,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.h),
                                                child: Image.asset(
                                                  '${pizzaList[index].img}',
                                                  height: 95.h,
                                                  width: 100.w,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: Text(
                                                '${pizzaList[index].name}',
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  bottom: 10.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '\$${pizzaList[index].price}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5.h,
                                      right: 8.w,
                                      child: Icon(Icons.favorite_outline))
                                ],
                              );
                            }),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 5 / 8,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: burgerList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsScren(
                                              img: burgerList[index].img,
                                              name: burgerList[index].name,
                                              description:
                                                  burgerList[index].description,
                                              price: burgerList[index].price,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: 230.h,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.h),
                                                child: Image.asset(
                                                  '${burgerList[index].img}',
                                                  height: 95.h,
                                                  width: 100.w,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: Text(
                                                '${burgerList[index].name}',
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  bottom: 10.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '\$${burgerList[index].price}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5.h,
                                      right: 8.w,
                                      child: Icon(Icons.favorite_outline))
                                ],
                              );
                            }),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 5 / 8,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: drinkstList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsScren(
                                              img: drinkstList[index].img,
                                              name: drinkstList[index].name,
                                              description: drinkstList[index]
                                                  .description,
                                              price: drinkstList[index].price,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: 230.h,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.h),
                                                child: Image.asset(
                                                  '${drinkstList[index].img}',
                                                  height: 95.h,
                                                  width: 100.w,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: Text(
                                                '${drinkstList[index].name}',
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  bottom: 10.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '\$${drinkstList[index].price}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5.h,
                                      right: 8.w,
                                      child: Icon(Icons.favorite_outline))
                                ],
                              );
                            }),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 5 / 8,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: snacksList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsScren(
                                              img: snacksList[index].img,
                                              name: snacksList[index].name,
                                              description:
                                                  snacksList[index].description,
                                              price: snacksList[index].price,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: 230.h,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.h),
                                                child: Image.asset(
                                                  '${snacksList[index].img}',
                                                  height: 95.h,
                                                  width: 100.w,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: Text(
                                                '${snacksList[index].name}',
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  bottom: 10.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '\$${snacksList[index].price}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5.h,
                                      right: 8.w,
                                      child: Icon(Icons.favorite_outline))
                                ],
                              );
                            }),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 5 / 8,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: comboList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsScren(
                                              img: comboList[index].img,
                                              name: comboList[index].name,
                                              description:
                                                  comboList[index].description,
                                              price: comboList[index].price,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      child: Container(
                                        height: 230.h,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.h),
                                                child: Image.asset(
                                                  '${comboList[index].img}',
                                                  height: 95.h,
                                                  width: 100.w,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: Text(
                                                '${comboList[index].name}',
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  top: 5.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  right: 10.w,
                                                  bottom: 10.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '\$${comboList[index].price}',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5.h,
                                      right: 8.w,
                                      child: Icon(Icons.favorite_outline))
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}
