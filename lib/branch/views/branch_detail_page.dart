import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:flutter/material.dart';

class BranchDetail extends StatelessWidget {
  const BranchDetail(this.branch, {Key? key}) : super(key: key);
  final Branch branch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(branch.nameBranch!),
    );
  }
}
