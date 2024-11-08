# **Pemrograman Mobile Pertemuan Minggu 9**

| Nama  :   | Haidar Aly |
| :--------: | :-------: |

| Kelas :  | TI-3F    |
| :--------: | :-------: |

| Absen : |  09  |
| :--------: | :-------: |

| NIM   :  | 2241720258   |
| :--------: | :-------: |

## Praktikum 1

### Langkah 1 - Membuat Project Baru

### Langkah 2 - Menambahkan Dependency

### Langkah 3 - Ambil Sensor Kamera Dari Device

### Langkah 4 - Buat dan Inisialisasi `CameraController`
#### `takepicture_screen.dart`
```dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_flutter/widget/displaypicture_screen.dart';

class TakepictureScreen extends StatefulWidget {
  const TakepictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakepictureScreen>{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }      
```

### Langkah 5 - Gunakan `CameraPreview` Untuk Menampilkan Preview Foto
#### `takepicture_screen.dart`
```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
```

### Langkah 6 - Ambil foto dengan `CameraController`
#### `takepicture_screen.dart`
```dart
floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
```

### Langkah 7 - Buat Widget Baru `DisplayPictureScreen`
#### `displaypicture_screen.dart`
```dart
import 'dart:io';

import 'package:flutter/material.dart';

class DisplaypictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplaypictureScreen({Key? key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
```

### Langkah 8 - Edit `main.dart`
```dart
runApp(
    MaterialApp(
        theme: ThemeData.dark(),
        home: TakepictureScreen(
            camera: firstCamera,
        ),
        debugShowCheckedModeBanner: false,
    ),
);
```

### Langkah 9 - Menampilkan Hasil Foto
#### `takepicture_screen.dart`
```dart
floatingActionButton: FloatingActionButton(
    onPressed: () async {
        try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

            if (!context.mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplaypictureScreen(
                  imagePath: image.path
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
```

## Praktikum 2

### Langkah 1 - Buat Project Baru

### Langkah 2 - Buat Widget Selector Ring dan Dark Gradient

### Langkah 3 - Buat Widget Photo Filter Carousel

### Langkah 4 - Membuat Filter Warna - Bagian 1

### Langkah 5 - Membuat Filter Warna

### Langkah 6 - Implementasi Carousel

## Tugas