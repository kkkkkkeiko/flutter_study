import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/model/radio_type.dart';
import 'package:flutter_study/provider/service_provider.dart';
import 'package:gap/gap.dart';

class CardToDoListWidget extends ConsumerWidget {
  const CardToDoListWidget({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(
      data:
          (todoData) => Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: todoData[getIndex].category.getColor(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  width: 20,
                ),
                //const Gap(12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: IconButton(
                            icon: Icon(CupertinoIcons.delete),
                            onPressed:
                                () => ref
                                    .read(serviceProvider)
                                    .deleteTask(todoData[getIndex].docID),
                          ),
                          title: Text(
                            todoData[getIndex].titleTask,
                            maxLines: 1,
                            style: TextStyle(
                              decoration:
                                  todoData[getIndex].isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                            ),
                          ),
                          subtitle: Text(
                            todoData[getIndex].description,
                            maxLines: 1,
                            style: TextStyle(
                              decoration:
                                  todoData[getIndex].isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              activeColor: Colors.blue.shade700,
                              shape: const CircleBorder(),
                              value: todoData[getIndex].isDone,
                              onChanged: (value) {
                                if (value == null) {
                                  print('error');
                                  return;
                                }
                                ref
                                    .read(serviceProvider)
                                    .updateTask(
                                      todoData[getIndex].docID,
                                      value,
                                    );
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -12),
                          child: Container(
                            child: Column(
                              children: [
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.grey.shade200,
                                ),
                                Row(
                                  children: [
                                    Text(todoData[getIndex].dateTask),
                                    Gap(12),
                                    Text(todoData[getIndex].timeTask),
                                  ],
                                ),
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
          ),
      error: (error, stackTrace) => Center(child: Text(stackTrace.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
