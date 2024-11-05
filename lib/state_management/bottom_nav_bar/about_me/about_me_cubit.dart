import 'package:android_intent_plus/android_intent.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_assets.dart';

part 'about_me_state.dart';

class AboutMeCubit extends Cubit<AboutMeState> {
  String name = 'Prashant Ranjan Singh';
  String role = 'Mobile Developer | Flutter Developer';
  String discription_short =
      'Hello there! My name is Prashant Ranjan Singh, and I am a skilled Software Engineer who specializes in developing Flutter applications. I hold a Bachelor\'s degree in Btech Cse from Medicaps University and have been working in the field for about approximately 1+ years. I am adept at creating mobile apps that are both efficient and user-friendly, and I possess proficiency in various technologies, including Firebase, Supabase, Figma, and Flutter. I am passionate about staying up-to-date with industry trends and technologies to deliver top-notch software solutions.';

  Map<int, List> socialLink = {
    0: [AppAssets.instance().threeisToFourPortfolioImage, 'https://prashant-ranjan-singh-123.github.io/'],
    1: [AppAssets.instance().threeisToFourGithubImage, 'https://github.com/Prashant-ranjan-singh-123'],
    2: [AppAssets.instance().threeisToFourLinkedinImage, 'https://www.linkedin.com/in/prashant-ranjan-singh-b9b6b9217/'],
    3: [AppAssets.instance().threeisToFourTelegramImage, 'https://t.me/Prashantsingh255'],
    4: [AppAssets.instance().threeisToFourGmailImage, 'prashant.singh.12312345@gmail.com'],
    5: [AppAssets.instance().threeisToFourGmailImage, 'https://play.google.com/store/apps/developer?id=Prashant+Ranjan+Singh']
  };

  Map<int, List> skills = {
    0: ['Flutter', 0.9],
    1: ['Dart', 0.82],
    2: ['Firebase', 0.75],
    3: ['Android Development', 0.7],
    4: ['Supabase', 0.65],
    5: ['Ui/Ux', 0.46],
    6: ['Swift Ui', 0.3]
  };

  String contactDescription =
      'Hey! I appreciate you looking at my public profile. Please feel free to ask me anything or to discuss anything with me. I\'m happy to chat with and meet new people. Regardless of the fact that I don\'t use social media much, you can find me there. So find me and get in touch with me. Send me an email if you need to discuss anything serious with me. I\'ll get back to you in 12 to 24 hours.';


  AboutMeCubit() : super(AboutMeInitial());


  // -- To Open Linkedin Logic --
  void openLinkedin() async {
    Future<bool> isLinkedInInstalled() async {
      Uri url = Uri.parse('linkedin://');
      if (await canLaunchUrl(url)) {
        return true;
      } else {
        return false;
      }
    }

    String dt = socialLink[2]![1];
    bool isInstalled = await isLinkedInInstalled();
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

  // -- To Open Github Logic --
  void openGithub() async {
    Future<bool> isGithubInInstalled() async {
      Uri url = Uri.parse('github://');
      if (await canLaunchUrl(url)) {
        return true;
      } else {
        return false;
      }
    }

    String dt = socialLink[1]![1];
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

  // -- To Open Telegram Logic --
  void openGooglePlay() async {
    String dt = socialLink[5]![1];
    Uri url = Uri.parse(dt);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openGmail() async {
    print(socialLink[4]![1]);
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }
// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: socialLink[4]![1],
      query: encodeQueryParameters(<String, String>{
        'subject': 'Seen Your Portfolio Application',
      }),
    );
    launchUrl(emailLaunchUri);
  }


  // -- To Open Website Logic --
  void openWebsite() async {
    String dt = socialLink[0]![1];
    Uri url = Uri.parse(dt);
    try {
      await launchUrl(url);
    }catch (e){
      throw 'Could not launch $url';
    }
  }
}
