import 'package:counterapp/main.dart';
import 'package:counterapp/provider/Fev_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class fevAddedItem extends StatelessWidget {
  const fevAddedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<FevProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fev Tab'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: counterProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FevProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                        print(value.selectedItem);
                      },
                      leading: Text('Item Number : $index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
