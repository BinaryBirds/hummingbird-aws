## Hummingbird extension with Soto for AWS

A [Hummingbird](https://github.com/hummingbird-project/hummingbird) extension using [Soto](https://github.com/soto-project/soto) for AWS.

## Usage 

```swift
import Hummingbird
import HummingbirdAWS

let app = HBApplication()

// get default client
let client = app.aws.client


// set custom client
app.aws.client = .init(
    credentialProvider: .static(accessKeyId: "", secretAccessKey: ""),
    retryPolicy: .noRetry,
    middlewares: [],
    options: .init(
        requestLogLevel: .critical,
        errorLogLevel: .critical
    ),
    httpClientProvider: .createNewWithEventLoopGroup(app.eventLoopGroup),
    logger: app.logger
)
```
