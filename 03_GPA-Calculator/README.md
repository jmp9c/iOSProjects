A simple GPA-Calculator made in Xcode with Swift of iOS

How its supposed to work:
9 UITextFields for inputting grades (Letter form)
9 UITextFields for inputting credit hours (numeric form)
A button to calculate everything.

What works: 
The math and computing of the GPA works fine (as far as I know, hasn't been tested for accuracy)

What doesn't work:
Trying to get a PickerView to work for the grade UITextFields

Inside of UIPickerView, due to some protocol or something I know 0 about, you have to define a method
that includes a paramter "didSelectRow". This is whats called when the user selects something from the
PickerView.

Inside of that method is where you want to update what TextField is being edited
But here's the problem: I have 9 TextFields... I don't want 9 different PickerViews that do the same thing
I don't want 9 different methods to deal with it.
