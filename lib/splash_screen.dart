import 'package:flutter/material.dart';
import 'dart:math';
import 'login_page.dart';
import 'sign_up_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool showSignIn = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        showSignIn = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الدوائر المتحركة
          ..._buildAnimatedCircles(),

          Center(
            child: Image.asset(
              'assets/images/dr.png',
              width: 500,
            ),
          ),
          // قسم Sign In / Sign Up
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            bottom: showSignIn ? 0 : -300,
            left: 0,
            right: 0,
            child: _buildSignInSection(context),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAnimatedCircles() {
    return [
      _buildAnimatedCircle(60, 50, 50, 0, Alignment.topLeft),
      _buildAnimatedCircle(-100, 120, 120, pi / 2, Alignment.topRight),
      _buildAnimatedCircle(300, 90, 90, pi, Alignment.centerLeft),
      _buildAnimatedCircle(240, 40, 40, 3 * pi / 2, Alignment.centerRight),
      _buildStaticCircle(-150, 200, Alignment.bottomLeft),
    ];
  }

  Widget _buildAnimatedCircle(double offset, double radius, double size, double phase, Alignment alignment) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: alignment.y == Alignment.bottomLeft.y ? null : offset + 20 * sin(_controller.value * 2 * pi + phase),
          bottom: alignment.y == Alignment.bottomLeft.y ? offset : null,
          left: alignment.x == Alignment.bottomLeft.x ? offset : null,
          right: alignment.x == Alignment.topRight.x ? offset : null,
          child: CircleAvatar(
            radius: size,
            backgroundColor: Color(0xFF5B2D50),
          ),
        );
      },
    );
  }

  Widget _buildStaticCircle(double offset, double size, Alignment alignment) {
    return Positioned(
      bottom: alignment == Alignment.bottomLeft ? offset : null,
      left: alignment == Alignment.bottomLeft ? offset : null,
      right: alignment == Alignment.bottomRight ? offset : null,
      child: CircleAvatar(
        radius: size,
        backgroundColor: Color(0xFF5B2D50),
      ),
    );
  }

  Widget _buildSignInSection(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF5B2D50),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In / Sign Up",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Welcome to Your Health Care App\nWe hope to be a useful resource for your health journey!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
