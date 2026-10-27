//
// EasyTipView.swift
//
// Copyright (c) 2015 Teodor Patraş
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if canImport(UIKit)
import UIKit

public protocol EasyTipViewDelegate : class {
    func easyTipViewDidTap(_ tipView: EasyTipView)
    func easyTipViewDidDismiss(_ tipView : EasyTipView)
}


// MARK: - Public methods extension

public extension EasyTipView {
    
    // MARK:- Class methods -
    
    /**
     Presents an EasyTipView pointing to a particular UIBarItem instance within the specified superview
     
     - parameter animated:    Pass true to animate the presentation.
     - parameter item:        The UIBarButtonItem or UITabBarItem instance which the EasyTipView will be pointing to.
     - parameter superview:   A view which is part of the UIBarButtonItem instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     - parameter text:        The text to be displayed.
     - parameter preferences: The preferences which will configure the EasyTipView.
     - parameter delegate:    The delegate.
     */
    class func show(animated: Bool = true, forItem item: UIBarItem, withinSuperview superview: UIView? = nil, text: String, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
        
        if let view = item.view {
            show(animated: animated, forView: view, withinSuperview: superview, text: text, preferences: preferences, delegate: delegate)
        }
    }
    
    /**
     Presents an EasyTipView pointing to a particular UIView instance within the specified superview
     
     - parameter animated:    Pass true to animate the presentation.
     - parameter view:        The UIView instance which the EasyTipView will be pointing to.
     - parameter superview:   A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     - parameter text:        The text to be displayed.
     - parameter preferences: The preferences which will configure the EasyTipView.
     - parameter delegate:    The delegate.
     */
    class func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil, text:  String, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
        
