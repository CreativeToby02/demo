import 'package:demo_app/ui/common/bottom_nav_bar.dart';
import 'package:demo_app/ui/screens/forgot_password/confirm_email_code_screen.dart';
import 'package:demo_app/ui/screens/forgot_password/enter_code_screen.dart';
import 'package:demo_app/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:demo_app/ui/screens/forgot_password/reset_password.dart';
import 'package:demo_app/ui/screens/home/cart_screen.dart';
import 'package:demo_app/ui/screens/home/checkout_screen.dart';
import 'package:demo_app/ui/screens/home/home.dart';
import 'package:demo_app/ui/screens/home/notification_screen.dart';
import 'package:demo_app/ui/screens/home/product_detail_screen.dart';
import 'package:demo_app/ui/screens/home/review_screen.dart';
import 'package:demo_app/ui/screens/home/saved_item_screen.dart';
import 'package:demo_app/ui/screens/home/search_screen.dart';
import 'package:demo_app/ui/screens/home/user_account_screen.dart';
import 'package:demo_app/ui/screens/login/login_screen.dart';
import 'package:demo_app/ui/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  initialLocation: SignupScreen.route,
  routes: <GoRoute>[
    GoRoute(
      path: BottomNavigator.route,
      name: BottomNavigator.name,
      builder: (BuildContext context, GoRouterState state) =>
          const BottomNavigator(),
    ),
    GoRoute(
      path: SignupScreen.route,
      name: SignupScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SignupScreen(),
    ),
    GoRoute(
      path: LoginScreen.route,
      name: LoginScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    GoRoute(
      path: ResetPasswordScreen.route,
      name: ResetPasswordScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ResetPasswordScreen(),
    ),
    GoRoute(
      path: ForgotPasswordScreen.route,
      name: ForgotPasswordScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: EnterCodeScreen.route,
      name: EnterCodeScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const EnterCodeScreen(),
    ),
    GoRoute(
      path: HomeScreen.route,
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: SearchScreen.route,
      name: SearchScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SearchScreen(),
    ),
    GoRoute(
      path: NotificationScreen.route,
      name: NotificationScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const NotificationScreen(),
    ),
    GoRoute(
      path: SavedItemScreen.route,
      name: SavedItemScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SavedItemScreen(),
    ),
    GoRoute(
      path: CartScreen.route,
      name: CartScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const CartScreen(),
    ),
    GoRoute(
      path: UserAccountScreen.route,
      name: UserAccountScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const UserAccountScreen(),
    ),
    GoRoute(
      path: ProductDetailScreen.route,
      name: ProductDetailScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ProductDetailScreen(),
    ),
    GoRoute(
      path: ReviewScreen.route,
      name: ReviewScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ReviewScreen(),
    ),
    GoRoute(
      path: EmailCodeConfirmationScreen.route,
      name: EmailCodeConfirmationScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const EmailCodeConfirmationScreen(),
    ),
    GoRoute(
      path: CheckoutScreen.route,
      name: CheckoutScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const CheckoutScreen(),
    ),
  ],
);
