//
//  Singleton.swift
//  Singleton
//
//  Created by Khalid Kamil on 30/05/2023.
//

import UIKit

/// Singleton

// Main Module
extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {}
}

extension ApiClient {
    func loadFeed(completion: ([FeedItem]) -> Void) {}
}


// API Module
// This cannot be a final class because Singletons pattern allows for extension
class ApiClient {
    // Give access to one client
    // Use of static is thread-safe because it is evaluated lazily. Guaranteed that we don't end up with multiple instances even if we access the property from multiple threads at the same time.
    // Changing let to var so you can inject a MockApiClient would make this a global state variable and it would no longer be a singleton
    static let shared = ApiClient()
    
    // Prevent people from creating more clients
    // Remove this to turn this into a lowercase singleton i.e. allows people to create their own instances of the class
    // private init() {}
    
    func execute(_ : URLRequest, completion: (Data) -> Void) {}
}

// Use subclass to override/change behaviour.
//class MyApiClient: ApiClient {
//    func sayHi2() {
//        print("hello2")
//    }
//}

// Use extensions to you can add behaviour but not override behaviour.
//extension ApiClient {
//    func sayHi() {
//        print("hello")
//    }
//}

// 4) Mock subclass that would override the login function and can intercpet the call to the api so you can test whatever you want to test in the unit test
class MockApiClient: ApiClient {}

let client = ApiClient.shared

/// singleton (lowercase s)
// This is for providing convenient shared instance (not actually a true Singleton)

// Login Module
struct LoggedInUser {}

class LoginViewController: UIViewController {
    // 2) Using property injection here allows us to subclass the ApiClient to create a mock which we can pass to the api variable in the test instead of the real ApiClient
    //  var api = ApiClient.shared
    var login: (((LoggedInUser) -> Void) -> Void)?
    
    func didTapLoginButton() {
        // 1) ApiClient.instance is not testable, because you can't mock the ApiClient because the instance property is a let
        // 3) Use api var instead
        // api.login() { user in
        login? { user in
            // Login function gets user back that you do some work with here
            // Show feed screen
        }
    }
}

// Feed Module
// Problem with the initial architecture is that when I added the FeedViewController, I had to go back to the ApiClient and manually add the loadFeed function. One solution is to use extensions to add the functions that are required by each module.

struct FeedItem {}

class FeedViewController: UIViewController {
    //  var api = ApiClient.shared
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  api.loadFeed() { loadedItems in
        loadFeed? { loadedItems in
            // Update UI
        }
    }
}
