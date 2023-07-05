# Hummingbird extension with Soto for AWS

A [Hummingbird](https://github.com/hummingbird-project/hummingbird) extension using [Soto](https://github.com/soto-project/soto) for AWS.

## Getting started

**Adding the dependency**

Add the following entry in your `Package.swift` to start using `HummingbirdAWS`:

```swift
.package(url: "https://github.com/binarybirds/hummingbird-aws", from: "1.0.0"),
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

// setup default client 
app.services.setUpBasicAWSService(eventLoopGroup: app.eventLoopGroup)

// set custom client
app.services.aws = .init(
    credentialProvider: .static(
        accessKeyId: "foo",
        secretAccessKey: "bar"
    ),
    retryPolicy: .noRetry,
    middlewares: [],
    options: .init(
        requestLogLevel: .critical,
        errorLogLevel: .critical
    ),
    httpClientProvider: .createNewWithEventLoopGroup(app.eventLoopGroup),
    logger: app.logger
)

// get aws client
let client = app.aws
let client = req.aws
```
