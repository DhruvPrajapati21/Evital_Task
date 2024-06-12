import 'package:evital_project/Login.dart';
import 'package:flutter/material.dart';
import 'package:evital_project/UserModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
  final List<UserModel> _allUsers = [
    UserModel(
        name: 'Dhruv',
        phone: '123456780',
        city: 'Motera',
        imageUrl: 'https://picsum.photos/150?image=1',
        rupee: 70),
    UserModel(
        name: 'Jinal',
        phone: '2345678901',
        city: 'Vadaj',
        imageUrl: 'https://picsum.photos/150?image=2',
        rupee: 30),
    UserModel(
        name: 'Chetan',
        phone: '3456789012',
        city: 'Usmanapura',
        imageUrl: 'https://picsum.photos/150?image=3',
        rupee: 90),
    UserModel(
        name: 'Reva',
        phone: '4567890123',
        city: 'Cg Road',
        imageUrl: 'https://picsum.photos/150?image=4',
        rupee: 20),
    UserModel(
        name: 'Dushyant',
        phone: '5678901234',
        city: 'Chandkheda',
        imageUrl: 'https://picsum.photos/150?image=5',
        rupee: 50),
    UserModel(
        name: 'Daxa',
        phone: '6789012345',
        city: 'Adalaj',
        imageUrl: 'https://picsum.photos/150?image=6',
        rupee: 60),
    UserModel(
        name: 'Deepa',
        phone: '7890123456',
        city: 'Himatnagar',
        imageUrl: 'https://picsum.photos/150?image=7',
        rupee: 40),
    UserModel(
        name: 'Chhagan',
        phone: '8901234567',
        city: 'Lal Darwaja',
        imageUrl: 'https://picsum.photos/150?image=8',
        rupee: 80),
    UserModel(
        name: 'Mahesh',
        phone: '9012345678',
        city: 'Thaltej',
        imageUrl: 'https://picsum.photos/150?image=9',
        rupee: 10),
    UserModel(
        name: 'Avina',
        phone: '0123456789',
        city: 'Jetalpur',
        imageUrl: 'https://picsum.photos/150?image=10',
        rupee: 55),
    UserModel(
        name: 'Umang',
        phone: '1234567891',
        city: 'Gandhinagar',
        imageUrl: 'https://picsum.photos/150?image=11',
        rupee: 65),
    UserModel(
        name: 'Sandeep',
        phone: '2345678902',
        city: 'Mansa',
        imageUrl: 'https://picsum.photos/150?image=12',
        rupee: 25),
    UserModel(
        name: 'Jagmal',
        phone: '3456789013',
        city: 'Racharda',
        imageUrl: 'https://picsum.photos/150?image=13',
        rupee: 35),
    UserModel(
        name: 'Jethalal',
        phone: '4567890124',
        city: 'Paldi',
        imageUrl: 'https://picsum.photos/150?image=14',
        rupee: 75),
    UserModel(
        name: 'Chandrika',
        phone: '5678901235',
        city: 'Bopal',
        imageUrl: 'https://picsum.photos/150?image=15',
        rupee: 45),
    UserModel(
        name: 'Urja',
        phone: '6789012346',
        city: 'Bhavnagar',
        imageUrl: 'https://picsum.photos/150?image=16',
        rupee: 55),
    UserModel(
        name: 'Tej',
        phone: '7890123457',
        city: 'Surat',
        imageUrl: 'https://picsum.photos/150?image=17',
        rupee: 15),
    UserModel(
        name: 'Ela',
        phone: '8901234568',
        city: 'Valsad',
        imageUrl: 'https://picsum.photos/150?image=18',
        rupee: 25),
    UserModel(
        name: 'Shivam',
        phone: '9012345679',
        city: 'Surendranagar',
        imageUrl: 'https://picsum.photos/150?image=19',
        rupee: 85),
    UserModel(
        name: 'Rekha',
        phone: '0123456780',
        city: 'Rajkot',
        imageUrl: 'https://picsum.photos/150?image=20',
        rupee: 95),
    UserModel(
        name: 'Ashok',
        phone: '1234567892',
        city: 'Somnath',
        imageUrl: 'https://picsum.photos/150?image=21',
        rupee: 35),
    UserModel(
        name: 'Hiren',
        phone: '2345678903',
        city: 'Dwarka',
        imageUrl: 'https://picsum.photos/150?image=22',
        rupee: 65),
    UserModel(
        name: 'Henil',
        phone: '3456789014',
        city: 'Dakor',
        imageUrl: 'https://picsum.photos/150?image=23',
        rupee: 5),
    UserModel(
        name: 'Jenish',
        phone: '4567890125',
        city: 'Kheda',
        imageUrl: 'https://picsum.photos/150?image=24',
        rupee: 45),
    UserModel(
        name: 'Manish',
        phone: '5678901236',
        city: 'Tarapur',
        imageUrl: 'https://picsum.photos/150?image=25',
        rupee: 55),
    UserModel(
        name: 'Jenik',
        phone: '6789012347',
        city: 'Khambhat',
        imageUrl: 'https://picsum.photos/150?image=26',
        rupee: 95),
    UserModel(
        name: 'Rikin',
        phone: '7890123458',
        city: 'Aaklav',
        imageUrl: 'https://picsum.photos/150?image=27',
        rupee: 65),
    UserModel(
        name: 'Rahul',
        phone: '8901234569',
        city: 'Mahudi',
        imageUrl: 'https://picsum.photos/150?image=28',
        rupee: 35),
    UserModel(
        name: 'Hemil',
        phone: '9012345670',
        city: 'Unja',
        imageUrl: 'https://picsum.photos/150?image=29',
        rupee: 75),
    UserModel(
        name: 'Himani',
        phone: '0123456781',
        city: 'Siddpur',
        imageUrl: 'https://picsum.photos/150?image=30',
        rupee: 95),
    UserModel(
        name: 'Hemangi',
        phone: '1234567893',
        city: 'Palanpur',
        imageUrl: 'https://picsum.photos/150?image=31',
        rupee: 15),
    UserModel(
        name: 'Om',
        phone: '2345678904',
        city: 'Disha',
        imageUrl: 'https://picsum.photos/150?image=32',
        rupee: 25),
    UserModel(
        name: 'Ganesh',
        phone: '3456789015',
        city: 'Kalupur',
        imageUrl: 'https://picsum.photos/150?image=33',
        rupee: 85),
    UserModel(
        name: 'Devarsh',
        phone: '4567890126',
        city: 'Jashoda',
        imageUrl: 'https://picsum.photos/150?image=34',
        rupee: 45),
    UserModel(
        name: 'Het',
        phone: '5678901237',
        city: 'CTM',
        imageUrl: 'https://picsum.photos/150?image=35',
        rupee: 35),
    UserModel(
        name: 'Nikhil',
        phone: '6789012348',
        city: 'Krishnanagar',
        imageUrl: 'https://picsum.photos/150?image=36',
        rupee: 5),
    UserModel(
        name: 'Amin',
        phone: '7890123459',
        city: 'Koba',
        imageUrl: 'https://picsum.photos/150?image=37',
        rupee: 65),
    UserModel(
        name: 'Deep',
        phone: '8901234570',
        city: 'Kapadvanj',
        imageUrl: 'https://picsum.photos/150?image=38',
        rupee: 75),
    UserModel(
        name: 'Vansh',
        phone: '9012345671',
        city: 'Botad',
        imageUrl: 'https://picsum.photos/150?image=39',
        rupee: 55),
    UserModel(
        name: 'Rajesh',
        phone: '0123456782',
        city: 'Dhodka',
        imageUrl: 'https://picsum.photos/150?image=40',
        rupee: 65),
    UserModel(
        name: 'Parth',
        phone: '1234567894',
        city: 'Visalpur',
        imageUrl: 'https://picsum.photos/150?image=41',
        rupee: 25),
    UserModel(
        name: 'Varin',
        phone: '0123456782',
        city: 'Madarkha',
        imageUrl: 'https://picsum.photos/150?image=42',
        rupee: 65),
    UserModel(
        name: 'Ujjawal',
        phone: '1234567894',
        city: 'Junaghad',
        imageUrl: 'https://picsum.photos/150?image=43',
        rupee: 25),
  ];

  final List<UserModel> _displayedUsers = [];
  final int _recordsPerPage = 20;
  int _currentPage = 0;
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadMoreRecords();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreRecords();
      }
    });
  }

  void _loadMoreRecords() {
    if (_isLoading) return;

    setState(() {
      _isLoading = false;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        final nextPageRecords = _allUsers
            .skip(_currentPage * _recordsPerPage)
            .take(_recordsPerPage)
            .toList();
        _displayedUsers.addAll(nextPageRecords);
        _currentPage++;
        _isLoading = false;
      });
    });
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Logout Evital App?",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                _logout(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit Evital App?',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            content: Text(
              'Are you sure you want to exit?',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _filterUsers() {
    setState(() {
      _displayedUsers.clear();
      _currentPage = 0;
      final filteredUsers = _allUsers.where((user) {
        final query = _searchQuery.toLowerCase();
        return user.name.toLowerCase().contains(query) ||
            user.phone.toLowerCase().contains(query) ||
            user.city.toLowerCase().contains(query);
      }).toList();
      _displayedUsers.addAll(filteredUsers.take(_recordsPerPage));
    });
  }

  bool _onScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification &&
        scrollNotification.metrics.extentAfter == 0) {
      _loadMoreRecords();
    }
    return false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showUpdateStockDialog(BuildContext context, UserModel user) {
    TextEditingController stockController = TextEditingController();
    stockController.text = user.rupee
        .toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Rupee for ${user.name}'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: stockController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'New Stock',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                int newRupee = int.tryParse(stockController.text) ?? 0;
                setState(() {
                  user.rupee = newRupee;
                });
                Fluttertoast.showToast(
                    msg: "Rupee updated to $newRupee rupees",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            "Home",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, size: 25, color: Colors.white),
              onPressed: () {
                showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  labelText: 'Search by name, phone or city',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _searchQuery = value;
                  _filterUsers();
                },
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: _onScrollNotification,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _displayedUsers.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _displayedUsers.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final user = _displayedUsers[index];
                    final ruppeStatus = user.rupee > 50 ? 'High' : 'Low';
                    final rupeeColor = user.rupee > 50 ? Colors.green : Colors.red;
                    final sequentialNumber = index + 1;
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 4.0,
                        // surfaceTintColor:
                        // Color(hexColor('#FFFFFF')),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                                  child: CachedNetworkImage(
                                    imageUrl: user.imageUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Name: ${user.name}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone: ${user.phone}'),
                                    Text('City: ${user.city}'),
                                    Text('Rupee: ₹${user.rupee} ($ruppeStatus)',
                                      style: TextStyle(
                                        color: rupeeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {
                                        _showUpdateStockDialog(context, user);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'User Record: $sequentialNumber',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontStyle: FontStyle.italic,fontSize: 13
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalcolor = int.parse(newColor);
  return finalcolor;
}
