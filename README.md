


<p align="center">
<img src="https://img.shields.io/badge/Swift-4.2-orange.svg" alt="Swift 4.2"/>
<img src="https://img.shields.io/badge/Xcode-10%2B-brightgreen.svg" alt="XCode 10+"/>
<img src="https://img.shields.io/badge/platform-iOS-green.svg" alt="iOS"/>
<img src="https://img.shields.io/badge/iOS-12%2B-brightgreen.svg" alt="iOS 12"/>
<img src="https://img.shields.io/badge/licence-MIT-lightgray.svg" alt="Licence MIT"/>
</p>


#  Adapter

Позволяет объектам с несовместимыми интерфейсами работать вместе (Структурный паттерн)

Адаптер реализует интерфейс одного объекта и создает оболочку для другого. Она может быть реализована на всех популярных языках программирования.

## "Google Authorization"

```swift
public struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}

public class GoogleAuthorization {

    public func login(email: String, password: String, completion: @escaping (GoogleUser?, Error?) -> Void) {

        let token = "special-token-value"

        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}
```

## Create Protocol

```swift
public struct User {
    public let email: String
    public let password: String
}

public struct Token {
    public let value: String
}

public protocol AuthorizationService {
    func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void)
}
```

## Create Adapter

```swift
class GoogleAuthenticatorAdapter: AuthorizationService {

    private var authentificator = GoogleAuthorization()

    func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void) {

        authentificator.login(email: email, password: password) { (currentUser, error) in
            guard let currentUser = currentUser else {
            failure(error)
            return
            }

            let user = User(email: currentUser.email, password: currentUser.password)

            let token = Token(value: currentUser.token)
            success(user, token)
        }
    }
}
```

## Workspace

#### Create property

```swift
// Provide us with some type or protocol registration
var authService = GoogleAuthenticatorAdapter()
```
#### Create func

```swift
func createUser(email: String, password: String) {
    authService.login(email: email, password: password, success: { (user, token) in
        print("Auth successed: \(user.email), \(token.value)")
    }) { (error) in
        if let error = error {
            print(error.localizedDescription)
        }
    }
}
```
#### ViewDidLoad

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    createUser(email: "swift@icloud.com", password: "lol")
}
```

## Another example

<div align = "center">
<img src="/images/adapter.png" width="750">
</div>

## Requirements

* Swift 4.2
* iOS 12 or higher

## Authors

* **Alexandr Kustov** -  [ELEV0](https://github.com/ELEV0)

## Communication

* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.

## License

This project is licensed under the MIT License.
