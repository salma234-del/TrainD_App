
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../profile/presentation/controller/profile_cubit/profile_cubit.dart';
import '../../../../profile/presentation/screens/profile_screen.dart';
import '../../../../settings/presentation/screens/settings_screen.dart';
import '../../screens/home_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileCubit profileCubit;
  HomeCubit({
    required this.profileCubit,
  }) : super(HomeInitial()){
    CacheHelper.saveData(key: 'setProfileImage', value: false);
    emit(GetAllDataLoadingState());
    profileCubit.getProfileUserData();
    profileCubit.stream.listen((ProfileState) {
      //print(FromToState);
      if (ProfileState is ProfileSuccessUserDataState) {
        emit(GetAllDataSuccessState());
      } else {
        emit(GetAllDataErrorState('Unexpected error'));
      }
    });
  }
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  bool getStationsFromApiIsDone = false;
  List<Widget> screens = const [
    ProfileScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

  void changeGetStationsFromApiIsDone() {
    getStationsFromApiIsDone = true;
    emit(ChangeGetStationsFromApiState());
  }

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          '${AppConstants.imagesUrl}$profileIcon',
        ),
        color: lightColor,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          '${AppConstants.imagesUrl}$homeIcon',
        ),
        color: lightColor,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          '${AppConstants.imagesUrl}$settingsIcon',
        ),
        color: lightColor,
      ),
      label: '',
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
}