import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novanews/core/theme/app_colors.dart';
import 'package:novanews/core/theme/app_images.dart';
import 'package:novanews/core/theme/app_styles.dart';
import 'package:novanews/core/widgets/custom_buttom.dart';
import 'package:novanews/features/auth/cubit/appauth/appauth_cubit.dart';
import 'package:novanews/features/auth/presentation/screens/login_screen.dart';

import 'package:novanews/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:novanews/features/home/presentations/screens/home_page.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return BlocConsumer<AppAuthCubit, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
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
                padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: SizedBox(
                      //     width: 250,
                      //     height: 120,
                      //     child: Image(image: AssetImage(AppImage.logo)),
                      //   ),
                      // ),
                      Center(
                        child: Text(
                          "Join the Inner Circle ",
                          style: AppStyles.headlineStyle.copyWith(fontSize: 30),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Experience journalism refined for ",
                          style: AppStyles.midHeadlineStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          " the modern executive. ",
                          style: AppStyles.midHeadlineStyle,
                        ),
                      ),
                      SizedBox(height: 30),
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 500,
                          height: 700,
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
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Full Name",
                                  style: AppStyles.description.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                CustomTextField(
                                  puffIcon: Icons.person_outline,
                                  hintText: " Enter your full name",
                                  controller: userNameController,
                                  hintStyle: AppStyles.textField,
                                  radius: 5,
                                  fillColor: AppColors.white,
                                  filled: true,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Work Email",
                                  style: AppStyles.description.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                CustomTextField(
                                  puffIcon: Icons.email_outlined,
                                  hintText: " Enter your email",
                                  controller: emailController,
                                  hintStyle: AppStyles.textField,
                                  radius: 5,
                                  fillColor: AppColors.white,
                                  filled: true,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Password",
                                  style: AppStyles.description.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                CustomTextField(
                                  puffIcon: Icons.lock,
                                  isPassword: true,
                                  hintText: " Enter your Password",
                                  hintStyle: AppStyles.textField,
                                  controller: passwordController,
                                  radius: 5,
                                  fillColor: AppColors.white,
                                  filled: true,
                                  suffixIcon: Icons.visibility_off,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Confirm Password",
                                  style: AppStyles.description.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                CustomTextField(
                                  puffIcon: Icons.verified_user_outlined,
                                  isPassword: true,
                                  hintText: " Confirm your Password",
                                  hintStyle: AppStyles.textField,
                                  controller: passwordController,
                                  radius: 5,
                                  fillColor: AppColors.white,
                                  filled: true,
                                  suffixIcon: Icons.visibility_off,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      activeColor: AppColors.primaryBlue
                                          .withOpacity(0.8),
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          isChecked = newValue ?? false;
                                        });
                                      },
                                    ),

                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: "I agree to the ",
                                            ),
                                            TextSpan(
                                              text: "Terms of Service",
                                              style: TextStyle(
                                                color: AppColors.primaryBlue
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            const TextSpan(text: " and "),
                                            TextSpan(
                                              text: "Privacy Policy",
                                              style: TextStyle(
                                                color: AppColors.primaryBlue
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            const TextSpan(
                                              text:
                                                  " including the use of cookies.",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),

                                state is AppAuthLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : CustomButton(
                                        text: "Sign Up",
                                        radius: 10.0,
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<AppAuthCubit>(
                                              context,
                                            ).signUp(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              username: userNameController.text,
                                            );
                                          }
                                        },
                                        color: AppColors.primaryBlue,
                                        style: AppStyles.textButtonWhite,
                                      ),
                                SizedBox(height: 30),
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
                                SizedBox(height: 30),
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
                                        text: "Apple",
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          "Knowledge is the only bridge to an informed future.",
                          style: AppStyles.description.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryText.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppImage.logo2, width: 80, height: 40),
                          Text(
                            "Already have an account? ",
                            style: AppStyles.description.copyWith(
                              fontSize: 14,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Log In",
                                style: AppStyles.description.copyWith(
                                  fontSize: 14,
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          "©2024 NovaNews Editorial Group.All rights reserved.\nGlobal Support       Press Inquiries     System Status ",
                          style: AppStyles.description.copyWith(
                            fontSize: 13,
                            color: AppColors.primaryText.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
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
