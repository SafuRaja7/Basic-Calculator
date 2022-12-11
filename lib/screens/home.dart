import 'package:calculator_app/configs/app.dart';
import 'package:calculator_app/configs/configs.dart';
import 'package:calculator_app/utils/app_utils.dart';
import 'package:calculator_app/widgets/buttons.dart';
import 'package:calculator_app/widgets/theme_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[850] : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: isDark ? Colors.grey[850] : Colors.white,
                child: Column(
                  children: [
                    Space.y1!,
                    ThemeButtons(
                      containerColor:
                          isDark ? Colors.grey[800]! : Colors.grey[100]!,
                      iconColorDark: isDark ? Colors.white : Colors.grey,
                      iconColorLight: isDark ? Colors.grey : Colors.black,
                      onTapDark: () {
                        setState(
                          () {
                            isDark = true;
                          },
                        );
                      },
                      onTapLight: () {
                        setState(
                          () {
                            isDark = false;
                          },
                        );
                      },
                    ),
                    Space.yf(6),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppUtils.input,
                        style: TextStyle(
                          fontSize: 25,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Space.y!,
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppUtils.output,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  padding: Space.all(0.5, 1),
                  color: isDark ? Colors.grey[900] : Colors.white,
                  child: GridView.builder(
                    itemCount: AppUtils.buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              AppUtils.input = '';
                              AppUtils.output = '';
                            });
                          },
                          color: isDark ? Colors.grey[850]! : Colors.grey[50]!,
                          textColor: Colors.greenAccent,
                          buttonText: AppUtils.buttons[index],
                        );
                      } else if (index == 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              AppUtils.input = AppUtils.input
                                  .substring(0, AppUtils.input.length - 1);
                            });
                          },
                          color: isDark ? Colors.grey[850]! : Colors.grey[50]!,
                          textColor: Colors.greenAccent,
                          buttonText: AppUtils.buttons[index],
                        );
                      } else if (index == AppUtils.buttons.length - 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              AppUtils.equalPressed();
                            });
                          },
                          color: isDark ? Colors.grey[850]! : Colors.grey[50]!,
                          textColor: Colors.red,
                          buttonText: AppUtils.buttons[index],
                        );
                      } else {
                        return Buttons(
                          buttonTapped: () {
                            setState(
                              () {
                                AppUtils.input =
                                    AppUtils.input + AppUtils.buttons[index];
                              },
                            );
                          },
                          color: isDark ? Colors.grey[850]! : Colors.grey[50]!,
                          textColor:
                              AppUtils.isOperator(AppUtils.buttons[index])
                                  ? Colors.red
                                  : isDark
                                      ? Colors.white
                                      : Colors.black,
                          buttonText: AppUtils.buttons[index],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
