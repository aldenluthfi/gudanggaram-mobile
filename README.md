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



