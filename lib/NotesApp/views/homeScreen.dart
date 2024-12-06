import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxsratemanagment/NotesApp/controller/NotesController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    NotesController controller = Get.put(NotesController());

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Notes App',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child:Obx(() =>  Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            ...List.generate(
              controller.userList.length,
                  (index) => Card(
                child: ListTile(
                  leading:
                  CircleAvatar(radius: 20, child: Text('${index + 1}')),
                  title: Text('${controller.userList[index].title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  subtitle: Text.rich(TextSpan(children: [
                    TextSpan(text: '${controller.userList[index].dateTime}\n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    TextSpan(text: '${controller.userList[index].task}\n',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),

                    TextSpan(text: '${controller.userList[index].description}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey)),
                  ])),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              title.text = controller.userList[index].title;
                              task.text = controller.userList[index].task;
                              description.text =
                                  controller.userList[index].description;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Form(
                                      key: formkey,
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Update Note',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: title,
                                            decoration: InputDecoration(
                                              label: Text('Title'),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: task,
                                            decoration: InputDecoration(
                                              label: Text('Task'),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextField(
                                            controller: description,
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                              label: const Text('Description'),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            controller.updateList(task.text, title.text, description.text, DateTime.now(), index);
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text('Update Save'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text('Save'))
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {
                          controller.removeAtList(index);
                        }, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          title = TextEditingController();
          task = TextEditingController();
          description = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(2),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text('Add Note',style: TextStyle(fontWeight: FontWeight.bold),),
                      TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "This deatils is mandatory"
                              : null;
                        },
                        controller: title,
                        decoration: InputDecoration(
                            label: Text('Title'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "This deatils is mandatory"
                              : null;
                        },
                        controller: task,
                        decoration: InputDecoration(
                            label: Text('Task'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "This deatils is mandatory"
                              : null;
                        },
                        controller: description,
                        maxLines: 2,
                        decoration: InputDecoration(
                          label: Text('Description'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        controller.addToList(task.text, title.text,
                            description.text, DateTime.now());

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Note Save'),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: Text('Save'))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
