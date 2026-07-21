import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novanews/core/theme/app_colors.dart';
import 'package:novanews/core/theme/app_images.dart';
import 'package:novanews/core/theme/app_styles.dart';
import 'package:novanews/core/widgets/custom_buttom.dart';
import 'package:novanews/features/auth/cubit/appauth/appauth_cubit.dart';
import 'package:novanews/features/auth/presentation/screens/reset_password.dart';
import 'package:novanews/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:novanews/features/auth/presentation/widgets/custom_row_data.dart';
import 'package:novanews/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:novanews/features/home/presentations/screens/home_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
        if (state is AppAuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.backgroundBlue),

                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Center(
                        child: SizedBox(
                          width: 350,
                          height: 160,
                          child: Image(image: AssetImage(AppImage.logo3)),
                        ),
                      ),

                      // Text("Login ", style: AppStyles.headlineStyle),
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 500,
                          height: 600,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryText.withOpacity(0.2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "Welcome back!",
                                    style: AppStyles.onBoardTitle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Access your personalized briefing.",
                                    style: AppStyles.description,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "Work Email",
                                  style: AppStyles.description.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  hintText: " Enter your email",
                                  controller: emailController,
                                  hintStyle: AppStyles.textField,
                                  radius: 15,
                                  fillColor: AppColors.secondaryText
                                      .withOpacity(0.1),
                                  filled: true,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 10),
                                CustomRowData(
                                  text: "Password ",

                                  textButtom: "Forget Your Password?",
                                  screenName: ResetPasswordScreen(),
                                ),
                                // Text("Password", style: AppStyles.description),
                                CustomTextField(
                                  isPassword: true,
                                  hintText: " Enter your Password",
                                  hintStyle: AppStyles.textField,
                                  controller: passwordController,
                                  radius: 15,
                                  fillColor: AppColors.secondaryText
                                      .withOpacity(0.1),
                                  filled: true,
                                  suffixIcon: Icons.visibility_off,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 20),

                                state is AppAuthLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : CustomButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<AppAuthCubit>(
                                              context,
                                            ).login(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                          }
                                        },
                                        text: "Log In",
                                        radius: 12.0,
                                        color: AppColors.primaryBlue,
                                        style: AppStyles.textButtonWhite
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "OR CONTINUE WITH",
                                    style: AppStyles.description.copyWith(
                                      fontSize: 12,
                                      color: AppColors.primaryText.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen(),
                                            ),
                                          );
                                        },
                                        text: "Google",
                                        radius: 12.0,
                                        color: AppColors.white,
                                        style: AppStyles.description.copyWith(
                                          fontSize: 18,
                                          color: AppColors.primaryText,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: CustomButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen(),
                                            ),
                                          );
                                        },
                                        text: "Linked In",
                                        radius: 12.0,
                                        color: AppColors.white,
                                        style: AppStyles.description.copyWith(
                                          fontSize: 18,
                                          color: AppColors.primaryText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                CustomRowData(
                                  text: "Don't have an account ? ",
                                  textButtom: "Sign Up ",
                                  screenName: SignUpScreen(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "© 2024 NovaNe`ws Media Group. All rights reserved\nPrivacy Policy • Terms of Service ",
                          style: AppStyles.description.copyWith(
                            fontSize: 12,
                            color: AppColors.primaryText.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
