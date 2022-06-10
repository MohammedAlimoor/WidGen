import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontListView extends StatefulWidget {
  const GoogleFontListView({Key? key, this.onSubmitted}) : super(key: key);

  final Function(TextStyle)? onSubmitted;

  @override
  State<GoogleFontListView> createState() => _GoogleFontListViewState();
}

class _GoogleFontListViewState extends State<GoogleFontListView> {
  List<MapEntry<String, TextStyle Function()>> listFonts = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      listFonts = GoogleFonts.asMap().entries.toList();
    });
  }

  TextEditingController searchTextController = TextEditingController();
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listFonts.forEach((userDetail) {
      if (userDetail.key.toLowerCase().contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }

  List<MapEntry<String, TextStyle Function()>> _searchResult = [];

  get finalList =>
      _searchResult.length != 0 || searchTextController.text.isNotEmpty
          ? _searchResult
          : listFonts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromARGB(255, 210, 209, 209),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8.0,
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    searchTextController.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: finalList.length,
            itemBuilder: (BuildContext buildContext, int index) => ListTile(
              onTap: () {
                widget.onSubmitted?.call(finalList[index].value());
              },
              leading: Icon(Icons.font_download),
              title: Text(
                finalList[index].key,
                style: finalList[index].value(),
              ),
              subtitle: Text(
                "عرض نص عربي للتجربة",
                style: finalList[index].value(),
              ),
            ),
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
