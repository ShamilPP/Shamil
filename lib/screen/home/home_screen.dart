import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shamil/screen/settings/settings_screen.dart';

import 'my_all_apps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSearching = false;

  TextEditingController searchEditingController = TextEditingController();
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _offset = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: isSearching
            ? SlideTransition(
                position: _offset,
                child: TextField(
                    controller: searchEditingController,
                    style: const TextStyle(height: 0.5),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 1),
                      ),
                    )),
              )
            : const Text("My store"),
        leading: isSearching
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _controller.reverse();
                  Future.delayed(const Duration(milliseconds: 400))
                      .then((value) {
                    setState(() {
                      isSearching = false;
                    });
                  });
                },
              )
            : null,
        actions: [
          IconButton(
            onPressed: () {
              if (isSearching) {
                setState(() {
                  searchEditingController.clear();
                });
              } else {
                setState(() {
                  isSearching = true;
                  _controller.forward();
                });
              }
            },
            icon: isSearching
                ? const Icon(Icons.clear)
                : const Icon(Icons.search),
          ),
          isSearching
              ? const SizedBox()
              : PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "Settings",
                          child: Text("Setting"),
                        ),
                        const PopupMenuItem(
                          value: "About",
                          child: Text("About"),
                        ),
                      ],
                  onSelected: (item) {
                    switch (item) {
                      case "Settings":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SettingsScreen()));
                        break;
                      case "About":
                        Fluttertoast.showToast(
                            msg: "Developer : SHAMIL",
                            backgroundColor: Colors.green);
                        break;
                    }
                  }),
        ],
      ),
      drawer: isSearching
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.lightBlue),
                    child: Center(child: FlutterLogo(size: 70)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: const ListTile(
                      trailing: Icon(CupertinoIcons.forward),
                      title: Text('Apps'),
                    ),
                  ),
                  ListTile(
                    trailing: const Icon(CupertinoIcons.forward),
                    title: const Text('Games'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Games not available")));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [SortBy(), MyAllApps()],
        ),
      ),
    );
  }
}

class SortBy extends StatelessWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 55,
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
              msg: "Coming soon\nNext Update will be fix",
              backgroundColor: Colors.red);
        },
        child: Row(
          children: const [
            SizedBox(width: 20),
            Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            SizedBox(width: 15),
            Text(
              "Sort by",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
