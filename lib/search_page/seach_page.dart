import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_app/search_page/data.dart';
import 'package:test_app/search_page/widgets/fish_info_card.dart';
import 'package:test_app/search_page/widgets/text_fild.dart'; // fishlist shu faylda saqlangan deb hisoblaymiz

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  final TextEditingController searchController = TextEditingController();
  late List<String> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = List.from(fishlist);
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredList = List.from(fishlist);
    } else {
      filteredList = fishlist
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  void deleteItem(int index) {
    final item = filteredList[index];
    fishlist.remove(item);
    filteredList.removeAt(index);
    setState(() {});
  }

  void updateItem(int index, String text) {
    fishlist[index] = text;
    filteredList[index] = text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.indigo,
        elevation: 5,
        titleSpacing: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
            ),
          ),
        ],
        title: CustomTextFild(
          controller: searchController,
          onPressed: () {
            searchController.clear();
            filteredList = List.from(fishlist);
            setState(() {});
          },
          onChanged: filterSearchResults,
        ),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    final updateController =
                        TextEditingController(text: filteredList[index]);
                    showDialog(
                        barrierColor: Colors.black.withOpacity(0.7),
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shadowColor: Colors.indigoAccent,
                            backgroundColor: Colors.white,
                            icon: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit_location_alt,
                                  color: Colors.indigo,
                                ),
                                Text(
                                  'Update',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            title: CustomTextFild(
                              controller: updateController,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('cancel'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.indigoAccent,
                                  ),
                                  onPressed: () {
                                    updateItem(
                                      index,
                                      updateController.text,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('save'),
                                )
                              ],
                            ),
                          );
                        });
                    controller.openEndActionPane();
                  },
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (_) => deleteItem(index),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: FishInfoCard(
              name: filteredList[index],
              searchController: searchController,
            ),
          );
        },
      ),
    );
  }
}
