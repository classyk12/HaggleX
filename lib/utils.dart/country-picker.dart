import 'package:flutter/material.dart';
import 'package:haggle_clone/utils.dart/themes.dart';

class SearchCountryWidget extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onSubmit;
  final Function(String) onChanged;

  SearchCountryWidget(
      {@required this.searchController,
      @required this.onSubmit,
      @required this.onChanged});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchCountryWidget> {
  bool searchEmpty = true;
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(() {
      if (widget.searchController.text.isEmpty) {
        setState(() {
          searchEmpty = true;
        });
      } else {
        setState(() {
          searchEmpty = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
      // height: Get.height * 0.3,
//      padding: EdgeInsets.only(left: 16, right: 16),
      child: TextFormField(
        style: TextStyle(color: white),
        cursorColor: white,
        keyboardType: TextInputType.text,
        controller: widget.searchController,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 21),
          hintText: 'Search for country',
          hintStyle: TextStyle(
              fontSize: 10,
              fontFamily: 'BasisGrotesquePro',
              color: white.withOpacity(0.7),
              fontWeight: FontWeight.w400),
          fillColor: Color(0xffFFFFFF).withOpacity(0.2),
          filled: true,
          suffixIcon: searchEmpty
              ? Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: 24,
                )
              : GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback(
                        (_) => widget.searchController.clear());
                    widget.onSubmit("");
                  },
                  child: Icon(
                    Icons.clear,
                    color: white,
                    size: 20,
                  )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
