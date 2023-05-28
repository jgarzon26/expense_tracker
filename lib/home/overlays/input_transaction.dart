import 'package:expense_tracker/classes/transaction.dart';
import 'package:expense_tracker/constants.dart';
import 'package:expense_tracker/date_data.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputTransaction extends StatefulWidget {
  const InputTransaction({
    super.key,
  });

  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  late final TextEditingController _titleController;
  late final FocusNode _titleFocusNode;

  bool isAmountActive = false;
  double amountValue = 0;

  DateTime? dateValue;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _titleFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultFontSize = 12.0;

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAscentColor,
                ),
              ),
              labelText: 'Title',
              labelStyle: TextStyle(
                fontSize: defaultFontSize,
                color: _titleFocusNode.hasFocus ? kAscentColor : Colors.grey,
              ),
            ),
            focusNode: _titleFocusNode,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Amount',
              style: TextStyle(
                fontSize: defaultFontSize,
                color: isAmountActive ? kAscentColor : Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              amountValue.toStringAsFixed(2),
              style: TextStyle(
                fontSize: defaultFontSize + 2,
                color: isAmountActive ? kAscentColor : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CupertinoSlider(
              value: amountValue,
              onChanged: (value) {
                setState(() {
                  amountValue = value;
                });
              },
              onChangeStart: (value) {
                setState(() {
                  isAmountActive = true;
                });
              },
              onChangeEnd: (value) {
                setState(() {
                  isAmountActive = false;
                });
              },
              min: 0,
              max: context.read<TransactionProvider>().maxAmount,
              thumbColor: kAscentColor,
              activeColor: kAscentColor,
              divisions: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateValue == null
                    ? 'No Date Chosen'
                    : 'Picked Date: ${dateValue?.month}/${dateValue?.day}/${dateValue?.year}',
                style: const TextStyle(
                  fontSize: defaultFontSize,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: dates.first,
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dateValue = pickedDate;
                    });
                  }
                },
                child: const Text(
                  'Change Date',
                  style: TextStyle(
                    color: kAscentColor,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _titleController.text.isNotEmpty && dateValue != null
                  ? () {
                      context.read<TransactionProvider>().addAndUpdateTransaction(
                        transaction: Transaction(
                          title: _titleController.text,
                          amount: amountValue,
                          date: dateValue!,
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: kAscentColor,
                foregroundColor: kPrimaryColor,
              ),
              child: const Text('Add Transaction'),
            ),
          ),
        ],
      ),
    );
  }
}
