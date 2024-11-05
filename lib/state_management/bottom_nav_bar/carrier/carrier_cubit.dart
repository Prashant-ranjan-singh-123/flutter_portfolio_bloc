import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'carrier_state.dart';

class CarrierCubit extends Cubit<CarrierState> {
  String name = 'Prashant Ranjan Singh';
  String role = 'Mobile Developer | Flutter Developer';
  String discription_short =
      'Hello there! My name is Prashant Ranjan Singh, and I am a skilled Software Engineer who specializes in developing Flutter applications. I hold a Bachelor\'s degree in Btech Cse from Medicaps University and have been working in the field for about approximately 1+ years. I am adept at creating mobile apps that are both efficient and user-friendly, and I possess proficiency in various technologies, including Firebase, Supabase, Figma, and Flutter. I am passionate about staying up-to-date with industry trends and technologies to deliver top-notch software solutions.';

  late Map<int, dynamic> education;
  late Map<int, dynamic> experience;

  // -- Education List Link
  String tenth_website_link = 'https://gisindore.in/';
  String twelth_website_link = 'https://sitadevischool.in/';
  String bachler_website_link = 'https://www.medicaps.ac.in/';
  String page_not_found = 'http://google.com/this-page-does-not-exist';

  // -- Experience List Link
  String oasis_link = 'https://github.com/Prashant-ranjan-singh-123/OasisInfobyte_Java_Project';
  String sync_link = 'https://github.com/Prashant-ranjan-singh-123/Sync-Internship';
  String codeClause_link = 'https://github.com/Prashant-ranjan-singh-123/codeclause-internship';
  String codSoft_link = 'https://github.com/Prashant-ranjan-singh-123/CodSoft';

  CarrierCubit() : super(CarrierInitial()) {


    // -- To Open tenth Logic --
    void open10thSchool() async {
      print('object');
      String dt = tenth_website_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open 12th Logic --
    void open12thSchool() async {
      print('object');
      String dt = twelth_website_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open bachler Logic --
    void openBachler() async {
      print('object');
      String dt = bachler_website_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open bachler Logic --
    void openPageNotFound() async {
      print('object');
      String dt = page_not_found;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open oasis_link Logic --
    void openOasis() async {
      print('object');
      String dt = oasis_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open sync_link Logic --
    void openSync() async {
      print('object');
      String dt = sync_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open codeClause_link Logic --
    void openCodeClause() async {
      print('object');
      String dt = codeClause_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // -- To Open codSoft_link Logic --
    void openCodSoft() async {
      print('object');
      String dt = codSoft_link;
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      }catch (e){
        throw 'Could not launch $url';
      }
    }

    // Initialize the maps here
    education = {
      1: [
        'Golden International School (X)',
        'I successfully completed my 10th grade education at this institution, achieving a CGPA of 7.0. My coursework included Physics, Chemistry, and Mathematics (PCM), subjects in which I demonstrated strong proficiency and academic performance.',
        open10thSchool
      ],
      2: [
        'Sita Devi School (XII)',
        'I successfully completed my 12th grade education (Senior Secondary) at this institution, achieving a CGPA of 7.0. My academic focus was on Physics, Chemistry, and Mathematics (PCM), a challenging combination in which I demonstrated strong aptitude and performance.',
        open12thSchool
      ],
      3: [
        'Medicaps University (Btech)',
        'I am completing my B.Tech in Computer Science and Engineering (Honors) from MediCaps University, graduating in 2024 with a CGPA of 8.49. This program has equipped me with strong computer science skills and knowledge of advanced technologies.',
        openBachler
      ]
    };

    experience = {
      1: [
        'Oasis Infobyte (Java Intern)',
        'May 2022 - Jun 2022\n\n'
            'During this internship, I gained invaluable experience in applying Java programming concepts to real-world scenarios, significantly enhancing my understanding of software development practices.',
        openOasis
      ],
      2: [
        'SYNC INTERN\'S (App-Dev Intern)',
        'Mar 2023 - Apr 2023 \n\n'
            'During this internship, I gained comprehensive hands-on experience in Android application development, significantly enhancing my understanding of mobile software engineering.',
        openSync
      ],
      3: [
        'CodeClause (App-Dev Intern)',
        'Apr 2023 - May 2023\n\n'
            'This internship has been more than just a learning experience; it has been a stepping stone towards my career in App development. The skills, knowledge, and connections I\'ve gained have laid a strong foundation for my future',
        openCodeClause
      ],
      4: [
        'CodeClause (App-Dev Intern)',
        'Apr 2023 - May 2023\n\n'
            'This internship has been more than just a learning experience; it has been a stepping stone towards my career in App development. The skills, knowledge, and connections I\'ve gained have laid a strong foundation for my future',
        openCodeClause
      ],
      5: [
        'CodSoft (App-Dev Intern)',
        'Jul 2023 - Aug 2023\n\n'
            'During this internship, I gained comprehensive hands-on experience in Android app development, mastering key concepts such as UI design, API integration, and animations, while working on real-world projects that honed my problem-solving skills and prepared me for a career in mobile application development.',
        openCodSoft
      ],
      6: [
        'Appzeto (Junior Flutter Dev.)',
        'Sep 2023 - Nov 2023\n\n'
            'Through this Period, I immersed myself in Flutter development, gaining hands-on experience with cross-platform app creation, state management, and UI design, while collaborating on real projects that sharpened my skills and prepared me for a career in modern mobile development.',
        openPageNotFound
      ],
      7: [
        'Infovirtech (Junior Flutter Dev.)',
        'Jul 2023 - Aug 2023\n\n'
            'I immersed myself in Flutter development, gaining extensive hands-on experience in cross-platform app creation, state management, and UI design. Collaborating closely on real projects',
        openPageNotFound
      ]
    };
  }
}
