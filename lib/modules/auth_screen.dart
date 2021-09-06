import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_regestration/shared/constants.dart';
import 'package:login_regestration/shared/widgets/login_form.dart';
import 'package:login_regestration/shared/widgets/sign_up_form.dart';
import 'package:login_regestration/shared/widgets/social_media.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animatedController;

  late Animation<double> _animationTextRotate;
  void setUpAnimation() {
    _animatedController = AnimationController(
      vsync: this,
      duration: defaultDuration,
    );

    _animationTextRotate = Tween<double>(
      begin: 0.0,
      end: 90.0,
    ).animate(_animatedController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animatedController.forward()
        : _animatedController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animatedController,
        builder: (context, _) {
          return Stack(
            children: [
              // Login Form
              AnimatedPositioned(
                width: _size.width * 0.88,
                height: _size.height,
                left: _isShowSignUp ? -_size.width * 0.76 : 0.0,
                duration: defaultDuration,
                child: Container(
                  color: login_bg,
                  child: LoginForm(),
                ),
              ),
              AnimatedPositioned(
                width: _size.width * 0.88,
                height: _size.height,
                left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                // right: _size.width * 0.12,
                duration: defaultDuration,
                child: Container(
                  color: signup_bg,
                  child: SignUpForm(),
                ),
              ),
              //Logo
              AnimatedPositioned(
                top: _size.width * 0.1,
                left: 0.0,
                right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                duration: defaultDuration,
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white60,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: _isShowSignUp
                        ? SvgPicture.asset(
                            'assets/animation_logo.svg',
                            color: signup_bg,
                          )
                        : SvgPicture.asset(
                            'assets/animation_logo.svg',
                            color: login_bg,
                          ),
                  ),
                ),
              ),
              //Social Media Buttons
              AnimatedPositioned(
                right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                width: _size.width,
                bottom: _size.height * 0.1,
                duration: defaultDuration,
                child: SocialMedia(),
              ),
              //  Login Text
              AnimatedPositioned(
                bottom: _isShowSignUp
                    ? _size.height / 2 - 80.0
                    : _size.height * 0.3,
                left: _isShowSignUp ? 0.0 : _size.width * 0.44 - 80.0,
                duration: defaultDuration,
                child: AnimatedDefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _isShowSignUp ? 20.0 : 32.0,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  duration: defaultDuration,
                  child: Transform.rotate(
                    angle: -_animationTextRotate.value * pi / 180.0,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          updateView();
                        } else {
                          //  Login
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        width: 160.0,
                        child: Text(
                          'Log in'.toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: !_isShowSignUp
                    ? _size.height / 2 - 80.0
                    : _size.height * 0.3,
                right: _isShowSignUp ? _size.width * 0.44 - 80.0 : 0.0,
                duration: defaultDuration,
                child: AnimatedDefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: !_isShowSignUp ? 20.0 : 32.0,
                    fontWeight: FontWeight.bold,
                    color: !_isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  duration: defaultDuration,
                  child: Transform.rotate(
                    angle: (90.0 - _animationTextRotate.value) * pi / 180.0,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                        } else {
                          updateView();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        width: 160.0,
                        child: Text(
                          'Sign up'.toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