        let ev = EasyTipView(text: text, preferences: preferences, delegate: delegate)
        ev.show(animated: animated, forView: view, withinSuperview: superview)
    }
    
    /**
     Presents an EasyTipView pointing to a particular UIBarItem instance within the specified superview
     
     - parameter animated:    Pass true to animate the presentation.
     - parameter item:        The UIBarButtonItem or UITabBarItem instance which the EasyTipView will be pointing to.
     - parameter superview:   A view which is part of the UIBarButtonItem instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     - parameter contentView: The view to be displayed.
     - parameter preferences: The preferences which will configure the EasyTipView.
     - parameter delegate:    The delegate.
     */
    class func show(animated: Bool = true, forItem item: UIBarItem, withinSuperview superview: UIView? = nil, contentView: UIView, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
        
        if let view = item.view {
            show(animated: animated, forView: view, withinSuperview: superview, contentView: contentView, preferences: preferences, delegate: delegate)
        }
    }
    
    /**
     Presents an EasyTipView pointing to a particular UIView instance within the specified superview
     
     - parameter animated:    Pass true to animate the presentation.
     - parameter view:        The UIView instance which the EasyTipView will be pointing to.
     - parameter superview:   A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     - parameter contentView: The view to be displayed.
     - parameter preferences: The preferences which will configure the EasyTipView.
     - parameter delegate:    The delegate.
     */
    class func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil, contentView: UIView, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
        
        let ev = EasyTipView(contentView: contentView, preferences: preferences, delegate: delegate)
        ev.show(animated: animated, forView: view, withinSuperview: superview)
    }

    /**
     Presents an EasyTipView pointing to a particular UIView instance within the specified superview containing attributed text.
     - parameter animated:       Pass true to animate the presentation.
     - parameter view:           The UIView instance which the EasyTipView will be pointing to.
     - parameter superview:      A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     - parameter attributedText: The attributed text to be displayed.
     - parameter preferences:    The preferences which will configure the EasyTipView.
     - parameter delegate:       The delegate.
     */
    class func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil, attributedText:  NSAttributedString, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){

        let ev = EasyTipView(text: attributedText, preferences: preferences, delegate: delegate)
        ev.show(animated: animated, forView: view, withinSuperview: superview)
    }

    // MARK:- Instance methods -
    
    /**
     Presents an EasyTipView pointing to a particular UIBarItem instance within the specified superview
     
     - parameter animated:  Pass true to animate the presentation.
     - parameter item:      The UIBarButtonItem or UITabBarItem instance which the EasyTipView will be pointing to.
     - parameter superview: A view which is part of the UIBarButtonItem instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     */
    func show(animated: Bool = true, forItem item: UIBarItem, withinSuperView superview: UIView? = nil) {
        if let view = item.view {
            show(animated: animated, forView: view, withinSuperview: superview)
        }
    }
    
    /**
     Presents an EasyTipView pointing to a particular UIView instance within the specified superview
     
     - parameter animated:  Pass true to animate the presentation.
     - parameter view:      The UIView instance which the EasyTipView will be pointing to.
     - parameter superview: A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
     */
    func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil) {
        
        #if TARGET_APP_EXTENSIONS
        precondition(superview != nil, "The supplied superview parameter cannot be nil for app extensions.")
        
        let superview = superview!
        #else
        precondition(superview == nil || view.hasSuperview(superview!), "The supplied superview <\(superview!)> is not a direct nor an indirect superview of the supplied reference view <\(view)>. The superview passed to this method should be a direct or an indirect superview of the reference view. To display the tooltip within the main window, ignore the superview parameter.")
        
        let superview = superview ?? UIApplication.shared.windows.first!
        #endif
        
        let initialTransform = preferences.animating.showInitialTransform
        let finalTransform = preferences.animating.showFinalTransform
        let initialAlpha = preferences.animating.showInitialAlpha
        let damping = preferences.animating.springDamping
        let velocity = preferences.animating.springVelocity
        
        presentingView = view
        arrange(withinSuperview: superview)
        
        transform = initialTransform
        alpha = initialAlpha
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
        
        superview.addSubview(self)
        
        let animations : () -> () = {
            self.transform = finalTransform
            self.alpha = 1
        }
        
        if animated {
            UIView.animate(withDuration: preferences.animating.showDuration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [.curveEaseInOut], animations: animations, completion: { [weak self] _ in
                self?.startVerticalShake()
            })
        }else{
            animations()
            self.startVerticalShake()
        }
    }
    
    /**
     Dismisses the EasyTipView
     
     - parameter completion: Completion block to be executed after the EasyTipView is dismissed.
     */
    func dismiss(animated: Bool = true, completion: (() -> ())? = nil){
        
        let damping = preferences.animating.springDamping
        let velocity = preferences.animating.springVelocity
        
        UIView.animate(withDuration: animated ? preferences.animating.dismissDuration : 0, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [.curveEaseInOut], animations: {
            self.transform = self.preferences.animating.dismissTransform
            self.alpha = self.preferences.animating.dismissFinalAlpha
        }) { (finished) -> Void in
            self.delegate?.easyTipViewDidDismiss(self)
            self.stopVerticalShake()
            self.removeFromSuperview()
            self.transform = CGAffineTransform.identity
            completion?()
        }
    }
    
    /// 현재 표시 중인 Tooltip의 위치를 다시 계산합니다.
    /// 화면 회전, Split View, Stage Manager 등으로 레이아웃이 변경된 후
    /// 기준 View(`presentingView`)의 변경된 위치를 기준으로 Tooltip을 다시 배치합니다.
    /// Vertical Shake는 additive 애니메이션이라 위치가 바뀌어도 재시작 없이 그대로 이어집니다.
    ///
    /// - parameter animated: true이면 이동을 애니메이션으로 처리합니다.
    func updatePosition(animated: Bool = false) {
        guard let superview, presentingView != nil else { return }

        let update = {
            // 기준 View와 상위 View의 최신 레이아웃 반영
            superview.layoutIfNeeded()

            // 변경된 기준 View 위치를 바탕으로 Tooltip 위치 재계산
            self.arrange(withinSuperview: superview)

            // Arrow 위치 등 다시 그리기
            self.setNeedsDisplay()
        }

        if animated {
            UIView.animate(withDuration: 0.3, animations: update)
        } else {
            update()
        }
    }

    /// `viewWillTransition(to:with:)`에서 받은 값으로 회전·리사이즈 전환 애니메이션과 함께 Tooltip을 이동시킵니다.
    ///
    /// 전환 애니메이션(`coordinator.animate(alongsideTransition:)`) 블록 안에서 위치를 갱신하므로
    /// 회전과 동일한 duration/curve로 움직입니다. 화살표 방향이 바뀌는 경우에는 말풍선만 cross-dissolve 됩니다.
    /// 이 메서드를 호출하면 `UIDevice` 알림 기반 자동 갱신(`positioning.autoUpdateOnRotation`)은 꺼집니다.
    ///
    /// ```swift
    /// override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    ///     super.viewWillTransition(to: size, with: coordinator)
    ///     tipView?.updatePosition(forContainerSize: size, with: coordinator)
    /// }
    /// ```
    ///
    /// - parameter size:        `viewWillTransition`으로 전달된 전환 후 크기. Tooltip이 window 위에 있을 때 화면 경계 보정에 사용됩니다.
    /// - parameter coordinator: `viewWillTransition`으로 전달된 transition coordinator.
    func updatePosition(forContainerSize size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        guard superview != nil, presentingView != nil else { return }

        preferences.positioning.autoUpdateOnRotation = false

        let rearrange = { [weak self] in
            guard let self, let superview = self.superview, self.presentingView != nil else { return }

            superview.layoutIfNeeded()
            // window가 아닌 superview는 전환 중 layout이 갱신되므로 size를 쓰지 않고 superview 자체 크기를 사용
            self.arrange(withinSuperview: superview, containerSize: superview is UIWindow ? size : nil)
            self.setNeedsDisplay()
        }

        coordinator.animate(alongsideTransition: { [weak self] context in
            guard let self else { return }

            let previousArrowPosition = self.preferences.drawing.arrowPosition
            rearrange()

            if previousArrowPosition != self.preferences.drawing.arrowPosition {
                // 화살표 방향이 바뀌면 비트맵은 보간할 수 없으므로 cross-dissolve
                let fade = CATransition()
                fade.type = .fade
                fade.duration = context.transitionDuration
                self.layer.add(fade, forKey: "arrowPositionFade")
            }
        }, completion: { _ in
            // 전환이 취소되었거나 최종 layout이 달라진 경우를 대비해 최종 위치 확정
            rearrange()
        })
    }

    // EasyTipView Vertical Shake Start
    // position이 아닌 offset(additive)을 애니메이션하므로 frame이 바뀌어도 재시작할 필요가 없습니다.
    func startVerticalShake(verticalShakeOffset: CGFloat? = nil) {
        if let verticalShakeOffset {
            preferences.animating.verticalShakeOffset = verticalShakeOffset
        }

        if preferences.isVerticalShake {
            let layerAnimation = CABasicAnimation(keyPath: "position.y")
            layerAnimation.isAdditive = true
            layerAnimation.fromValue = 0
            layerAnimation.toValue = preferences.animating.verticalShakeOffset
            layerAnimation.duration = preferences.animating.verticalShakeDuration
            layerAnimation.repeatCount = .infinity
            layerAnimation.autoreverses = true
            self.layer.add(layerAnimation, forKey: "verticalShake")
        }
    }

    // EasyTipView Vertical Shake Stop
    func stopVerticalShake() {
        self.layer.removeAnimation(forKey: "verticalShake")
    }
}

