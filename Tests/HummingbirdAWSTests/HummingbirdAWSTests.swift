import XCTest
import Hummingbird
import HummingbirdAWS
@testable import SotoCore

final class HummingbirdAWSTests: XCTestCase {

    func testGet() async throws {
        let app = HBApplication()
        app.services.setUpBasicAWSService(eventLoopGroup: app.eventLoopGroup)
        XCTAssertNotNil(app.aws.credentialProvider as? RuntimeSelectorCredentialProvider)
    }

    func testSet() async throws {
        let app = HBApplication()
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
        
        XCTAssertNotNil(app.aws.credentialProvider as? StaticCredential)
    }
}
