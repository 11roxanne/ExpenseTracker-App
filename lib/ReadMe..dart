/*
Contents of the project-
Main.dart- Is the main file it contains the orientation of the app and the runApp method and materialApp which provides basic material
           design to the app

Expense.dart- It contains the dummy date(Registeredlist), function methods like - save ,remove and all expense and also the appbar and the backgorund decoration
            - The addExpense method is called when the user taps on the add icon in the app bar. It shows a modal bottom sheet that contains the NewExpense widget.
            - The saveExpense method is called when the user saves a new expense in the NewExpense widget. It receives the expense parameter, which is an instance of ExpenseModel
            and adds it to the _registeredExpenses list.
            -The saveExpense method is called when the user saves a new expense in the NewExpense widget. It receives the expense parameter and removes  it from the _registeredExpenses list.

ExpenseItem.dart - It contains the card material and all decoration of the containers.

ExpenseList.dart- It contains the ListView.build widget which helps in scrolling through the list of containers.

NewExpense.dart- widget is responsible for capturing and saving a new expense. It receives a function onSaveExpense as a parameter, which will be called when the user saves an expense.
               - The titleInput method is called when the user enters a title in the text field. It updates the enteredTitle variable with the entered value .
               - The amountInput method is called when the user enters an amount in the text field. It updates the enteredAmount variable with the entered value
               - The submitExpense method is called when the user taps on the "Save Expense" button. It performs validation on the entered data (title, amount, date) and displays an alert dialog if any field is invalid.
               If the data is valid, it creates a new ExpenseModel object using the entered data and the selected category, calls the onSaveExpense function passed from the parent widget with the new expense, and clears the input fields.


*/
