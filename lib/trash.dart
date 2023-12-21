// Expanded(
//                 child: SizedBox(
//                   height: 600,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   GoRouter.of(context)
//                                       .push(ProductDetailScreen.route);
//                                 },
//                                 child: ProductSale(
//                                   productName: 'T-shirt',
//                                   isSelected: savedItem,
//                                   onTap: () {
//                                     setState(() {
//                                       savedItem = !savedItem;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   GoRouter.of(context)
//                                       .push(ProductDetailScreen.route);
//                                 },
//                                 child: ProductSale(
//                                   productName: 'Cardigan',
//                                   isSelected: savedItem,
//                                   onTap: () {
//                                     setState(() {
//                                       savedItem = !savedItem;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   GoRouter.of(context)
//                                       .push(ProductDetailScreen.route);
//                                 },
//                                 child: ProductSale(
//                                   productName: 'High Boots',
//                                   isSelected: savedItem,
//                                   onTap: () {
//                                     setState(() {
//                                       savedItem = !savedItem;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   GoRouter.of(context)
//                                       .push(ProductDetailScreen.route);
//                                 },
//                                 child: ProductSale(
//                                   productName: 'Jeans',
//                                   isSelected: savedItem,
//                                   onTap: () {
//                                     setState(() {
//                                       savedItem = !savedItem;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   GoRouter.of(context)
//                                       .push(ProductDetailScreen.route);
//                                 },
//                                 child: ProductSale(
//                                   productName: 'Snickers',
//                                   isSelected: savedItem,
//                                   onTap: () {
//                                     setState(() {
//                                       savedItem = !savedItem;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   GoRouter.of(context)
//                                       .push(ProductDetailScreen.route);
//                                 },
//                                 child: ProductSale(
//                                   productName: 'Sweater',
//                                   isSelected: savedItem,
//                                   onTap: () {
//                                     setState(() {
//                                       savedItem = !savedItem;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),




// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';

// DevicePreview(
// enabled: !kReleaseMode,
// builder: (context) => const MyApp(),
// ),

    // DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) =>
    // ),
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,


// check if user is logged in
// final token = await SecureStorageUtils.getString(SharedPrefKeys.token);
// final isLoggedIn = !(token == null || token.isEmpty);

// check if user is onboarded
// final isOnboarded = !isLoggedIn
//     ? await SharedPreferencesUtil.getBool(SharedPrefKeys.isOnboarded) ?? false
//     : isLoggedIn;

// initialRoute = isLoggedIn
//     ? BottomNavigator.route
//     : isOnboarded
//         ? OnboardingGetStartedScreen.route
//         : null;
