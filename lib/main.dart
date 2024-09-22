import 'package:core_dashboard/provider/main_viewModel.dart';
import 'package:core_dashboard/shared/navigation/routes.dart';
import 'package:core_dashboard/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                MainViewModel()), // Thay SomeModel bằng model bạn sử dụng
        // Bạn có thể thêm nhiều provider khác nếu cần
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(context),
        routerConfig: routerConfig,
      ),
    );
  }
}
