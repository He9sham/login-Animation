import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:slide_up_login/Helper/Awesome_widgets.dart';
import 'package:slide_up_login/pages/Chat_page.dart';
import 'package:slide_up_login/pages/Cubit/Chat_cubit/chat_cubit.dart';
import 'package:slide_up_login/pages/Cubit/login_cubit/login_cubit.dart';
import 'package:slide_up_login/widgets/show_up_animation.dart';
import 'package:slide_up_login/widgets/text_widget.dart';

import '../widgets/clippers.dart';
import '../widgets/feild_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> fromkey = GlobalKey();

  bool isloading = false;

  /// boolean to check whether the state is login or not
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getmessage();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isloading = false;
        } else if (state is LoginFailuer) {
          Awesome_widgets(
              context, DialogType.error, 'error', state.errormessage);
          isloading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          bottomSheet: ClipPath(
            ///Custom Clipper
            clipper: CustomBottomClip(),

            /// Using gesture detector to change the  isLogin value
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = true;
                });
              },

              /// AnimatedContainer to handle animation
              child: AnimatedContainer(
                /// Duration
                duration: const Duration(milliseconds: 400),

                /// Curve
                curve: Curves.decelerate,
                color: Theme.of(context).primaryColor,

                /// changing the height of bottom sheet with animation using animatedContainer
                height: isLogin ? height * 0.8 : height * 0.1,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: fromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///AnimatedContainer to handle animation of size of the container basically height only
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: isLogin ? 100 : 50,
                        alignment: Alignment.bottomCenter,
                        child: TextUtil(
                          text: "Login",
                          size: 30,
                        ),
                      ),
                      Expanded(
                        /// Using Custom Animated ShowUpAnimated  to handle slide animation of textfield
                        child: isLogin
                            ? ShowUpAnimation(
                                delay: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      /// Custom FieldWidget
                                      FieldWidget(
                                        onchanged: (data) {
                                          email = data;
                                        },
                                        title: "Email",
                                        icon: Icons.mail,
                                      ),
                                      FieldWidget(
                                        obscureText: true,
                                        onchanged: (data) {
                                          password = data;
                                        },
                                        title: "Password",
                                        icon: Icons.key,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColorLight),
                                            onPressed: () async {
                                              if (fromkey.currentState!
                                                  .validate()) {
                                                BlocProvider.of<LoginCubit>(
                                                        context)
                                                    .Login_User(
                                                        email: email!,
                                                        password: password!);
                                              }
                                            },
                                            child: TextUtil(
                                              text: 'Login',
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              ClipPath(
                ///Custom Clipper
                clipper: CustomUpClip(),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: height * 0.3,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColorLight),
                  alignment: Alignment.center,
                  child: InkWell(
                    /// Using Ink well to change the  isLogin value
                    onTap: () {
                      setState(() {
                        isLogin = false;
                      });
                    },
                    child: TextUtil(
                      text: "Sign-up",
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Custom FieldWidget
                    FieldWidget(
                      onchanged: (data) {
                        email = data;
                      },
                      title: "Email",
                      icon: Icons.mail,
                    ),
                    FieldWidget(
                      obscureText: true,
                      onchanged: (data) {
                        password = data;
                      },
                      title: "Password",
                      icon: Icons.key,
                    ),
                    // const FieldWidget(
                    //   title: "Confirm Password",
                    //   icon: Icons.key,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColorLight),
                        onPressed: () async {
                          if (fromkey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).Register_User(
                                email: email!, password: password!);
                          }
                        },
                        child: TextUtil(
                          text: 'Sign-up',
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
    );
  }
}
