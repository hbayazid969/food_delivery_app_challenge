import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:food_delivery_app/screens/auth/signin_screen.dart';
import 'package:food_delivery_app/screens/dashbord/bottom_navbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 80.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.40,
                    fontFamily: 'Poppins-Regular'),
              ),
              SizedBox(
                height: 40.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    hintText: 'FULL NAME',
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 30.h,
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
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    hintText: 'CONFIRM PASSWORD',
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
                          builder: (context) => const BottomNavbar(),
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
                          'SIGN UP',
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
                    Text('Already have account?',
                        style: TextStyle(fontSize: 16.sp)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ));
                      },
                      child: Text(
                        'Sign in',
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
