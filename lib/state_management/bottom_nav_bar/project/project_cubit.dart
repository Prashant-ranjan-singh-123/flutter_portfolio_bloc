import 'package:android_intent_plus/android_intent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../screens/bottom_nav_bar_screens/project/bottom_sheet_custom.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {



  String shareText({required List<String> links, required String nameOfApp}) {
    String playStoreLink = links[0];
    String githubLink = links[1];
    String appStoreLink = links[2];

    String result = 'Check out the newly redesigned $nameOfApp';

    if (playStoreLink.isNotEmpty &&
        appStoreLink.isNotEmpty &&
        githubLink.isNotEmpty) {
      result +=
          ' on Android, iOS, and GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n'
          '• App Store: $appStoreLink\n'
          '• GitHub: $githubLink\n\n';
    } else if (playStoreLink.isNotEmpty && appStoreLink.isNotEmpty) {
      result +=
          ' on Android and iOS! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n'
          '• App Store: $appStoreLink\n\n';
    } else if (playStoreLink.isNotEmpty && githubLink.isNotEmpty) {
      result +=
          ' on Android and GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n'
          '• GitHub: $githubLink\n\n';
    } else if (appStoreLink.isNotEmpty && githubLink.isNotEmpty) {
      result +=
          ' on iOS and GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• App Store: $appStoreLink\n'
          '• GitHub: $githubLink\n\n';
    } else if (playStoreLink.isNotEmpty) {
      result += ' on Android! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n\n';
    } else if (appStoreLink.isNotEmpty) {
      result += ' on iOS! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• App Store: $appStoreLink\n\n';
    } else if (githubLink.isNotEmpty) {
      result += ' on GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• GitHub: $githubLink\n\n';
    }

    result += '🌐 Connect:\n\n'
        '• LinkedIn: https://linkedin.com/in/prashant-ranjan-singh-b9b6b9217\n\n'
        'Thanks for your support!';

    return result;
  }

  Map<int, dynamic> experience = {
    0: [
      'Direction',
      '"Direction" is a project designed to facilitate seamless communication between individuals and spiritual gurus, allowing users to seek guidance and receive personalized predictions about their future.',
      AppAssets.instance().featureGraphicDirection,
      AppAssets.instance().appScreenBigDrum,
      'PlayStore',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.project.direction',
          '',
          ''
        ]
      },
    ],
    1: [
      'Insugo Digi',
      'Insugo Digi is a Digital Wallet for storing policies and documents, No more running around. Manage all your policies/documents from one place. Get service and support for the entire lifetime of your policy. Complete guidance to claim policy. Notification on expiry of policies/document',
      AppAssets.instance().featureGraphicInsugoDigi,
      AppAssets.instance().featureGraphicInsugoDigi,
      'PlayStore | AppStore',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=in.insugo.digi',
          '',
          'https://apps.apple.com/in/app/insugo-digi/id6455429167'
        ]
      },
      'Have a look to this app and give feedback 5 star heres link\n1) Playstore: https://play.google.com/store/apps/details?id=in.insugo.digi\n2) App Store: https://apps.apple.com/in/app/insugo-digi/id6455429167\n\nConnect With Me :-\n1) LinkedIn: https://linkedin.com/in/prashant-ranjan-singh-b9b6b9217\n2) Gmail: mailto:prashant.singh.12312345@gmail.com.'
    ],
    2: [
      'GlassView QD',
      'GlassView Labs has developed a proprietary, high-frequency trading platform, QuickDraw TM, to deliver ad placements on top-tier sites & articles covering trending topics before they hit critical mass; leading to prominent brand positioning & superior ROI across the board.',
      AppAssets.instance().featureGraphicGlassView,
      AppAssets.instance().appScreenQuickdraw,
      'PlayStore | AppStore',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.glassview.qd',
          '',
          'https://apps.apple.com/in/app/glassview-qd/id6443454711'
        ]
      },
    ],
    3: [
      'Big Drum',
      'Big Drum is a project that displays real-time machine data such as temperature, consumption count, and gas flow after login. All data is fetched from APIs, and only authorized users (company members) can access the app to view the machine’s data in graph form. The app is available on both the Play Store and App Store.',
      AppAssets.instance().featureGraphicBigDrum,
      AppAssets.instance().appScreenBigDrum,
      'PlayStore | AppStore',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.bigdrum_app',
          '',
          'https://apps.apple.com/in/app/bigdrum/id6452016774'
        ]
      },
    ],
    4: [
      'Portfolio',
      'PrashantSkillscape: Your professional journey, beautifully presented. This Flutter-built portfolio app showcases your skills, experience, and achievements with style. Featuring Material Design 3, it displays your name, designation, social media links, and a concise summary. Easily customizable, it highlights your education, work history, projects, and certifications. Whether you\'re a Flutter expert or novice, adapting this app is simple. Make a lasting impression with PrashantSkillscape - where your career story comes to life in a tap.',
      AppAssets.instance().featureGraphicPrashantSkillscape,
      AppAssets.instance().appScreenPrashantSkillScape,
      'Playstore | Github',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.prashant.project.portfolio',
          'https://github.com/Prashant-ranjan-singh-123/PrashantSkillscape',
          ''
        ]
      }
    ],
    5: [
      'Mathmaica Mind',
      'Mathmaica Mind learning arithmetic fun and challenging! Choose your difficulty and test your skills in a gamified experience, and start the game.',
      AppAssets.instance().featureGraphicMathmaticaMind,
      AppAssets.instance().appScreenMathmaticaMind,
      'Playstore | Github',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.prashant.mathmatica.mind.mathmatics_mind',
          'https://github.com/Prashant-ranjan-singh-123/Mathmatica-Mind',
          ''
        ]
      }
    ],
    6: [
      'Doctor On Home',
      'This app, built with care, connects you to top-notch doctors at your fingertips. Skip the waiting rooms and experience healthcare on-demand. Let Heal on Call be your pocket-sized clinic, available whenever you need it.',
      AppAssets.instance().featureGraphicDoctorOnHome,
      AppAssets.instance().appScreenDoctorOnHome,
      'PlayStore',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.doctor.home',
          '',
          ''
        ]
      }
    ],
    7: [
      'Tic Tac Tangle',
      'You have the opportunity to engage in a game of Tic Tac Toe on your Android phone. There is no requirement to use paper in order to partake in this intriguing puzzle game! At present, you are able to enjoy the game of Tic Tac Toe on your Android device without any cost. Our latest rendition showcases a contemporary twist with an appealing glow design.',
      AppAssets.instance().featureGraphicTicTacTangle,
      AppAssets.instance().appScreenTicTacTangle,
      'Playstore | Github',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.prashant.game.tictactoe.tic_tac_toe_final',
          'https://github.com/Prashant-ranjan-singh-123/Modern-Tic-Tac-Tangle',
          ''
        ]
      }
    ],
    8: [
      'Food Mania',
      'Get ready to tantalize your taste buds and unleash your inner chef with Food Mania, a recipe app built with love using Flutter! Immerse yourself in a world of culinary delights as you browse through our ever-growing collection of delicious dishes.',
      AppAssets.instance().featureGraphicFoodMania,
      AppAssets.instance().appScreenFoodMania,
      'Playstore | Github',
      {
        'Link': [
          'https://play.google.com/store/apps/details?id=com.prashant.foodmania.project',
          'https://github.com/Prashant-ranjan-singh-123/Food-Mania',
          ''
        ]
      }
    ],
    9: [
      'ShoeHaven',
      'Welcome to our sleek and stylish shoe-buying app, built entirely with Flutter. Immerse yourself in a world of modern design and seamless animations as you browse through our collection of footwear.',
      AppAssets.instance().featureGraphicShoeHaven,
      AppAssets.instance().appScreenShoeHaven,
      'Playstore | Github',
      {
        'Link': [
          '',
          'https://github.com/Prashant-ranjan-singh-123/shoe_haven',
          ''
        ]
      }
    ],
    10: [
      'Priority list',
      'This comprehensive app empowers you to manage to-do\'s, manage time and notify about your daily rutine tasks. From streamlined installation to free UI, Priority List equips you for success.',
      AppAssets.instance().featureGraphicPriorityList,
      AppAssets.instance().appScreenPriorityList,
      'Github',
      {
        'Link': [
          '',
          'https://github.com/Prashant-ranjan-singh-123/Priority-list-task',
          ''
        ]
      }
    ],
    11: [
      'Flutter Unwrapped',
      'Flutter Unwrapped unlocks the world of Flutter development on your mobile device. This comprehensive app empowers you to learn the fundamentals, build practical skills, and prepare for your Flutter developer journey. From streamlined installation to free UI kits, Flutter Unwrapped equips you for success.',
      AppAssets.instance().featureGraphicFlutterUnwrapped,
      AppAssets.instance().appScreenFlutterUnwrapped,
      'Github',
      {
        'Link': [
          '',
          'https://github.com/Prashant-ranjan-singh-123/flutter-Unwrapped',
          ''
        ]
      }
    ],
    12: [
      'Skilled Worker',
      'It\'s a notification app that allows users to sign up with specific categories like Doctor, Photographer, Programmer etc. Upon signup, the chosen category is attached to the profile. With a premium plan, users can send notifications to specific groups or all members of the app. Notifications include a title, message, and an image that others can download.',
      AppAssets.instance().featureGraphicSkilledWorker,
      AppAssets.instance().appScreenSkilledWorker,
      'Linkedin Only',
      {
        'Link': [
          // 'https://www.linkedin.com/feed/update/urn:li:activity:7211610859310125056/',
          '',
          '',
          ''
        ]
      }
    ],
  };

  Widget customCard(
      {required List<dynamic> experience, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              AppColor.instance().projectCursorSliderGradientTop,
              AppColor.instance().projectCursorSliderGradientDown
            ], // adjust colors as needed
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(experience[0],
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 23,
                            color:
                                AppColor.instance().projectCursorSliderTextBold,
                            fontFamily: 'Merriweather',
                          )),
                      Expanded(
                        child: SizedBox(
                          child: SingleChildScrollView(
                              child: Text(
                            experience[1],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColor.instance()
                                  .projectCursorSliderTextLight,
                              fontFamily: 'Merriweather',
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.instance().background,
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: false,
                              backgroundColor: Colors.black,
                              barrierColor: Colors.black.withOpacity(0.8),
                              elevation: 5,
                              enableDrag: false,
                              builder: (BuildContext context) {
                                return BottomSheetCustom(
                                  heading: experience[0],
                                  imageLocation: experience[2],
                                  shortDiscription: experience[1],
                                  playstoreLink: experience[5]['Link'][0],
                                  githubLink: experience[5]['Link'][1],
                                  appStoreLink: experience[5]['Link'][2],
                                  shareText: shareText(
                                    links: experience[5]['Link'],
                                    nameOfApp: experience[0],
                                  ),
                                  parentContext: context,
                                );
                              },
                            );
                          },
                          child: Text(
                            '     Know More    ',
                            style:
                                TextStyle(color: AppColor.instance().textBold),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    experience[3],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ProjectCubit() : super(ProjectInitial());

  List<Widget> cursol_slider_item({required BuildContext context}) {
    return [
      customCard(experience: experience[0], context: context),
      customCard(experience: experience[2], context: context),
      customCard(experience: experience[3], context: context),
      customCard(experience: experience[4], context: context),
      customCard(experience: experience[5], context: context),
      customCard(experience: experience[8], context: context),
      customCard(experience: experience[6], context: context),
    ];
  }

  void back_button_logic({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  void send_button_logic({required BuildContext context}) {
    showDialogBox(context: context);
  }

  void open_github_project({required String link}) {
    openGithub(dt: link);
  }

  void open_playstore_project({required String link}) {
    openPlayStore(dt: link);
  }

  void open_appstore_project({required String link}) {
    openAppStore(url: link);
  }

  // -- To Open Github with Link Logic --
  void openGithub({required String dt}) async {
    Future<bool> isGithubInInstalled() async {
      Uri url = Uri.parse('github://');
      if (await canLaunchUrl(url)) {
        return true;
      } else {
        return false;
      }
    }

    bool isInstalled = await isGithubInInstalled();
    if (isInstalled != false) {
      AndroidIntent intent = AndroidIntent(action: 'action_view', data: dt);
      await intent.launch();
    } else {
      Uri url = Uri.parse(dt);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  // Function to open Play Store link
  void openPlayStore({required String dt}) async {
    Future<bool> isPlayStoreInstalled() async {
      Uri url = Uri.parse('market://details?id=$dt');
      if (await canLaunch(url.toString())) {
        return true;
      } else {
        return false;
      }
    }

    bool isInstalled = await isPlayStoreInstalled();
    if (isInstalled) {
      // Play Store is installed, launch the app
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: dt,
      );
      await intent.launch();
    } else {
      // Play Store is not installed, open in browser
      Uri url = Uri.parse(dt);
      if (await canLaunch(url.toString())) {
        await launch(url.toString());
      } else {
        throw 'Could not launch Play Store link: $url';
      }
    }
  }

  void openAppStore({required String url}) async {
    Future<bool> isAppStoreInstalled() async {
      Uri uri = Uri.parse(url);
      // Check if the URL can be launched (this is a basic check)
      return await canLaunch(uri.toString());
    }

    bool isInstalled = await isAppStoreInstalled();
    if (isInstalled) {
      // Launch the App Store link directly
      await launch(url);
    } else {
      // Open the App Store link in a browser as a fallback
      Uri fallbackUrl = Uri.parse(url);
      if (await canLaunch(fallbackUrl.toString())) {
        await launch(fallbackUrl.toString());
      } else {
        throw 'Could not launch App Store link: $fallbackUrl';
      }
    }
  }

  void showDialogBox({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: Colors.black,
          elevation: 50,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: Lottie.asset(
                  AppAssets.instance().lottieConstruction,
                  reverse: true,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Under Construction",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(28, 27, 32, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "The functionality you're referring to is currently in development. If you have insights or solutions to offer, we welcome your contributions on GitHub.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(108, 106, 106, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 20,
                    ),
                    onPressed: () async {
                      openGithub(dt: '');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Icon(
                            MdiIcons.github,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Contribute",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(113, 43, 62, 1),
                      elevation: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
