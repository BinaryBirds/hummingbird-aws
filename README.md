# Hummingbird extension with Soto for AWS

A [Hummingbird](https://github.com/hummingbird-project/hummingbird) extension using [Soto](https://github.com/soto-project/soto) for AWS.

## Getting started

**Adding the dependency**

Add the following entry in your `Package.swift` to start using `HummingbirdAWS`:

```swift
.package(url: "https://github.com/feathercms/hummingbird-aws", from: "1.0.0"),
```

and `HummingbirdAWS` dependency to your target:

```swift
.product(name: "HummingbirdAWS", package: "hummingbird-aws"),    
```

**Usage example**

```swift
import Hummingbird
import HummingbirdAWS

let app = HBApplication()

// get default client
let client = app.aws.client


// set custom client
app.aws.client = .init(
    credentialProvider: .static(
        accessKeyId: "", 
        secretAccessKey: ""
    ),
    retryPolicy: .noRetry,
    middlewares: [],
    options: .init(
        requestLogLevel: .critical,
        errorLogLevel: .critical
    ),
    httpClientProvider: .createNewWithEventLoopGroup(
        app.eventLoopGroup
    ),
    logger: app.logger
)
```
