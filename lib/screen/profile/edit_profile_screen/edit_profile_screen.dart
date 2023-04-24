// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70.h),
//         child: const CustomAppBar(appBarName: 'Edit Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 24.h,
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'assets/mentors/profile_one.png',
//                       height: 130.h,
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     CustomText(
//                       text: 'Jerry Clark',
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.title,
//                     ),
//                     SizedBox(
//                       height: 6.h,
//                     ),
//                     CustomText(
//                       text: 'Member since 2021',
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.body,
//                     ),
//                     SizedBox(
//                       height: 24.h,
//                     ),
//                     const Divider(
//                       thickness: 1,
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                   ],
//                 ),
//               ),
//               TabBar(
//                   isScrollable: true,
//                   unselectedLabelColor: AppColors.body,
//                   indicatorColor: AppColors.primary,
//                   labelColor: AppColors.primary,
//                   labelStyle:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
//                   tabs: const [
//                     Tab(
//                       text: 'Basic Info',
//                     ),
//                     Tab(
//                       text: 'Password',
//                     ),
//                   ],
//                   controller: _tabController,
//                   indicatorSize: TabBarIndicatorSize.tab),
//               SizedBox(
//                 height: 470.h,
//                 child: TabBarView(controller: _tabController, children: const [
//                   BasicInfoContent(),
//                   PasswordContent(),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
