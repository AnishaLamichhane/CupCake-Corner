# CupCake-Corner
A multi-screen app for ordering cupcakes.

Challenge
1. One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully     understand what’s going on.

2. Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of    pure whitespace is invalid.
If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, just disable WiFi on your Mac so the simulator has no connection either.
3. For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.


Uploading project 10.mov…

