import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:talent_space_test/core/theming/app_colors.dart';
import 'package:talent_space_test/features/home/data/datasource/notification_data_source.dart';
import 'package:talent_space_test/features/home/data/datasource/video_data_source.dart';
import 'package:talent_space_test/features/home/data/repositories/notification_repository_impl.dart';
import 'package:talent_space_test/features/home/data/repositories/video_repository_impl.dart';
import 'package:talent_space_test/features/home/domin/usecases/get_video_use_case.dart';
import 'package:talent_space_test/features/home/domin/usecases/send_notification_use_case.dart';
import 'package:talent_space_test/features/home/presentation/cubit/video_cubit.dart';
import 'package:talent_space_test/features/home/presentation/screens/home_screen.dart';
import 'package:talent_space_test/features/settings/settings_screen.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key, this.targetIndex = 0});
  final int targetIndex;

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  final PersistentTabController _bottomNavController =
      PersistentTabController(initialIndex: 2);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _bottomNavController,
      screens: _buildScreens(),
      items: _buildNavBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      backgroundColor: AppColors.backgroundNavBarColor,
      hideNavigationBarWhenKeyboardAppears: true,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarStyle: NavBarStyle.simple,
      navBarHeight: 75.h,
    );
  }

  List<Widget> _buildScreens() {
    return [
      SettingsScreen(),
      Container(),
      BlocProvider(
          create: (_) => VideoCubit(
              getVideosUseCase: GetVideoUseCase(
                  videoRepository:
                      VideoRepositoryImpl(videoDataSource: VideoDataSource())),
              sendNotificationUseCase: SendNotificationUseCase(
                  notificationRrepository: NotificationRepositoryImpl(
                      notificationDataSource: NotificationDataSource())))
            ..getVideos(),
          child: HomeScreen()),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings, color: AppColors.praimryOrangeColor),
        inactiveIcon:
            Icon(Icons.settings_outlined, color: AppColors.backgroundColor),
      ),
      PersistentBottomNavBarItem(
        icon: _buildAddButton(),
        inactiveIcon: _buildAddButton(),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: AppColors.praimryOrangeColor),
        inactiveIcon:
            Icon(Icons.home_outlined, color: AppColors.backgroundColor),
      ),
    ];
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () => _showCameraBottomSheet(),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
            color: AppColors.praimryOrangeColor, shape: BoxShape.circle),
        child: Icon(Icons.add, color: AppColors.backgroundColor, size: 30),
      ),
    );
  }

  void _showCameraBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 1.0,
          builder: (_, controller) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("تصوير فيديو",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _openCamera(),
                    child: Text("ابدأ التصوير الآن"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final video = await picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      print("تم تسجيل الفيديو: ${video.path}");
    }
  }
}
