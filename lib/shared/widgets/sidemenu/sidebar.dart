import 'package:core_dashboard/pages/dashboard/widgets/theme_tabs.dart';
import 'package:core_dashboard/provider/main_viewModel.dart';
import 'package:core_dashboard/responsive.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/widgets/sidemenu/customer_info.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../constants/config.dart';
import 'menu_tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);
    return Drawer(
      // width: Responsive.isMobile(context) ? double.infinity : null,
      // width: MediaQuery.of(context).size.width < 1300 ? 260 : null,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset('assets/icons/close_filled.svg'),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                    vertical: AppDefaults.padding * 1.5,
                  ),
                  child: SvgPicture.asset(AppConfig.logo),
                ),
              ],
            ),
            const Divider(),
            gapH16,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding,
                ),
                child: ListView(
                  children: [
                    if (viewModel.roleId == '0')
                      MenuTile(
                        isActive: true,
                        title: "Thống kê",
                        activeIconSrc: "assets/icons/home_filled.svg",
                        inactiveIconSrc: "assets/icons/home_light.svg",
                        onPressed: () {
                          Provider.of<MainViewModel>(context, listen: false)
                              .selectPage(0);
                          Navigator.pop(context);
                        },
                      ),
                    if (viewModel.roleId == '0')
                      ExpansionTile(
                        leading:
                            SvgPicture.asset("assets/icons/diamond_light.svg"),
                        title: Text(
                          "Quản lý lịch đặt",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        children: [
                          MenuTile(
                            isSubmenu: true,
                            title: "Theo bác sĩ",
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(1);
                              Navigator.pop(context);
                            },
                          ),
                          MenuTile(
                            isSubmenu: true,
                            title: "Theo chi nhánh",
                            count: 16,
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(2);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    if (viewModel.roleId == '0')
                      ExpansionTile(
                        leading: SvgPicture.asset(
                            "assets/icons/profile_circled_light.svg"),
                        title: Text(
                          "Quản lý thông tin",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        children: [
                          MenuTile(
                            isSubmenu: true,
                            title: "Người dùng",
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(3);
                              Navigator.pop(context);
                            },
                          ),
                          MenuTile(
                            isSubmenu: true,
                            title: "Bác sĩ",
                            count: 16,
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(4);
                              Navigator.pop(context);
                            },
                          ),
                          MenuTile(
                            isSubmenu: true,
                            title: "Sale",
                            count: 16,
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(5);
                              Navigator.pop(context);
                            },
                          ),
                          MenuTile(
                            isSubmenu: true,
                            title: "Chi nhánh",
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(6);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    // Customers
                    if (viewModel.roleId == '0' || viewModel.roleId == '2')
                      ExpansionTile(
                        leading:
                            SvgPicture.asset("assets/icons/store_filled.svg"),
                        title: Text(
                          "Quản lý bán hàng",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        children: [
                          MenuTile(
                            isSubmenu: true,
                            title: "Đơn hàng",
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(7);
                              Navigator.pop(context);
                            },
                          ),
                          MenuTile(
                            isSubmenu: true,
                            title: "Sản phẩm",
                            count: 16,
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(8);
                              Navigator.pop(context);
                            },
                          ),
                          MenuTile(
                            isSubmenu: true,
                            title: "Loại sản phẩm",
                            count: 16,
                            onPressed: () {
                              Provider.of<MainViewModel>(context, listen: false)
                                  .selectPage(9);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    // MenuTile(
                    //   title: "Chi nhánh",
                    //   activeIconSrc: "assets/icons/store_light.svg",
                    //   inactiveIconSrc: "assets/icons/store_filled.svg",
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                children: [
                  if (Responsive.isMobile(context))
                    const CustomerInfo(
                      name: 'Mr.Minh Đức',
                      designation: 'Admin',
                      imageSrc:
                          'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
                    ),
                  gapH8,
                  const Divider(),
                  gapH8,
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       'assets/icons/help_light.svg',
                  //       height: 24,
                  //       width: 24,
                  //       colorFilter: const ColorFilter.mode(
                  //         AppColors.textLight,
                  //         BlendMode.srcIn,
                  //       ),
                  //     ),
                  //     gapW8,
                  //     Text(
                  //       'Help & getting started',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .labelMedium
                  //           ?.copyWith(fontWeight: FontWeight.w600),
                  //     ),
                  //     const Spacer(),
                  //     Chip(
                  //       backgroundColor: AppColors.secondaryLavender,
                  //       side: BorderSide.none,
                  //       padding: const EdgeInsets.symmetric(horizontal: 0.5),
                  //       label: Text(
                  //         "8",
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .labelMedium!
                  //             .copyWith(fontWeight: FontWeight.w700),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // gapH20,
                  const ThemeTabs(),
                  // gapH8,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