// MARK: - EasyTipView class implementation -

open class EasyTipView: UIView {
    
    // MARK:- Nested types -
    
    public enum ArrowPosition {
        case any
        case top
        case bottom
        case right
        case left
        
        static let allValues = [top, bottom, right, left]
    }
    
    public struct Preferences {
        
        public struct Drawing {
            public var cornerRadius        = CGFloat(6)
            public var arrowHeight         = CGFloat(6)
            public var arrowWidth          = CGFloat(10)
            public var foregroundColor     = UIColor.white
            public var backgroundColor     = UIColor(red: 255.0/255.0, green: 155.0/255.0, blue: 0.0/255.0, alpha: 1)
            public var arrowPosition       = ArrowPosition.any
            public var textAlignment       = NSTextAlignment.center
            public var borderWidth         = CGFloat(0)
            public var borderColor         = UIColor.clear
            public var font                = UIFont.systemFont(ofSize: 15)
            public var shadowColor         = UIColor.clear
            public var shadowOffset        = CGSize(width: 0.0, height: 0.0)
            public var shadowRadius        = CGFloat(0)
            public var shadowOpacity       = CGFloat(0)
        }
        
        public struct Positioning {
            public var bubbleInsets         = UIEdgeInsets(top: 4.0, left: 10.0, bottom: 4.0, right: 10.0)
            public var contentInsets        = UIEdgeInsets(top: 5.0, left: 8.0, bottom: 5.0, right: 8.0)
            public var maxWidth             = CGFloat(200)
            public var ignoreAdjustHorizontalFrame  = false
            public var ignoreAdjustVerticalFrame    = false
            public var ignoreFrameValid             = false
            public var offset               = CGPoint.zero
            /// true이면 `UIDevice` 방향 알림을 받아 자동으로 위치를 갱신합니다.
            /// `updatePosition(forContainerSize:with:)`를 호출하면 false로 바뀝니다.
            public var autoUpdateOnRotation = true
        }
        
