import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/screens/auth/signup_screen.dart';
import 'package:food_delivery_app/screens/dashbord/bottom_navbar.dart';
import 'package:food_delivery_app/screens/slider/slider_screen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "WIDE VARIETY OF FOOD",
        description: "Explore our Different variety of foods",
        short: "best for you",
        image: "assets/slider_image1.png"),
    SliderPage(
        title: "FAST DELIVERY",
        description: "Fast delivery with a few miniutes",
        short: "of ordering",
        image: "assets/slider_image2.png"),
    SliderPage(
        title: "TASTY AND YUMMY",
        description: "Freshly prepared with the best recipe to",
        short: "give a very sweet taste",
        image: "assets/slider_image3.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
            top: 550.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10.h,
                          width: (index == _currentPage) ? 30.w : 8.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 24.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.orangeAccent
                                  : Colors.black12));
                    })),
                InkWell(
                  onTap: () {
                    (_currentPage == (_pages.length - 1))
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ))
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOutQuint);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 54.h,
                      width:
                          (_currentPage == (_pages.length - 1)) ? 150.w : 150.w,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(32)),
                      child: (_currentPage == (_pages.length - 1))
                          ? Text(
                              "GET STARTED",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-Light'),
                            )
                          : Text(
                              'NEXT ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
