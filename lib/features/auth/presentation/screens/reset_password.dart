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

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
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
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(AppImage.logo2),
                            width: 150,
                            height: 50,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.question_mark_rounded,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),

                      // Text("Login ", style: AppStyles.headlineStyle),
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 500,
                          height: 500,
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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image(
                                      image: AssetImage(AppImage.icon),
                                      width: 180,
                                      height: 70,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      "Reset Password",
                                      style: AppStyles.onBoardTitle,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Lost your way? Enter your email and \n we'll help you get back to your news.",
                                      style: AppStyles.description.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "Email Address",
                                    style: AppStyles.description.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomTextField(
                                    puffIcon: Icons.email,
                                    hintText: " Enter your email",
                                    controller: emailController,
                                    hintStyle: AppStyles.textField,
                                    radius: 15,
                                    fillColor: AppColors.secondaryText
                                        .withOpacity(0.1),
                                    filled: true,
                                    maxLines: 1,
                                  ),

                                  SizedBox(height: 30),

                                  state is AppAuthLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : CustomButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              BlocProvider.of<AppAuthCubit>(
                                                context,
                                              ).login(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                            }
                                          },
                                          text: "Send Reset Link  > ",
                                          radius: 12.0,
                                          color: AppColors.primaryBlue,
                                          style: AppStyles.textButtonWhite
                                              .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                  SizedBox(height: 20),

                                  SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        " <  Back to Login",
                                        style: AppStyles.textButtonBlue
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
