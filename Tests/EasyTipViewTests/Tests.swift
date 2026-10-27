#if canImport(UIKit)
import UIKit
import XCTest
import EasyTipView
 
class Tests: XCTestCase {
    
    var view : UIView!
    var superview : UIView!
    
    override func setUp() {
        super.setUp()
        
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        view = UIView(frame: CGRect(x: 0, y: 500, width: 100, height: 100))
        
        superview.addSubview(view)
    }
    
    func testViewPositionTop() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        view.center = superview.center
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .top, "Position should be top")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert((tipView.frame).minY == (view.frame).maxY, "EasyTipView should be below the presenting view")
    }
    
    func testViewPositionBottom() {
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.bottom
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should be bottom")
        XCTAssert((tipView.frame).maxY == (view.frame).minY, "EasyTipView should be above the presenting view")
    }
    
    func testViewPositionLeft() {
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .left
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .left, "Position should be left")
        XCTAssert((tipView.frame).minX == (view.frame).maxX, "EasyTipView should be to the right of the presenting view")
    }
    
    func testViewPositionRight() {
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .right
        
        view.frame = CGRect(x: superview.frame.size.width - 100, y: 0, width: 100, height: 100)
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .right, "Position should be right")
        XCTAssert((tipView.frame).maxX == (view.frame).minX, "EasyTipView should be to the right of the presenting view")
    }
    
    func testViewPositionAny() {
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .any
        
        view.center = superview.center
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .any, "Position should be any")
        XCTAssert((tipView.frame).minY == (view.frame).maxY, "EasyTipView should be below the presenting view")
    }
    
    func testAutoPositionAdjustmentAny() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .any
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should be bottom")
        XCTAssert((tipView.frame).maxY == (view.frame).minY, "EasyTipView should be above the presenting view")
    }
    
    func testAutoPositionAdjustmentTop() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should be bottom")
        XCTAssert((tipView.frame).maxY == (view.frame).minY, "EasyTipView should be above the presenting view")
    }
    
    func testAutoPositionAdjustmentRight() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .right
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should be bottom")
        XCTAssert((tipView.frame).maxY == (view.frame).minY, "EasyTipView should be above the presenting view")
    }
    
    func testAutoPositionAdjustmentLeft() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .left
        
        view.frame = CGRect(x: superview.frame.size.width - 100, y: superview.frame.size.height - 100, width: 100, height: 100)
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should be bottom")
        XCTAssert((tipView.frame).maxY == (view.frame).minY, "EasyTipView should be above the presenting view")
    }
    
    func testAutoPositionAdjustmentBottom() {
        
        var frame = view.frame
        frame.origin.y = 0
        
        view.frame = frame
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.bottom
        
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        
        XCTAssert(tipView.superview === superview, "EasyTipView should be present")
        XCTAssert(tipView.alpha == 1, "EasyTipView should be visible")
        XCTAssert(tipView.preferences.drawing.arrowPosition == .top, "Position should be bottom")
        XCTAssert((tipView.frame).minY == (view.frame).maxY, "EasyTipView should be below the presenting view")
    }

    // MARK: - updatePosition

    func testUpdatePositionFollowsPresentingView() {
        view.center = superview.center

        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .top

        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)

        view.frame.origin.x = 50
        tipView.updatePosition()

        XCTAssert(tipView.frame.midX == view.frame.midX, "EasyTipView should follow the presenting view horizontally")
        XCTAssert(tipView.frame.minY == view.frame.maxY, "EasyTipView should stay below the presenting view")
    }

    func testUpdatePositionRestoresRequestedArrowPosition() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.arrowPosition = .top

        // view is at the bottom of the superview, so .top does not fit and falls back to .bottom
        let tipView = EasyTipView(text: "Some text", preferences: preferences)
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should fall back to bottom")

        // once there is room again the requested position should be applied again
        view.frame.origin.y = 100
        tipView.updatePosition()

        XCTAssert(tipView.preferences.drawing.arrowPosition == .top, "Position should return to the requested top")
        XCTAssert(tipView.frame.minY == view.frame.maxY, "EasyTipView should be below the presenting view")
    }

    func testUpdatePositionKeepsAnyPositionAdaptive() {
        let tipView = EasyTipView(text: "Some text")
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        XCTAssert(tipView.preferences.drawing.arrowPosition == .bottom, "Position should be bottom")

        view.frame.origin.y = 0
        tipView.updatePosition()

        XCTAssert(tipView.preferences.drawing.arrowPosition == .any, "Position should be any again")
        XCTAssert(tipView.frame.minY == view.frame.maxY, "EasyTipView should be below the presenting view")
    }

    // MARK: - Vertical shake

    func testVerticalShakeIsAdditiveAndSurvivesUpdatePosition() {
        view.center = superview.center

        let tipView = EasyTipView(text: "Some text")
        tipView.show(animated: false, forView: view, withinSuperview: superview)
        tipView.startVerticalShake(verticalShakeOffset: 8)

        let animation = tipView.layer.animation(forKey: "verticalShake") as? CABasicAnimation
        XCTAssertNotNil(animation, "Shake animation should be running")
        XCTAssertEqual(animation?.keyPath, "position.y")
        XCTAssertEqual(animation?.isAdditive, true, "Shake should be additive so it composes with frame changes")

        view.frame.origin.x = 50
        tipView.updatePosition()

        XCTAssertNotNil(tipView.layer.animation(forKey: "verticalShake"), "Shake should keep running after updatePosition")

        tipView.stopVerticalShake()
        XCTAssertNil(tipView.layer.animation(forKey: "verticalShake"), "Shake should be removed")
    }

    func testAutoUpdateOnRotationDefaultsToTrue() {
        XCTAssertTrue(EasyTipView.Preferences().positioning.autoUpdateOnRotation)
    }
}
#endif
