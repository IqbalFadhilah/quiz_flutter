import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz UI Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz UI Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Nomor Kelompok:  19',
            ),
            const Text(
              'Mhs 1:  2202292 Muhammad Iqbal Fadhilah',
            ),
            const Text(
              'Mhs 2:  2201090 Naufal Nabil A',
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return soalNo1();
                  }));
                },
                child: const Text('   Jawaban No 1   '),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return soalNo2();
                  }));
                },
                child: const Text('   Jawaban No 2   '),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  //Jawaban no1
  Widget soalNo1(){
    final _formKey = GlobalKey<FormState>();
    String _namaDepan = '';
    String _namaBelakang = '';
    String _gender = '';
    DateTime? _dateOfBirth;
    String _alamat = '';
    final _dateController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 40.0, right: 60.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Budi Martami',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage('https://1.bp.blogspot.com/-ufPUMFSmzRk/Xbd9vpx_bVI/AAAAAAAAPDI/jw3q5WNkB1EwNrNdrfNZRu1Jpp2A9230ACLcBGAsYHQ/s1600/foto%2Bprofil%2Bwa%2B26.jpg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, right: 30.0, left: 30.0),
                child: SizedBox(
                  height: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.black)), 
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ubah Profil',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Nama Depan',
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Nama Depan harus diisi';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _namaDepan = value!,
                              ),
                              SizedBox(height: 8.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Nama Belakang',
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Nama Belakang harus diisi';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _namaBelakang = value!,
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Gender',
                                        ),
                                        SizedBox(height: 6.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center, // Mencentralisasi teks
                                              child: DropdownButtonFormField<String>(
                                                value: 'Perempuan',
                                                items: ['Perempuan', 'Laki-laki']
                                                    .map((gender) => DropdownMenuItem(
                                                          value: gender,
                                                          child: Text(gender),
                                                        ))
                                                    .toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _gender = value!;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.all(4.0),
                                                  border: InputBorder.none,
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Gender harus dipilih';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Tanggal Lahir',
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          GestureDetector(
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now(),
                                              ).then((selectedDate) {
                                                if (selectedDate != null) {
                                                  setState(() {
                                                    _dateOfBirth = selectedDate;
                                                    _dateController.text = '${_dateOfBirth!.day}/${_dateOfBirth!.month}/${_dateOfBirth!.year}'; // Memperbarui teks
                                                  });
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _dateController, // Menggunakan TextEditingController
                                                      enabled: false,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        labelText: _dateOfBirth != null
                                                            ? '${_dateOfBirth!.day}/${_dateOfBirth!.month}/${_dateOfBirth!.year}'
                                                            : 'DD/MM/YYYY',
                                                      ),
                                                      validator: (value) {
                                                        if (_dateOfBirth == null) {
                                                          return 'Tanggal Lahir harus diisi';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.0),
                                                  Icon(Icons.calendar_today, size: 20.0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Alamat',
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Alamat harus diisi';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _alamat = value!,
                              ),
                              SizedBox(height: 16.0),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 120.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        print('Nama Depan: $_namaDepan');
                                        print('Nama Belakang: $_namaBelakang');
                                        print('Gender: $_gender');
                                        print('Tanggal Lahir: $_dateOfBirth');
                                        print('Alamat: $_alamat');
                                                    
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Profil Berhasil Diubah"),
                                              content: Text("Profil Anda berhasil diperbarui."),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text("OK"),
                                                  onPressed: () {
                                                    _formKey.currentState!.reset();
                                                    setState(() {
                                                      _dateOfBirth = null;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow[600],
                                    ),
                                    child: Text(
                                      'Simpan',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }

  //jaawaban no 2
  Widget soalNo2() {
    List<CustomIcon> customIcons = [
      CustomIcon(icon: Icons.storefront_outlined, name: "Official Store"),
      CustomIcon(icon: Icons.local_fire_department, name: "Hot Deal"),
      CustomIcon(icon: Icons.checkroom, name: "Fashion"),
      CustomIcon(icon: Icons.face_retouching_natural, name: "Kosmetik"),
    ];
    
    final List<String> imgList = [
      'https://th.bing.com/th/id/OIP.PKO9rgZoVUtVqzFd5QgyWAHaE9?rs=1&pid=ImgDetMain',
      'https://th.bing.com/th/id/OIP.ni4LOLy-j_Bt6Elyn6GuVwHaE8?rs=1&pid=ImgDetMain',
      'https://th.bing.com/th/id/R.6d7a4cdab9274c1061dd1df4c8054c2b?rik=mjvlh3zkGIYtXg&riu=http%3a%2f%2f2.bp.blogspot.com%2f-LqPb5E12SQ0%2fVpSJDA4SZJI%2fAAAAAAAAA5Y%2f56NYenFU6Gk%2fs1600%2fpegunungan-gunung-berapi-bali.jpg&ehk=RsPAMPAxii2qGGbVVbyfwxa9daFCiAVTgw%2fnQcK5gik%3d&risl=&pid=ImgRaw&r=0',
      'https://th.bing.com/th/id/OIP.SRrdsMkvRACFlh69dhjGowHaFj?rs=1&pid=ImgDetMain',
      'https://th.bing.com/th/id/R.8ae756ae45b4e6781177f538ae9aae8b?rik=KllM21A17A2ZbA&riu=http%3a%2f%2fanekatempatwisata.com%2fwp-content%2fuploads%2f2016%2f08%2fGunung-Bromo-Jawa-Timur.jpg&ehk=%2f80k93k8nMJj7JFwe1O7JNW7DIimEAJ%2bxrnQV1hpGPw%3d&risl=&pid=ImgRaw&r=0'
    ];
    return Scaffold(
      body: 
      Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/id/490/300/200'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 15.0),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        hintText: 'Cari barang di Tokoo',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.chat, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Halo, Budi!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFF0EEE9),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.wallet, color: Color(0xFF8D5959)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Store\nCredit\nRp.0', textAlign: TextAlign.center,),
                    ],
                  ),
                  Container(width: 1, height: 40, color: Colors.black),
                  Icon(Icons.loyalty, color: Color(0xFF8D5959)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Reward\nPoint\n100 Point', textAlign: TextAlign.center),
                    ],
                  ),
                  Container(width: 1, height: 40, color: Colors.black),
                  Icon(Icons.confirmation_num, color: Color(0xFF8D5959)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Kupon\nSaya\n11 Kupon', textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(customIcons.length, (index){
              return Column(
                children: [
                  Container(
                    child: Icon(customIcons[index].icon, size: 35, color: customIcons[index].icon == Icons.local_fire_department ? Colors.red : null),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    customIcons[index].name, 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              );
              }),
            ),
          ),
          SizedBox(height: 12),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                      ),
                    )
                  )
                .toList(),
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.yellow[700]
        ), 
        child: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
            NavigationDestination(icon: Icon(Icons.category), label: 'Kategori'),
            NavigationDestination(icon: Icon(Icons.qr_code), label: 'Scan'),
            NavigationDestination(icon: Icon(Icons.shopping_basket), label: 'List Belanja'),
            NavigationDestination(icon: Icon(Icons.account_circle), label: 'Akun'),
          ],
        )
      ),
    );
  }
}

class CustomIcon {
  final IconData icon;
  final String name;
  CustomIcon({
    required this.icon,
    required this.name,
  }); 
}