import XCTest
import Hummingbird
import HummingbirdAWS
@testable import SotoCore

final class HummingbirdAWSTests: XCTestCase {

    func testGet() async throws {
        let app = HBApplication()
        XCTAssertNotNil(app.aws.client.credentialProvider as? RuntimeSelectorCredentialProvider)
    }
    
    func testSet() async throws {
        let app = HBApplication()
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
        
        XCTAssertNotNil(app.aws.client.credentialProvider as? StaticCredential)
    }
}
