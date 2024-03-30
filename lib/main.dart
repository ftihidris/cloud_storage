import 'package:cloud_storage/firebase_options.dart';
import 'package:cloud_storage/storage_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '',),
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
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async{
                final results= await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png','jpg'],
                  );
                  if (results== null){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No file selected'),
                      ),
                      );
                  }
                  final path = results!.files.single.path;
                  final fileName = results.files.single.name;
                  
                  storage
                  .uploadFile(path!, fileName)
                  .then((value)=> print('Done'));

                  print(path);
                  print(fileName);
                },
              child: const Text('Upload File'),
            ),
          ),
          FutureBuilder(
            future: storage.listFiles(),
            builder: (BuildContext context, 
             AsyncSnapshot<firebase_storage.ListResult> snapshot ){
              if (snapshot.connectionState == ConnectionState.done &&
               snapshot.hasData) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount :snapshot.data!.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton( 
                          onPressed: () {},
                          child: Text (snapshot.data!.items[index].name),
                      ),
                  );
                }),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
            return CircularProgressIndicator();
            }
            return Container();
            
          }),
          FutureBuilder(
            future: storage.downloadURL('BrowserPreview_tmp-3.png'),
            builder: (BuildContext context, 
             AsyncSnapshot<String> snapshot ){
              if (snapshot.connectionState == ConnectionState.done &&
               snapshot.hasData) {
                return Container(
                  width: 300,
                  height: 250,
                  child: Image.network(snapshot.data!,
                  fit: BoxFit.cover,
                  )
                );

            }
            if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
            return CircularProgressIndicator();
            }
            return Container();
            }),
        ],
      ),
    );
  }
}
