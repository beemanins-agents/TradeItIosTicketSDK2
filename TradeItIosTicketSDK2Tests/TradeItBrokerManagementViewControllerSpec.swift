import Quick
import Nimble

class TradeItBrokerManagementViewControllerSpec: QuickSpec {

    override func spec() {
        var controller: TradeItBrokerManagementViewController!
        var linkedBrokerManager: FakeTradeItLinkedBrokerManager!
         var brokerManagementTableManager: FakeTradeItBrokerManagementTableViewManager!
        var window: UIWindow!
        var nav: UINavigationController!
        
        describe("initialization") {
            beforeEach {
                linkedBrokerManager = FakeTradeItLinkedBrokerManager()
                brokerManagementTableManager = FakeTradeItBrokerManagementTableViewManager()
                window = UIWindow()
                let bundle = NSBundle(identifier: "TradeIt.TradeItIosTicketSDK2Tests")
                let storyboard: UIStoryboard = UIStoryboard(name: "TradeIt", bundle: bundle)
                
                TradeItLauncher.linkedBrokerManager = linkedBrokerManager
                
                controller = storyboard.instantiateViewControllerWithIdentifier(TradeItStoryboardID.brokerManagementView.rawValue) as! TradeItBrokerManagementViewController
                
                controller.brokerManagementTableManager = brokerManagementTableManager
                
                nav = UINavigationController(rootViewController: controller)
                
                window.addSubview(nav.view)
                
                flushAsyncEvents()
            }
            
            it("populate the table with the linkedBrokers") {
                expect(brokerManagementTableManager.calls.forMethod("updateLinkedBrokers(withLinkedBrokers:)").count).to(equal(1))
            }
        }
    }
}