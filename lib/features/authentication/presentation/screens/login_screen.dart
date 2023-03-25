import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/app/presentation/screens/home_screen.dart';
import 'package:traind_app/features/authentication/presentation/screens/sign_up_screen.dart';

import '../components/auth_components.dart';
import '../controller/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return SharedComponents.screenBg(
        imageUrl: '${AppConstants.imagesUrl}$loginBg',
        context: context,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                AuthComponents.rectangleBg(),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppString.loginTitle,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 22.sp,
                              ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AuthComponents.signLogo(
                                raduis: 10.sp,
                                logoImage: google,
                                function: () {}),
                            SizedBox(
                              width: 3.w,
                            ),
                            AuthComponents.signLogo(
                                raduis: 10.sp,
                                logoImage: facebook,
                                function: () {}),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Form(
                            child: Column(
                              children: [
                                SharedComponents.defaultTextField(
                                  controller: cubit.loginUsernameCon,
                                  type: TextInputType.text,
                                  validate: (e) {
                                    return null;
                                  },
                                  label: 'Username',
                                  radius: 30.sp,
                                  bgColor: textFormBgColor,
                                  textColor: textFormTextColor,
                                  focusedRadius: true,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SharedComponents.defaultTextField(
                                  controller: cubit.loginPasswordCon,
                                  type: TextInputType.visiblePassword,
                                  validate: (e) {
                                    return null;
                                  },
                                  label: 'Password',
                                  radius: 30.sp,
                                  bgColor: textFormBgColor,
                                  textColor: textFormTextColor,
                                  focusedRadius: true,
                                  password: cubit.loginPasswordShown,
                                  suffIcon: cubit.loginSuffIcon,
                                  suffPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SharedComponents.defaultButton(
                                  context: context,
                                  function: () {
                                    SharedComponents.navigateToReplace(
                                        HomeScreen(), context);
                                  },
                                  text: 'Login',
                                  width: AppConstants.width(context) / 3,
                                  height: AppConstants.height(context) / 14,
                                  radius: 4,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'don\'t have an account ?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontSize: 16.sp,
                                              color : Color(0xffE4A286),
                                            ),
                                      ),
                                    ),
                                    SharedComponents.defaultTextButton(
                                      function: () {
                                        SharedComponents.navigateToReplace(
                                          SignUpScreen(),
                                          context,
                                        );
                                      },
                                      text: 'Sign up',
                                      context: context,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Colum
          ),
        ),
      );
    });
  }
}
