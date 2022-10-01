import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:food_delivery_app/screens/auth/signup_screen.dart';
import 'package:food_delivery_app/screens/dashbord/bottom_navbar.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 180.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.40,
                    fontFamily: 'Poppins-Regular'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Please sign in to continue',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    hintText: 'EMAIL',
                    prefixIcon: Icon(Icons.mail)),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    hintText: 'PASSWORD',
                    prefixIcon: Icon(Icons.lock)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(),
                        ));
                  },
                  child: Container(
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SIGN IN',
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Center(
                child: Wrap(
                  children: [
                    Text('Don \'t have account?',
                        style: TextStyle(fontSize: 16.sp)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.orange, fontSize: 16.sp),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
