# GudangGaram

## Tugas 7

### Proses Implementasi
1.  Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
    - Melanjutkan GudangGaram dari tugas sebelumnya.

2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:
 Melihat daftar item (Lihat Item),
 Menambah item (Tambah Item),
 Logout (Logout)

``` dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.view_in_ar, const Color(0xFF78D6C6)),
    ShopItem("Tambah Item", Icons.add_box, const Color(0xFF419197)),
    ShopItem("Logout", Icons.logout_outlined, const Color(0xFF12486B)),
];

Column(
    children: items.map((item) {
    return SizedBox(
        width: 300,
        height: 200,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShopCard(item),
        ),
    );
    }).toList(),
),

class ShopItem {
  final String name;
  final IconData iconFeat;
  final Color cardColor;

  ShopItem(this.name, this.iconFeat, this.cardColor);
}

class ShopCard extends StatelessWidget {
  final ShopItem feat;

  const ShopCard(this.feat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: feat.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text("Kamu telah menekan tombol ${feat.name}"),
          ),
        ),
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  feat.iconFeat,
                  color: Colors.white,
                  size: 50.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  feat.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

3. Memunculkan Snackbar dengan tulisan:

    "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.

    "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.

    "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

```dart
 child: InkWell(
    onTap: () => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
        SnackBar(
        content: Text("Kamu telah menekan tombol ${feat.name}"),
        ),
    ),
