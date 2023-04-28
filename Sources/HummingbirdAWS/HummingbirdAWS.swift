import Hummingbird
import SotoCore

extension HBApplication {

    /// AWS  extension
    public struct AWS {

        let app: HBApplication

        /// The shared AWS client instance, should be created at application startup
        public var client: AWSClient {
            get {
                if !app.extensions.exists(\.aws.client) {
                    if !app.extensions.exists(\.aws.client) {
                        fatalError("AWS client is not configured.")
                    }
                }
                return app.extensions.get(\.aws.client)
            }
            nonmutating set {
                app.extensions.set(\.aws.client, value: newValue) { client in
                    try client.syncShutdown()
                }
            }
        }
        
        /// Creates the default AWS client as an extension
        public func useDefaultClient() {
            let logger = Logger(label: "hummingbird-aws-logger")

            app.extensions.set(
                \.aws.client,
                value: .init(
                    credentialProvider: .default,
                    httpClientProvider: .createNewWithEventLoopGroup(
                        app.eventLoopGroup
                    ),
                    logger: logger
                )
            )
        }
    }

    /// AWS extension
    public var aws: AWS { .init(app: self) }
}
