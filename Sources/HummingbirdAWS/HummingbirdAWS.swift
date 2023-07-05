import Hummingbird
import HummingbirdServices
import SotoCore

public extension HBApplication.Services {

    /// aws client as a service
    var aws: AWSClient {
        get {
            get(\.services.aws, "AWS client is not configured")
        }
        nonmutating set {
            set(\.services.aws, newValue) { client in
                try client.syncShutdown()
            }
        }
    }

    /// creates a basic aws client using a new http client provider with an event loop group
    func setUpBasicAWSService(
        credentialProvider: CredentialProviderFactory = .default,
        eventLoopGroup: EventLoopGroup,
        logger: Logger = .init(label: "hb-aws-client")
    ) {
        aws = .init(
            credentialProvider: credentialProvider,
            options: .init(
                requestLogLevel: logger.logLevel,
                errorLogLevel: logger.logLevel
            ),
            httpClientProvider: .createNewWithEventLoopGroup(
                eventLoopGroup
            ),
            logger: logger
        )
    }
}

public extension HBApplication {

    /// aws client service
    var aws: AWSClient {
        services.aws
    }
}

public extension HBRequest {

    /// aws client service
    var aws: AWSClient {
        application.services.aws
    }
}
