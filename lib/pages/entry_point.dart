import 'package:core_dashboard/pages/managenment/manage_booking_doctor/manage_booking_doctor.dart';
import 'package:core_dashboard/pages/managenment/manage_booking_schedule/manage_booking_schedule.dart';
import 'package:core_dashboard/pages/managenment/manage_doctor/manage_doctor.dart';
import 'package:core_dashboard/pages/managenment/manage_orders/manage_orders.dart';
import 'package:core_dashboard/pages/managenment/manage_product/manage_product.dart';
import 'package:core_dashboard/pages/managenment/manage_sale/manage_sale.dart';
import 'package:core_dashboard/pages/managenment/manage_schedule/manage_schedule.dart';
import 'package:core_dashboard/pages/managenment/manage_type_product/manage_type_product.dart';
import 'package:core_dashboard/pages/managenment/manage_user/manage_user.dart';
import 'package:core_dashboard/provider/main_viewModel.dart';
import 'package:core_dashboard/responsive.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:core_dashboard/shared/widgets/sidemenu/sidebar.dart';
import 'package:core_dashboard/shared/widgets/sidemenu/tab_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/widgets/header.dart';
import 'dashboard/dashboard_page.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EntryPoint extends StatelessWidget {
  const EntryPoint({required this.roleId, super.key});
  final String roleId;
  @override
  Widget build(BuildContext context) {
    print(roleId);
    final viewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      key: _drawerKey,
      drawer: Responsive.isMobile(context) ? const Sidebar() : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) const Sidebar(),
          if (Responsive.isTablet(context)) const TabSidebar(),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: _drawerKey),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding *
                                (Responsive.isMobile(context) ? 1 : 1.5),
                          ),
                          child: SafeArea(
                            // Sử dụng Consumer để lắng nghe thay đổi từ PageProvider
                            child: Consumer<MainViewModel>(
                              builder: (context, pageProvider, child) {
                                // Hiển thị trang dựa trên selectedPageIndex
                                switch (viewModel.selectedPageIndex) {
                                  case 0:
                                    return const DashboardPage();
                                  case 1:
                                    return const ManageBookingDoctor();
                                  case 2:
                                    return const ManageBookingSchedule();
                                  case 3:
                                    return const ManageUser();
                                  case 4:
                                    return const ManageDoctor();
                                  case 5:
                                    return const ManageSale();
                                  case 6:
                                    return const ManageSchedule();
                                  case 7:
                                    return const ManageOrders();
                                  case 8:
                                    return const ManageProduct();
                                  case 9:
                                    return const ManageTypeProduct();
                                  default:
                                    return const DashboardPage();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
