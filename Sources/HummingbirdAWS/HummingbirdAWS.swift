import Hummingbird
import SotoCore

extension HBApplication {

    /// AWS  extension
    public struct AWS {

        public var client: AWSClient {
            get {
                if !app.extensions.exists(\.aws.client) {
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
                return app.extensions.get(\.aws.client)
            }
            nonmutating set {
                app.extensions.set(\.aws.client, value: newValue) { client in
                    try client.syncShutdown()
                }
            }
        }

        let app: HBApplication
    }

    /// AWS extension
    public var aws: AWS { .init(app: self) }
}