        public struct Animating {
            public var dismissTransform     = CGAffineTransform(scaleX: 0.1, y: 0.1)
            public var showInitialTransform = CGAffineTransform(scaleX: 0, y: 0)
            public var showFinalTransform   = CGAffineTransform.identity
            public var springDamping        = CGFloat(0.7)
            public var springVelocity       = CGFloat(0.7)
            public var showInitialAlpha     = CGFloat(0)
            public var dismissFinalAlpha    = CGFloat(0)
            public var showDuration         = 0.7
            public var dismissDuration      = 0.7
            public var dismissOnTap         = true
            public var verticalShakeOffset      = CGFloat(0)
            public var verticalShakeDuration    = CGFloat(0.4)
        }
        
        public var drawing      = Drawing()
        public var positioning  = Positioning()
        public var animating    = Animating()
        public var hasBorder : Bool {
            return drawing.borderWidth > 0 && drawing.borderColor != UIColor.clear
        }
        
        public var hasShadow : Bool {
            return drawing.shadowOpacity > 0 && drawing.shadowColor != UIColor.clear
        }
        
        public var isVerticalShake : Bool {
            return animating.verticalShakeOffset != 0
        }
        
        public init() {}
    }
    
    public enum Content: CustomStringConvertible {
        
        case text(String)
        case attributedText(NSAttributedString)
        case view(UIView)
        
        public var description: String {
            switch self {
            case .text(let text):
                return "text : '\(text)'"
            case .attributedText(let text):
                return "attributed text : '\(text)'"
            case .view(let contentView):
                return "view : \(contentView)"
            }
        }
    }
    
    
    // MARK:- Variables -
    
    override open var backgroundColor: UIColor? {
        didSet {
            guard let color = backgroundColor
                  , color != UIColor.clear else {return}  
            
            preferences.drawing.backgroundColor = color
            backgroundColor = UIColor.clear
        }
    }
    
    override open var description: String {
        let type = "'\(String(reflecting: Swift.type(of: self)))'".components(separatedBy: ".").last!
        
        return "<< \(type) with \(content) >>"
    }
    
    fileprivate weak var presentingView: UIView?
    fileprivate weak var delegate: EasyTipViewDelegate?
    fileprivate var arrowTip = CGPoint.zero
    /// 사용자가 요청한 화살표 방향. `preferences.drawing.arrowPosition`은 실제 적용된 방향을 담으므로
    /// 레이아웃이 바뀔 때마다 이 값에서 다시 계산해 원래 방향으로 복귀할 수 있게 합니다.
    fileprivate let requestedArrowPosition: ArrowPosition
    fileprivate(set) open var preferences: Preferences
    private let content: Content
    
