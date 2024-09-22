import 'package:core_dashboard/shared/constants/extensions.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'social_login_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 296,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Đăng kí',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              gapH24,
              Text(
                'Đăng kí với tài khoản',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              gapH24,
              SocialLoginButton(
                onGoogleLoginPressed: () {},
                onAppleLoginPressed: () {},
              ),
              gapH24,
              const Divider(),
              gapH24,
              Text(
                'Hoặc tiếp tục với tài khoản email',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              gapH16,

              /// EMAIL FIELD
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/mail_light.svg',
                    height: 16,
                    width: 20,
                    fit: BoxFit.none,
                  ),
                  suffixIcon: SvgPicture.asset(
                    'assets/icons/check_filled.svg',
                    width: 17,
                    height: 11,
                    fit: BoxFit.none,
                    colorFilter: AppColors.success.toColorFilter,
                  ),
                  hintText: 'Nhập email của bạn',
                ),
              ),
              gapH16,

              /// CONTINUE BUTTON
              SizedBox(
                width: 296,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Tiếp tục'),
                ),
              ),
              gapH24,
              Text(
                'Trang web này được bảo vệ bởi reCAPTCHA và Chính sách bảo mật của Google.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
