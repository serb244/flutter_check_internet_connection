import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/network_bloc.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NetworkBloc()..add(NetworkObserve()),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Page1(),
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (!state.isConnected) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 50),
            content: Text('No internet connection'),
          ));
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1D1E22),
          title: BlocBuilder<NetworkBloc, NetworkState>(
            builder: (context, state) {
              return Text(
                  state.isConnected ? 'FLUTTER GUYS' : 'CHECK YOUR CONNECTION');
            },
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Show SnackBar'),
                ),
              ),
              MaterialButton(
                  height: 60,
                  minWidth: 200,
                  color: const Color(0xff1D1E22),
                  onPressed: () => Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Page2(),
                        ),
                      ),
                  child: const Text(
                    'GO TO PAGE 2',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[700],
        title: const Text('FLUTTER GUYS'),
        centerTitle: true,
      ),
    );
  }
}