```

### Jawaban dan Pertanyaan
1.Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

- Stateless Widget:
    -  Stateless widget adalah widget yang tidak menyimpan keadaan internal atau data yang dapat berubah. Itu berarti sekali dibuat, tampilan dari widget tersebut tidak akan berubah sepanjang siklus hidupnya.
- Stateful Widget:
    - Stateful widget adalah widget yang menyimpan keadaan internal atau data yang dapat berubah. Itu berarti sekali dibuat, tampilan dari widget tersebut dapat berubah sepanjang siklus hidupnya.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    1. Scaffold:
        - Widget Scaffold merupakan struktur dasar untuk sebuah halaman. Hal ini memungkinkan untuk menentukan AppBar, body, dan berbagai bagian dari tata letak halaman.

    2. AppBar:

        - AppBar adalah bagian atas halaman yang biasanya berisi judul dan beberapa fungsi lainnya seperti tombol kembali, aksi, dll.

    3. SingleChildScrollView:

        - SingleChildScrollView digunakan untuk mengizinkan konten di dalamnya dapat di-gulir (scrollable) ketika kontennya melebihi ruang yang tersedia.

    4. Column:

        - Column digunakan untuk menata widget secara vertikal, sehingga elemen-elemen yang diletakkan di dalamnya akan ditampilkan dari atas ke bawah.

    5. Padding:

        - Padding digunakan untuk menambahkan jarak (padding) di sekitar widget tertentu.

    6. Text:

        - Text menampilkan teks tertentu di layar dengan pengaturan tertentu seperti ukuran font, warna, dll.

    7. SizedBox:

        - SizedBox digunakan untuk menentukan dimensi (lebar dan tinggi) dari widget di dalamnya.

    8. ShopCard:

        - ShopCard adalah custom widget yang digunakan untuk menampilkan kartu toko dengan icon, teks, dan aksi saat di-tap.

    9. InkWell:

        - InkWell memberikan efek splash saat widget di-tap, dan di dalamnya terdapat aksi yang terhubung dengan interaksi tap.

    10. Material:

        - Material adalah sebuah widget yang memberikan efek material design dengan properti seperti warna dan border radius pada bagian tertentu dari UI.

    11. Icon:

        - Icon digunakan untuk menampilkan ikon tertentu di layar.
    12. SnackBar:

        - SnackBar digunakan untuk menampilkan pesan singkat pada bagian bawah layar sebagai respon terhadap interaksi pengguna.


## Tugas 8

### Proses Implementasi
1. Membuat halaman form tambah item
    - 
    ```dart
    class AddForm extends StatefulWidget {
    const AddForm({super.key});
    @override
    State<AddForm> createState() => _AddFormState();
    }

    class _AddFormState extends State<AddForm> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Form Simpan',
            ),
            ),
            backgroundColor: const Color(0xFF419197),
            foregroundColor: Colors.white,
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
                children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Nama",
                        labelText: "Nama",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) => setState(() {
                        _name = value!;
                    }),
                    validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? "Nama tidak boleh kosong!"
                            : (int.tryParse(value) != null)
                                ? "Nama harus berupa kata!"
                                : null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Amount",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) => setState(() {
                        _amount = int.parse(value!);
                    }),
                    validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? "Amount tidak boleh kosong!"
                            : (int.tryParse(value) == null)
                                ? "Amount harus berupa angka!"
                                : null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _description = value!;
                        });
                    },
                    validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? "Description tidak boleh kosong!"
                            : (int.tryParse(value) != null)
                                ? "Description harus berupa kata!"
                                : null;
                    },
                    ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF12486B)),
                        ),
                        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            data.add(Salts(
                            _name,
                            _amount,
                            _description,
                            
                            ));
                            showDialog(
                                context: context,
                                builder: (context) {
                                return AlertDialog(
                                    title: const Text(
                                    'Salt berhasil tersimpan',
                                    style: TextStyle(
                                        color: Colors.green,
                                    ),
                                    ),
                                    content: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                        Text('Name: $_name', style: const TextStyle(color: Colors.black),),
                                        Text('Amount: $_amount', style: const TextStyle(color: Colors.black),),
                                        Text('Description: $_description', style: const TextStyle(color: Colors.black),),
                                        ],
                                    ),
                                    ),
                                    actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage(),
                                                )),
                                        child: const Text('SIP'))
                                    ],
                                );
                                });
                            _formKey.currentState!.reset();
                        }
                        },
                        child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }

    ```

2. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

    - 
    ```dart
    onTap: () {
            if (feat.name == "Lihat Item") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SaltCard()),
              );
            } else if (feat.name == "Tambah Item") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddForm()),              );
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${feat.name}!")));
            }
          },
    ```

3. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

    - 
    ```dart
    onPressed: () {
        if (_formKey.currentState!.validate()) {
        data.add(Salts(
            _name,
            _amount,
            _description,
            
        ));
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                title: const Text(
                    'Salt berhasil tersimpan',
                    style: TextStyle(
                    color: Colors.green,
                    ),
                ),
                content: SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                        Text('Name: $_name', style: const TextStyle(color: Colors.black),),
                        Text('Amount: $_amount', style: const TextStyle(color: Colors.black),),
                        Text('Description: $_description', style: const TextStyle(color: Colors.black),),
                    ],
                    ),
                ),
                actions: [
                    TextButton(
                        onPressed: () =>
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(),
                                )),
                        child: const Text('SIP'))
                ],
                );
            });
        _formKey.currentState!.reset();
        }
    },
    ```

4. Membuat sebuah drawer

    - 
    ```dart
    class DrawerNavi extends StatelessWidget {
    const DrawerNavi({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        backgroundColor: const Color.fromARGB(255, 172, 196, 11),
        child: ListView(
            children: [
            const SizedBox(
                height: 200,
                child: DrawerHeader(
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 196, 11),
                ),
                child: Column(
                    children: [
                    Text(
                        'Gudang\nGaram',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Nyimpen apa-apa disini",
                    textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        ),
                    ),
                    ],
                ),
                ),
            ),
            ListTile(
                tileColor: const Color.fromARGB(255, 172, 196, 11),
                leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                ),
                title: const Text(
                'Halaman Utama',
                style: TextStyle(
                    color: Colors.white
                ),
                ),
                onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                )
                )
            ),
            ListTile(
                tileColor: const Color.fromARGB(255, 172, 196, 11),
                leading: const Icon(
                Icons.add_box,
                color: Colors.white,
                ),
                title: const Text(
                'Tambah Item',
                style: TextStyle(
                    color: Colors.white
                ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddForm()))
            ),
            ListTile(
                tileColor: const Color.fromARGB(255, 172, 196, 11),
                leading: const Icon(
                Icons.view_in_ar,
                color: Colors.white,
                ),
                title: const Text(
                'Lihat Item',
                style: TextStyle(
                    color: Colors.white
                ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SaltCard()))
            ),
            ],
        ),
        );
    }
    }
    ```

### Jawaban dan Pertanyaan
1. Perbedaan antara Navigator.push() dan Navigator.pushReplacement() dalam Flutter:

- Navigator.push():
Fungsi ini digunakan untuk menavigasi ke halaman baru di atas halaman saat ini.
Halaman baru ditumpuk di atas tumpukan navigasi, jadi ketika pengguna kembali, mereka akan kembali ke halaman sebelumnya.
Contoh Penggunaan: Anda menggunakan Navigator.push() ketika ingin membawa pengguna ke halaman detail dari suatu item dalam daftar. Pengguna dapat kembali ke daftar dengan menekan tombol kembali.

- Navigator.pushReplacement():
Fungsi ini menggantikan halaman saat ini di tumpukan navigasi dengan halaman baru.
Ini tidak menyimpan halaman sebelumnya di tumpukan. Jadi, ketika pengguna kembali, mereka tidak akan kembali ke halaman sebelumnya.
Contoh Penggunaan: Anda menggunakan Navigator.pushReplacement() untuk alur seperti login ke dashboard. Setelah berhasil login, halaman login digantikan dengan dashboard, dan pengguna tidak dapat kembali ke halaman login dengan tombol kembali.

2. Layout Widgets dalam Flutter dan Konteks Penggunaannya:

- Column dan Row:

    Digunakan untuk mengatur child widgets dalam bentuk vertikal (Column) atau horizontal (Row).
    Cocok untuk membuat tata letak yang linier dan responsif.

- Container:

    Widget serba guna untuk dekorasi, padding, dan penyesuaian ukuran.
    Baik untuk membuat widget dengan background, border, atau margin tertentu.

- Stack:

    Mengatur widgets secara bertumpuk.
    Ideal untuk tata letak overlay, seperti teks di atas gambar.

- GridView:

    Menampilkan data dalam format grid.
    Berguna untuk galeri gambar atau tampilan grid produk.

- ListView:

    Menampilkan daftar scrollable secara vertikal.
    Cocok untuk daftar item yang panjang seperti feed berita atau email.

- Flex dan Expanded:

    Mengatur space allocation antar widgets dalam Row atau Column.
    Penting untuk tata letak yang fleksibel dan adaptif terhadap ukuran layar.

- Padding:

    Memberi jarak di dalam widget.
    Penting untuk UI yang lega dan nyaman dilihat.

- Align dan Center:

    Mengontrol posisi widget di dalam container.
    Berguna untuk penempatan widget secara spesifik atau sentralisasi widget.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

- TextFormField untuk Nama:
    Tujuan Penggunaan: Untuk mengumpulkan nama item yang disimpan. Nama merupakan identifikasi dasar untuk setiap item.
    Validator: Memastikan bahwa field nama tidak kosong dan mengandung kata, bukan angka, yang penting untuk memastikan input yang valid dan menghindari kebingungan dalam identifikasi item.

- TextFormField untuk Jumlah (Amount):
    Tujuan Penggunaan: Untuk mengumpulkan jumlah item. Ini penting untuk manajemen inventaris dan pemantauan stok.
    Validator: Memastikan bahwa field jumlah tidak kosong dan hanya berisi angka. Ini vital untuk keakuratan data numerik, seperti stok atau jumlah item.

- TextFormField untuk Deskripsi (Description):
    Tujuan Penggunaan: Untuk memberikan deskripsi tambahan tentang item. Deskripsi ini dapat berisi informasi seperti spesifikasi, kegunaan, atau detail lain yang relevan.
    Validator: Memastikan bahwa deskripsi tidak kosong dan harus berupa kata. Ini penting untuk menyediakan informasi yang jelas dan lengkap tentang item.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan Clean Architecture pada Aplikasi Flutter:
- Pemisahan Layer:

    - Membagi aplikasi menjadi beberapa layer seperti Presentation, Business Logic, dan Data.
    - Ini memudahkan manajemen kode dan testing.

- Modularisasi:
    - Setiap fitur dibuat modular. Hal ini meningkatkan keterbacaan dan kemudahan dalam pemeliharaan kode.

- Dependency Inversion:
    - Komponen high-level tidak bergantung pada komponen low-level, melainkan bergantung pada abstraksi.
    - Ini meningkatkan fleksibilitas dan memudahkan penggantian komponen.

- Use Cases / Interactors:
    - Membuat use cases untuk menangani bisnis logik.
    - Ini memudahkan pengujian logika bisnis secara terpisah dari UI.

- Repository Pattern:
    - Menggunakan pattern ini untuk mengatur akses data.
    - Memudahkan pergantian sumber data (misalnya dari lokal ke remote) tanpa mengubah logika bisnis.

- Testing:
    - Memastikan setiap layer dapat diuji secara terpisah.
    - Meningkatkan kualitas dan keandalan kode.