import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../salafiya/models/salafiya.dart';
import '../models/member.dart';
import '../providers/member_provider.dart';
import '../widgets/add_member_button.dart';
import '../widgets/member_card.dart';
import '../widgets/member_empty_state.dart';
import '../widgets/member_statistics.dart';
import 'member_form_screen.dart';

class MemberListScreen extends StatefulWidget {
  final Salafiya salafiya;

  const MemberListScreen({
    super.key,
    required this.salafiya,
  });

  @override
  State<MemberListScreen> createState() =>
      _MemberListScreenState();
}

class _MemberListScreenState
    extends State<MemberListScreen> {
  final TextEditingController searchController =
      TextEditingController();

  List<Member> filteredMembers = [];

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final provider =
          context.read<MemberProvider>();

      await provider.loadMembers(
        widget.salafiya.id!,
      );

      setState(() {
        filteredMembers =
            provider.members;
      });
    });
  }

  void search(String keyword) {
    final provider =
        context.read<MemberProvider>();

    if (keyword.trim().isEmpty) {
      setState(() {
        filteredMembers =
            provider.members;
      });
      return;
    }

    setState(() {
      filteredMembers =
          provider.members.where((member) {
        return member.fullName
            .toLowerCase()
            .contains(
              keyword.toLowerCase(),
            );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<MemberProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "أعضاء ${widget.salafiya.name}",
        ),
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        heroTag: "addMember",
        icon: const Icon(Icons.person_add),
        label: const Text("إضافة عضو"),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  MemberFormScreen(
                salafiyaId:
                    widget.salafiya.id!,
              ),
            ),
          );

          await provider.loadMembers(
            widget.salafiya.id!,
          );

          search(
            searchController.text,
          );
        },
      ),

      body: provider.loading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : Column(
              children: [

                Padding(
                  padding:
                      const EdgeInsets.all(
                    16,
                  ),
                  child:
                      MemberStatistics(
                    members:
                        provider.members,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextField(
                    controller:
                        searchController,
                    onChanged: search,
                    decoration:
                        InputDecoration(
                      hintText:
                          "بحث عن عضو",
                      prefixIcon:
                          const Icon(
                        Icons.search,
                      ),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Expanded(
                  child:
                      filteredMembers
                              .isEmpty
                          ? const MemberEmptyState()
                          : ListView.builder(
                              padding:
                                  const EdgeInsets
                                      .all(
                                      16),
                              itemCount:
                                  filteredMembers
                                      .length,
                              itemBuilder:
                                  (context,
                                      index) {
                                final member =
                                    filteredMembers[
                                        index];

                                return MemberCard(
                                  member:
                                      member,

                                  onEdit:
                                      () async {
                                    await Navigator
                                        .push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                MemberFormScreen(
                                          salafiyaId:
                                              widget
                                                  .salafiya
                                                  .id!,
                                          member:
                                              member,
                                        ),
                                      ),
                                    );

                                    await provider
                                        .loadMembers(
                                      widget
                                          .salafiya
                                          .id!,
                                    );

                                    search(
                                      searchController
                                          .text,
                                    );
                                  },

                                  onDelete:
                                      () async {
                                    final result =
                                        await showDialog<
                                            bool>(
                                      context:
                                          context,
                                      builder:
                                          (_) =>
                                              AlertDialog(
                                        title:
                                            const Text(
                                          "حذف العضو",
                                        ),
                                        content:
                                            const Text(
                                          "هل تريد حذف العضو؟",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () =>
                                                    Navigator.pop(
                                              context,
                                              false,
                                            ),
                                            child:
                                                const Text(
                                              "إلغاء",
                                            ),
                                          ),
                                          FilledButton(
                                            onPressed:
                                                () =>
                                                    Navigator.pop(
                                              context,
                                              true,
                                            ),
                                            child:
                                                const Text(
                                              "حذف",
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                    if (result ==
                                        true) {
                                      await provider
                                          .deleteMember(
                                              member);

                                      search(
                                        searchController
                                            .text,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                ),
              ],
            ),
    );
  }
}