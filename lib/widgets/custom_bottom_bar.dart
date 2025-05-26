import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

import '/core/app_export.dart';

enum BottomBarEnum { group8225, group8224, iconplus, group8223, group8222 }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key, this.onChanged});
  RxInt selectedIndex = 0.obs;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgGroup8225,
      activeIcon: ImageConstant.imgGroup8225,
      type: BottomBarEnum.group8225,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGroup8224,
      activeIcon: ImageConstant.imgGroup8224,
      type: BottomBarEnum.group8224,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconPlus,
      activeIcon: ImageConstant.imgIconPlus,
      type: BottomBarEnum.iconplus,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGroup8223,
      activeIcon: ImageConstant.imgGroup8223,
      type: BottomBarEnum.group8223,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGroup8222,
      activeIcon: ImageConstant.imgGroup8222,
      type: BottomBarEnum.group8222,
    ),
  ];
  Function(BottomBarEnum)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(ImageConstant.imgRectangle3),
          fit: BoxFit.fill,
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            if (bottomMenuList[index].isCircle) {
              return BottomNavigationBarItem(
                icon: CustomIconButton(
                  height: 56.h,
                  width: 56.h,
                  padding: EdgeInsetsDirectional.all(16.h),
                  decoration: IconButtonStyleHelper.outlinePrimary,
                  child: CustomImageView(imagePath: bottomMenuList[index].icon),
                ),
                label: '',
              );
            }
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 24.h,
                width: 26.h,
                color: appTheme.gray400,
              ),
              activeIcon: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 24.h,
                width: 26.h,
                color: theme.colorScheme.primary,
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isCircle = false,
  });
  String icon;
  String activeIcon;
  BottomBarEnum type;
  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsetsDirectional.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
