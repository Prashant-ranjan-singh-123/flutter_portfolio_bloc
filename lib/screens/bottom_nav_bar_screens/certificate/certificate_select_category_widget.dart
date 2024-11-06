import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/certificate/certificate_cubit.dart';
import 'package:prashant_portfolio/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateSelectCategory extends StatefulWidget {
  final Function(String) onCategorySelected;
  BuildContext parentContext;
  CertificateSelectCategory(
      {Key? key, required this.onCategorySelected, required this.parentContext})
      : super(key: key);

  @override
  _CertificateSelectCategoryState createState() =>
      _CertificateSelectCategoryState();
}

class _CertificateSelectCategoryState extends State<CertificateSelectCategory> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    // Select the first category by default
    selectedCategory =
        widget.parentContext.read<CertificateCubit>().experience.keys.first;
    // Notify the parent widget about the initial selection
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onCategorySelected(selectedCategory);
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
    widget.onCategorySelected(category);
  }

  Widget _buildCategoryWidget(String category, int count) {
    bool isSelected = category == selectedCategory;
    return GestureDetector(
      onTap: () => _onCategorySelected(category),
      child: count == 0
          ? Container(
              child: Column(
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.w900 : FontWeight.w400,
                      fontSize: isSelected ? 27 : 25,
                      fontFamily: 'Merriweather',
                      color: isSelected
                          ? AppColor.instance().textBold
                          : AppColor.instance().textBold.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    '$count Certs',
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: isSelected ? 17 : 15,
                      fontFamily: 'OpenSans',
                      color: isSelected
                          ? AppColor.instance().textLight
                          : AppColor.instance().textLight.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.sizeOf(context).width * 0.08),
              child: Column(
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.w900 : FontWeight.w400,
                      fontSize: isSelected ? 27 : 25,
                      fontFamily: 'Merriweather',
                      color: isSelected
                          ? AppColor.instance().textBold
                          : AppColor.instance().textBold.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    '$count Certs',
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: isSelected ? 17 : 15,
                      fontFamily: 'OpenSans',
                      color: isSelected
                          ? AppColor.instance().textLight
                          : AppColor.instance().textLight.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryWidgets = widget.parentContext
        .read<CertificateCubit>()
        .experience
        .entries
        .map((entry) => _buildCategoryWidget(entry.key, entry.value.length))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 30),
      child: SizedBox(
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: categoryWidgets,
        ),
      ),
    );
  }
}

class CertificateScreenLogicOpenLink {
  // --Open Link--
  static void openBachler({required String link}) async {
    String dt = link;
    Uri url = Uri.parse(dt);
    try {
      await launchUrl(url);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}