    // MARK: - Lazy variables -
    
    fileprivate lazy var contentSize: CGSize = {
        
        [unowned self] in
        
        switch content {
        case .text(let text):
            #if swift(>=4.2)
            var attributes = [NSAttributedString.Key.font : self.preferences.drawing.font]
            #else
            var attributes = [NSAttributedStringKey.font : self.preferences.drawing.font]
            #endif
            
            var textSize = text.boundingRect(with: CGSize(width: self.preferences.positioning.maxWidth, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil).size
            
            textSize.width = ceil(textSize.width)
            textSize.height = ceil(textSize.height)
            
            if textSize.width < self.preferences.drawing.arrowWidth {
                textSize.width = self.preferences.drawing.arrowWidth
            }
            
            return textSize

        case .attributedText(let text):
            var textSize = text.boundingRect(with: CGSize(width: self.preferences.positioning.maxWidth, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil).size

            textSize.width = ceil(textSize.width)
            textSize.height = ceil(textSize.height)

            if textSize.width < self.preferences.drawing.arrowWidth {
                textSize.width = self.preferences.drawing.arrowWidth
            }

            return textSize

        case .view(let contentView):
            return contentView.frame.size
        }
    }()
    
    fileprivate lazy var tipViewSize: CGSize = {
        
        [unowned self] in
        
        var tipViewSize =
            CGSize(
                width: self.contentSize.width + self.preferences.positioning.contentInsets.left + self.preferences.positioning.contentInsets.right + self.preferences.positioning.bubbleInsets.left + self.preferences.positioning.bubbleInsets.right,
                height: self.contentSize.height + self.preferences.positioning.contentInsets.top + self.preferences.positioning.contentInsets.bottom + self.preferences.positioning.bubbleInsets.top + self.preferences.positioning.bubbleInsets.bottom + self.preferences.drawing.arrowHeight)
        
        return tipViewSize
    }()
    
    // MARK: - Static variables -
    
    public static var globalPreferences = Preferences()
    
    // MARK:- Initializer -
    
    public convenience init (text: String, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
        self.init(content: .text(text), preferences: preferences, delegate: delegate)
        
        self.isAccessibilityElement = true
        self.accessibilityTraits = UIAccessibilityTraits.staticText
        self.accessibilityLabel = text
    }
    
    public convenience init (contentView: UIView, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
        self.init(content: .view(contentView), preferences: preferences, delegate: delegate)
    }

    public convenience init (text: NSAttributedString, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
        self.init(content: .attributedText(text), preferences: preferences, delegate: delegate)
    }
    
    public init (content: Content, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
        
        self.content = content
        self.preferences = preferences
        self.requestedArrowPosition = preferences.drawing.arrowPosition
        self.delegate = delegate
        
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor.clear
        
        #if swift(>=4.2)
        let notificationName = UIDevice.orientationDidChangeNotification
        #else
        let notificationName = NSNotification.Name.UIDeviceOrientationDidChange
        #endif
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleRotation), name: notificationName, object: nil)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    /**
     NSCoding not supported. Use init(text, preferences, delegate) instead!
     */
    required public init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported. Use init(text, preferences, delegate) instead!")
    }
    
    // MARK: - Rotation support -
    
    @objc func handleRotation() {
        guard preferences.positioning.autoUpdateOnRotation
              , let sview = superview
              , presentingView != nil else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.arrange(withinSuperview: sview)
            self.setNeedsDisplay()
        }
    }
    
    // MARK: - Private methods -
    
    fileprivate func computeFrame(arrowPosition position: ArrowPosition, refViewFrame: CGRect, superviewFrame: CGRect) -> CGRect {
        var xOrigin: CGFloat = 0
        var yOrigin: CGFloat = 0
        
        switch position {
        case .top, .any:
            xOrigin = refViewFrame.center.x - tipViewSize.width / 2
            yOrigin = refViewFrame.y + refViewFrame.height
        case .bottom:
            xOrigin = refViewFrame.center.x - tipViewSize.width / 2
            yOrigin = refViewFrame.y - tipViewSize.height
        case .right:
            xOrigin = refViewFrame.x - tipViewSize.width
            yOrigin = refViewFrame.center.y - tipViewSize.height / 2
        case .left:
            xOrigin = refViewFrame.x + refViewFrame.width
            yOrigin = refViewFrame.center.y - tipViewSize.height / 2
        }
        
        xOrigin += preferences.positioning.offset.x
        yOrigin += preferences.positioning.offset.y
        
        var frame = CGRect(x: xOrigin, y: yOrigin, width: tipViewSize.width, height: tipViewSize.height)
        adjustFrame(&frame, forSuperviewFrame: superviewFrame)
        return frame
    }
    
    fileprivate func adjustFrame(_ frame: inout CGRect, forSuperviewFrame superviewFrame: CGRect) {
        
        // adjust horizontally
        if preferences.positioning.ignoreAdjustHorizontalFrame == false {
            if frame.x < 0 {
                frame.x =  0
            } else if frame.maxX > superviewFrame.width {
                frame.x = superviewFrame.width - frame.width
            }
        }
        
        //adjust vertically
        if preferences.positioning.ignoreAdjustVerticalFrame == false {
            if frame.y < 0 {
                frame.y = 0
            } else if frame.maxY > superviewFrame.maxY {
                frame.y = superviewFrame.height - frame.height
            }
        }
    }
    
    fileprivate func isFrameValid(_ frame: CGRect, forRefViewFrame: CGRect, withinSuperviewFrame: CGRect) -> Bool {
        return !frame.intersects(forRefViewFrame)
    }
    
    fileprivate func arrange(withinSuperview superview: UIView, containerSize: CGSize? = nil) {

        var position = requestedArrowPosition

        let refViewFrame = presentingView!.convert(presentingView!.bounds, to: superview);

        let superviewFrame: CGRect
        if let scrollview = superview as? UIScrollView {
            superviewFrame = CGRect(origin: scrollview.frame.origin, size: scrollview.contentSize)
        } else if let containerSize {
            superviewFrame = CGRect(origin: .zero, size: containerSize)
        } else {
            superviewFrame = superview.frame
        }
        
        var frame = computeFrame(arrowPosition: position, refViewFrame: refViewFrame, superviewFrame: superviewFrame)
        
        if preferences.positioning.ignoreFrameValid == false {
            if !isFrameValid(frame, forRefViewFrame: refViewFrame, withinSuperviewFrame: superviewFrame) {
                for value in ArrowPosition.allValues where value != position {
                    let newFrame = computeFrame(arrowPosition: value, refViewFrame: refViewFrame, superviewFrame: superviewFrame)
                    if isFrameValid(newFrame, forRefViewFrame: refViewFrame, withinSuperviewFrame: superviewFrame) {
                        
                        if position != .any {
                            print("[EasyTipView - Info] The arrow position you chose <\(position)> could not be applied. Instead, position <\(value)> has been applied! Please specify position <\(ArrowPosition.any)> if you want EasyTipView to choose a position for you.")
                        }
                        
                        frame = newFrame
                        position = value
                        break
                    }
                }
            }
        }

        // 요청 방향이 아닌 실제 적용된 방향을 기록 (draw/getBubbleFrame이 참조)
        preferences.drawing.arrowPosition = position

        switch position {
        case .bottom, .top, .any:
            var arrowTipXOrigin: CGFloat
            if frame.width < refViewFrame.width {
                arrowTipXOrigin = tipViewSize.width / 2
            } else {
                arrowTipXOrigin = abs(frame.x - refViewFrame.x) + refViewFrame.width / 2
            }
            
            arrowTip = CGPoint(x: arrowTipXOrigin, y: position == .bottom ? tipViewSize.height - preferences.positioning.bubbleInsets.bottom :  preferences.positioning.bubbleInsets.top)
        case .right, .left:
            var arrowTipYOrigin: CGFloat
            if frame.height < refViewFrame.height {
                arrowTipYOrigin = tipViewSize.height / 2
            } else {
                arrowTipYOrigin = abs(frame.y - refViewFrame.y) + refViewFrame.height / 2
            }
            
            arrowTip = CGPoint(x: preferences.drawing.arrowPosition == .left ? preferences.positioning.bubbleInsets.left : tipViewSize.width - preferences.positioning.bubbleInsets.right, y: arrowTipYOrigin)
        }
        
        if case .view(let contentView) = content {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.frame = getContentRect(from: getBubbleFrame())
        }
        
        // transform이 적용된 상태에서도 안전하도록 frame 대신 bounds/center로 반영
        self.bounds = CGRect(origin: .zero, size: frame.size)
        self.center = CGPoint(x: frame.midX, y: frame.midY)
    }
    
    // MARK:- Callbacks -
    
    @objc func handleTap() {
        self.delegate?.easyTipViewDidTap(self)
        guard preferences.animating.dismissOnTap else { return }
        dismiss()
    }
    
    // MARK:- Drawing -
    
    fileprivate func drawBubble(_ bubbleFrame: CGRect, arrowPosition: ArrowPosition,  context: CGContext) {
        
        let arrowWidth = preferences.drawing.arrowWidth
        let arrowHeight = preferences.drawing.arrowHeight
        let cornerRadius = preferences.drawing.cornerRadius
        
        let contourPath = CGMutablePath()
        
        contourPath.move(to: CGPoint(x: arrowTip.x, y: arrowTip.y))
        
        switch arrowPosition {
        case .bottom, .top, .any:
            
            contourPath.addLine(to: CGPoint(x: arrowTip.x - arrowWidth / 2, y: arrowTip.y + (arrowPosition == .bottom ? -1 : 1) * arrowHeight))
            if arrowPosition == .bottom {
                drawBubbleBottomShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            } else {
                drawBubbleTopShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            }
            contourPath.addLine(to: CGPoint(x: arrowTip.x + arrowWidth / 2, y: arrowTip.y + (arrowPosition == .bottom ? -1 : 1) * arrowHeight))
            
        case .right, .left:
            
            contourPath.addLine(to: CGPoint(x: arrowTip.x + (arrowPosition == .right ? -1 : 1) * arrowHeight, y: arrowTip.y - arrowWidth / 2))
            
            if arrowPosition == .right {
                drawBubbleRightShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            } else {
                drawBubbleLeftShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            }
            
            contourPath.addLine(to: CGPoint(x: arrowTip.x + (arrowPosition == .right ? -1 : 1) * arrowHeight, y: arrowTip.y + arrowWidth / 2))
        }
        
        contourPath.closeSubpath()
        context.addPath(contourPath)
        context.clip()
        
        paintBubble(context)
        
        if preferences.hasBorder {
            drawBorder(contourPath, context: context)
        }
    }
    
    fileprivate func drawBubbleBottomShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
    }
    
    fileprivate func drawBubbleTopShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y:  frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
    }
    
    fileprivate func drawBubbleRightShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.height), radius: cornerRadius)
        
    }
    
    fileprivate func drawBubbleLeftShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
    }
    
    fileprivate func paintBubble(_ context: CGContext) {
        context.setFillColor(preferences.drawing.backgroundColor.cgColor)
        context.fill(bounds)
    }
    
    fileprivate func drawBorder(_ borderPath: CGPath, context: CGContext) {
        context.addPath(borderPath)
        context.setStrokeColor(preferences.drawing.borderColor.cgColor)
        context.setLineWidth(preferences.drawing.borderWidth)
        context.strokePath()
    }
    
    fileprivate func drawText(_ bubbleFrame: CGRect, context : CGContext) {
        guard case .text(let text) = content else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = preferences.drawing.textAlignment
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        let textRect = getContentRect(from: bubbleFrame)
        
        #if swift(>=4.2)
        let attributes = [NSAttributedString.Key.font : preferences.drawing.font, NSAttributedString.Key.foregroundColor : preferences.drawing.foregroundColor, NSAttributedString.Key.paragraphStyle : paragraphStyle]
        #else
        let attributes = [NSAttributedStringKey.font : preferences.drawing.font, NSAttributedStringKey.foregroundColor : preferences.drawing.foregroundColor, NSAttributedStringKey.paragraphStyle : paragraphStyle]
        #endif
        
        text.draw(in: textRect, withAttributes: attributes)
    }

    fileprivate func drawAttributedText(_ bubbleFrame: CGRect, context : CGContext) {
        guard
            case .attributedText(let text) = content
            else {
                return
        }

        let textRect = getContentRect(from: bubbleFrame)

        text.draw(with: textRect, options: .usesLineFragmentOrigin, context: .none)
    }

    fileprivate func drawShadow() {
        if preferences.hasShadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor = preferences.drawing.shadowColor.cgColor
            self.layer.shadowOffset = preferences.drawing.shadowOffset
            self.layer.shadowRadius = preferences.drawing.shadowRadius
            self.layer.shadowOpacity = Float(preferences.drawing.shadowOpacity)
        }
    }
    
    override open func draw(_ rect: CGRect) {
        
        let bubbleFrame = getBubbleFrame()
        
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState ()
        
        drawBubble(bubbleFrame, arrowPosition: preferences.drawing.arrowPosition, context: context)
        
        switch content {
        case .text:
            drawText(bubbleFrame, context: context)
        case .attributedText:
            drawAttributedText(bubbleFrame, context: context)
        case .view (let view):
            addSubview(view)
        }
        
        drawShadow()
        context.restoreGState()
    }
    
    private func getBubbleFrame() -> CGRect {
        let arrowPosition = preferences.drawing.arrowPosition
        let bubbleWidth: CGFloat
        let bubbleHeight: CGFloat
        let bubbleXOrigin: CGFloat
        let bubbleYOrigin: CGFloat
        switch arrowPosition {
        case .bottom, .top, .any:

            bubbleWidth = tipViewSize.width - preferences.positioning.bubbleInsets.left - preferences.positioning.bubbleInsets.right
            bubbleHeight = tipViewSize.height - preferences.positioning.bubbleInsets.top - preferences.positioning.bubbleInsets.bottom - preferences.drawing.arrowHeight
            
            bubbleXOrigin = preferences.positioning.bubbleInsets.left
            bubbleYOrigin = arrowPosition == .bottom ? preferences.positioning.bubbleInsets.top : preferences.positioning.bubbleInsets.top + preferences.drawing.arrowHeight
            
        case .left, .right:
            
            bubbleWidth = tipViewSize.width - preferences.positioning.bubbleInsets.left - preferences.positioning.bubbleInsets.right - preferences.drawing.arrowHeight
            bubbleHeight = tipViewSize.height - preferences.positioning.bubbleInsets.top - preferences.positioning.bubbleInsets.left

            bubbleXOrigin = arrowPosition == .right ? preferences.positioning.bubbleInsets.left : preferences.positioning.bubbleInsets.left + preferences.drawing.arrowHeight
            bubbleYOrigin = preferences.positioning.bubbleInsets.top
            
        }
        return CGRect(x: bubbleXOrigin, y: bubbleYOrigin, width: bubbleWidth, height: bubbleHeight)
    }
    
    private func getContentRect(from bubbleFrame: CGRect) -> CGRect {
        return CGRect(x: bubbleFrame.origin.x + preferences.positioning.contentInsets.left, y: bubbleFrame.origin.y + preferences.positioning.contentInsets.top, width: contentSize.width, height: contentSize.height)
    }
}
#endif
