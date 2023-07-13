//
//  VPSwitchToggle.swift
//  VPSwitchToggle-Swift-Demo
//
//  Created by Vanson Leung on 12/7/2023.
//

import UIKit

@IBDesignable public class VPSwitchToggle_IBDesignable: VPSwitchToggle {
    
    
    @IBInspectable private var ib_widgetForegroundMargin: CGFloat = 6.0 {
        didSet {
            widgetForegroundMargin = ib_widgetForegroundMargin
        }
    }
    @IBInspectable private var ib_state_on_backgroundImage: UIImage? {
        didSet {
            state_on_backgroundImage = ib_state_on_backgroundImage
        }
    }
    @IBInspectable private var ib_state_on_backgroundColor: UIColor? {
        didSet {
            state_on_backgroundColor = ib_state_on_backgroundColor
        }
    }
    @IBInspectable private var ib_state_on_foregroundImage: UIImage? {
        didSet {
            state_on_foregroundImage = ib_state_on_foregroundImage
        }
    }
    @IBInspectable private var ib_state_on_foregroundColor: UIColor? {
        didSet {
            state_on_foregroundColor = ib_state_on_foregroundColor
        }
    }
    @IBInspectable private var ib_state_off_backgroundImage: UIImage? {
        didSet {
            state_off_backgroundImage = ib_state_off_backgroundImage
        }
    }
    @IBInspectable private var ib_state_off_backgroundColor: UIColor? {
        didSet {
            state_off_backgroundColor = ib_state_off_backgroundColor
        }
    }
    @IBInspectable private var ib_state_off_foregroundImage: UIImage? {
        didSet {
            state_off_foregroundImage = ib_state_off_foregroundImage
        }
    }
    @IBInspectable private var ib_state_off_foregroundColor: UIColor? {
        didSet {
            state_off_foregroundColor = ib_state_off_foregroundColor
        }
    }
    @IBInspectable private var ib_backgroundImageOrder: String = BackgroundImageOrder.fade.rawValue {
        didSet {
            backgroundImageOrder = ib_backgroundImageOrder
        }
    }
    @IBInspectable private var ib_on: Bool = false {
        didSet {
            isOn = ib_on
        }
    }
    
}




@MainActor public class VPSwitchToggle: UIControl {
    
    public override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        _isInterfaceBuilder = true;
    }

    static var _isInterfaceBuilder: Bool = false
    
    
    public enum BackgroundImageOrder: String {
        case fade
        case horizontal
        case vertical
        case horizontalReversed
        case verticalReversed
    }
    
    public class VPSwitchState {
        var backgroundImage: UIImage? = nil
        var backgroundColor: UIColor? = .gray
        var foregroundImage: UIImage? = nil
        var foregroundColor: UIColor? = .gray
        
        public init(
            backgroundImage: UIImage?,
            backgroundColor: UIColor?,
            foregroundImage: UIImage?,
            foregroundColor: UIColor?
        ) {
            self.backgroundImage = backgroundImage
            self.backgroundColor = backgroundColor
            self.foregroundImage = foregroundImage
            self.foregroundColor = foregroundColor
        }
    }
    
    
    
    
    func getBgOffsetForOff() -> CGSize {
        let width = frame.width
        let height = frame.height
        let position = _initialPositionPercent
        print(width, height, position)
        if _backgroundImageOrder == .horizontal {
            return CGSize(
                width: width * -position,
                height: 0
            )
        }
        if _backgroundImageOrder == .horizontalReversed {
            return CGSize(
                width: width * +position,
                height: 0
            )
        }
        if _backgroundImageOrder == .vertical {
            return CGSize(
                width: 0,
                height: height * -position
            )
        }
        if _backgroundImageOrder == .verticalReversed {
            return CGSize(
                width: 0,
                height: height * +position
            )
        }
        return .zero
    }
    
    func getBgOffsetForOn() -> CGSize {
        let width = frame.width
        let height = frame.height
        let position = _initialPositionPercent
        if _backgroundImageOrder == .horizontal {
            return CGSize(
                width: width + (width * -position),
                height: 0
            )
        }
        if _backgroundImageOrder == .horizontalReversed {
            return CGSize(
                width: -width + (width * +position),
                height: 0
            )
        }
        if _backgroundImageOrder == .vertical {
            return CGSize(
                width: 0,
                height: height + (height * -position)
            )
        }
        if _backgroundImageOrder == .verticalReversed {
            return CGSize(
                width: 0,
                height: -height + (height * +position)
            )
        }
        return .zero
    }
    
    
    var _initialPositionPercent: CGFloat = 0

    private var _draggableSwitch: VPSwitchToggleButton?
    
    
    private var switchState: Bool = false
    
    private var _widgetForegroundMargin: CGFloat = 6.0
    
    private var _state_on_backgroundImage: UIImage? = nil
    private var _state_on_backgroundColor: UIColor? = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
    private var _state_on_foregroundImage: UIImage? = nil
    private var _state_on_foregroundColor: UIColor? = UIColor(red: 0.4, green: 1.0, blue: 0.4, alpha: 1.0)
    
    private var _state_off_backgroundImage: UIImage? = nil
    private var _state_off_backgroundColor: UIColor? = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
    private var _state_off_foregroundImage: UIImage? = nil
    private var _state_off_foregroundColor: UIColor? = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    
    private var _backgroundImageOrder: BackgroundImageOrder = .horizontal
    
    
    
    
    
    public var widgetForegroundMargin: CGFloat = 6.0 {
        didSet {
            _widgetForegroundMargin = widgetForegroundMargin
        }
    }
    public var state_on_backgroundImage: UIImage? {
        didSet {
            _state_on_backgroundImage = state_on_backgroundImage
        }
    }
    public var state_on_backgroundColor: UIColor? {
        didSet {
            _state_on_backgroundColor = state_on_backgroundColor
        }
    }
    public var state_on_foregroundImage: UIImage? {
        didSet {
            _state_on_foregroundImage = state_on_foregroundImage
        }
    }
    public var state_on_foregroundColor: UIColor? {
        didSet {
            _state_on_foregroundColor = state_on_foregroundColor
        }
    }
    public var state_off_backgroundImage: UIImage? {
        didSet {
            _state_off_backgroundImage = state_off_backgroundImage
        }
    }
    public var state_off_backgroundColor: UIColor? {
        didSet {
            _state_off_backgroundColor = state_off_backgroundColor
        }
    }
    public var state_off_foregroundImage: UIImage? {
        didSet {
            _state_off_foregroundImage = state_off_foregroundImage
        }
    }
    public var state_off_foregroundColor: UIColor? {
        didSet {
            _state_off_foregroundColor = state_off_foregroundColor
        }
    }
    public var backgroundImageOrder: String = BackgroundImageOrder.fade.rawValue {
        didSet {
            _backgroundImageOrder = BackgroundImageOrder(rawValue: backgroundImageOrder) ?? .fade
        }
    }
    
    
    
    
    var _foregroundView: UIView?
    var _foregroundImageViewOn: UIImageView?
    var _foregroundImageViewOff: UIImageView?
    var _backgroundView: UIView?
    var _backgroundImageViewOn: UIImageView?
    var _backgroundImageViewOff: UIImageView?
    var _backgroundGlow: UIImageView?
    
    
    
    
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.buildView(isLayoutSubview: true)
    }
    
    
    
    
    public var isOn: Bool {
        get {
            return switchState
        }
        set {
            if switchState != newValue {
                switchState = newValue
                sendActions(for: .valueChanged)
            }
            refreshUI(true)
        }
    }
    
    public func setOn(_ on: Bool, animated: Bool) {
        isOn = on
        refreshUI(false)
    }
    
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        buildView(isLayoutSubview: false)
        setupGestureRecognizers()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        buildView(isLayoutSubview: false)
        setupGestureRecognizers()
    }
    
    
    
    
    
    
    
    private func buildView(isLayoutSubview: Bool) {

        layer.masksToBounds = false
        let __frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)

        if _draggableSwitch == nil && isLayoutSubview {
            
            let bw = UIView(frame: CGRect(x: __frame.origin.x, y: __frame.origin.y - 2, width: __frame.size.width, height: __frame.size.height))
            let bb = UIView(frame: CGRect(x: __frame.origin.x, y: __frame.origin.y + 2, width: __frame.size.width, height: __frame.size.height))
            bw.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            bb.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            addSubview(bw)
            addSubview(bb)
            
            
            

            bw.layer.cornerRadius = frame.height / 2
            bb.layer.cornerRadius = frame.height / 2

            _backgroundView = UIView(frame: __frame)
            _backgroundView?.layer.masksToBounds = true
            _backgroundView?.layer.cornerRadius = frame.height / 2
            _backgroundImageViewOn = UIImageView(image: state_on_backgroundImage)
            _backgroundImageViewOff = UIImageView(image: state_off_backgroundImage)
            _backgroundImageViewOn?.frame = __frame
            _backgroundImageViewOff?.frame = __frame
            
            _backgroundGlow = UIImageView(image: nil)

            if let path = Bundle.module.path(forResource: "f_switch_base_glow", ofType: "png"),
                let image = UIImage(contentsOfFile: path)
            {
                _backgroundGlow?.image = image
            }

            let size = __frame.size.height * 200 / 100
            _backgroundGlow?.frame = CGRect(x: -size / 2 + __frame.height / 2, y: -size / 2 + __frame.height / 2, width: size, height: size)
            
            
            if let e = _backgroundView { addSubview(e) }
            if let e = _backgroundImageViewOn { _backgroundView?.addSubview(e) }
            if let e = _backgroundImageViewOff { _backgroundView?.addSubview(e) }
            if let e = _backgroundGlow { _backgroundView?.addSubview(e) }
            

            let draggableSwitch = VPSwitchToggleButton(frame: __frame)
            addSubview(draggableSwitch)
            _draggableSwitch = draggableSwitch
            
            
        }
        
        _backgroundView?.frame = __frame
        _backgroundImageViewOn?.frame = __frame
        _backgroundImageViewOff?.frame = __frame

        let size = __frame.size.height * 200 / 100
        _backgroundGlow?.frame = CGRect(x: -size / 2 + __frame.height / 2, y: -size / 2 + __frame.height / 2, width: size, height: size)

        
        _draggableSwitch?.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
        _draggableSwitch?.master = self
        
        refreshUI(false)
    }
    
    
    private func setupGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    
    private func refreshUI(_ animated: Bool) {
        if !animated || VPSwitchToggle._isInterfaceBuilder {
            _refreshUI()
            _refreshBackgroundImagePositions()
        } else {
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
                self._refreshUI()
            }
        }
    }
    
    private func _refreshUI() {
        self._draggableSwitch?.refreshUI()

        if self.isOn {
            _backgroundView?.backgroundColor = self.state_on_backgroundColor
            
            if _backgroundImageOrder == .fade {
                self._backgroundImageViewOn?.alpha = 1.0
                self._backgroundImageViewOff?.alpha = 0.0
            } else {
                self._backgroundImageViewOn?.alpha = 1.0
                self._backgroundImageViewOff?.alpha = 1.0
            }
            
            
        } else {
            _backgroundView?.backgroundColor = self.state_off_backgroundColor

            if _backgroundImageOrder == .fade {
                self._backgroundImageViewOn?.alpha = 0.0
                self._backgroundImageViewOff?.alpha = 1.0
            } else {
                self._backgroundImageViewOn?.alpha = 1.0
                self._backgroundImageViewOff?.alpha = 1.0
            }

        }

        _backgroundImageViewOn?.frame = CGRect(x: getBgOffsetForOn().width, y: getBgOffsetForOn().height, width: frame.width, height: frame.height)
        _backgroundImageViewOff?.frame = CGRect(x: getBgOffsetForOff().width, y: getBgOffsetForOff().height, width: frame.width, height: frame.height)
        
        if let _foregroundView = _draggableSwitch,
           let _backgroundGlow = _backgroundGlow {
            _backgroundGlow.frame = CGRect(x: _foregroundView.frame.origin.x + _foregroundView.frame.height/2 - _backgroundGlow.frame.height/2, y: _foregroundView.frame.origin.y + _foregroundView.frame.height/2 - _backgroundGlow.frame.height/2, width: _backgroundGlow.frame.width, height: _backgroundGlow.frame.height)
        }
        
    }
    
    
    func _refreshBackgroundImagePositions() {
        _backgroundImageViewOn?.frame = CGRect(x: getBgOffsetForOn().width, y: getBgOffsetForOn().height, width: frame.width, height: frame.height)
        _backgroundImageViewOff?.frame = CGRect(x: getBgOffsetForOff().width, y: getBgOffsetForOff().height, width: frame.width, height: frame.height)
        
        if let _foregroundView = _draggableSwitch,
           let _backgroundGlow = _backgroundGlow {
            _backgroundGlow.frame = CGRect(x: _foregroundView.frame.origin.x + _foregroundView.frame.height/2 - _backgroundGlow.frame.height/2, y: _foregroundView.frame.origin.y + _foregroundView.frame.height/2 - _backgroundGlow.frame.height/2, width: _backgroundGlow.frame.width, height: _backgroundGlow.frame.height)
        }

        if _backgroundImageOrder == .fade {
            self._backgroundImageViewOn?.alpha = _initialPositionPercent
            self._backgroundImageViewOff?.alpha = 1 - _initialPositionPercent
        } else {
            self._backgroundImageViewOn?.alpha = 1.0
            self._backgroundImageViewOff?.alpha = 1.0
        }
        
        self._foregroundImageViewOn?.alpha = _initialPositionPercent
        self._foregroundImageViewOff?.alpha = 1 - _initialPositionPercent
        
        
        if let soff = _state_off_backgroundColor, let son = _state_on_backgroundColor {
            _backgroundView?.backgroundColor = lerpColor(fromColor: soff, toColor: son, weight: _initialPositionPercent)
        }
        
        if let soff = _state_off_foregroundColor, let son = _state_on_foregroundColor {
            _foregroundView?.backgroundColor = lerpColor(fromColor: soff, toColor: son, weight: _initialPositionPercent)
        }
    }
    
    
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let state = gestureRecognizer.state
        
        print(state.rawValue)
        if state == .ended {
            isOn.toggle()
        }
    }
}


private class VPSwitchToggleButton: UIView {
    
    private var touchStartPosition: CGFloat = 0
    private var initialPosition: CGFloat = 0
    
    var master: VPSwitchToggle?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView(isLayoutSubview: false)
        setupGestureRecognizers()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        buildView(isLayoutSubview: false)
        setupGestureRecognizers()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buildView(isLayoutSubview: true)
    }
    
    
    private func buildView(isLayoutSubview: Bool) {
        
        let __frame = CGRect(
            x: 0, y: 0,
            width: frame.height, height: frame.height
        ).inset(by: .init(
            top: master?.widgetForegroundMargin ?? 0,
            left: master?.widgetForegroundMargin ?? 0,
            bottom: master?.widgetForegroundMargin ?? 0,
            right: master?.widgetForegroundMargin ?? 0
        ))
        
        let __frame_inner = CGRect(
            x: 0, y: 0,
            width: frame.height - (master?.widgetForegroundMargin ?? 0) * 2, height: frame.height - (master?.widgetForegroundMargin ?? 0) * 2
        )
        
        if master?._foregroundView == nil && isLayoutSubview {
            
            
            
            
            master?._foregroundView = UIView(
                frame: __frame
            )
            
            master?._foregroundImageViewOn = UIImageView(
                frame: __frame_inner
                )
            master?._foregroundImageViewOff = UIImageView(
                frame: __frame_inner
                )

            
            if let e = master?._foregroundImageViewOn { master?._foregroundView?.addSubview(e) }
            if let e = master?._foregroundImageViewOff { master?._foregroundView?.addSubview(e) }

            master?._foregroundView?.layer.cornerRadius = (master?._foregroundView?.frame.height ?? 0) / 2
            
            if let _foregroundView = master?._foregroundView {
                addSubview(_foregroundView)
            }
        }
        
        master?._foregroundView?.frame = __frame
        
        master?._foregroundImageViewOn?.frame = __frame_inner
        master?._foregroundImageViewOn?.image = master?.state_on_foregroundImage
        
        master?._foregroundImageViewOff?.frame = __frame_inner
        master?._foregroundImageViewOff?.image = master?.state_off_foregroundImage

        master?._foregroundView?.layer.cornerRadius = (master?._foregroundView?.frame.height ?? 0) / 2
        
        
        refreshUI()
    }
    
    
    
    
    private func setupGestureRecognizers() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(panGestureRecognizer)
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    public func refreshPositionPercent(animated: Bool) {
        if let w = master?.frame.width {
            master?._initialPositionPercent = (self.center.x - self.frame.width/2) / (w - self.frame.width)
            if animated {
//                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
//                    self.master?._refreshBackgroundImagePositions()
//                }
            } else {
                self.master?._refreshBackgroundImagePositions()
            }
        }
    }
    
    
    public func refreshUI() {
        if master?.isOn == true {
            self.center.x = (self.superview?.frame.width ?? self.frame.width) - self.frame.width / 2
            master?._foregroundView?.backgroundColor = self.master?.state_on_foregroundColor
            master?._foregroundImageViewOn?.alpha = 1.0
            master?._foregroundImageViewOff?.alpha = 0.0
        } else {
            self.center.x = self.frame.width / 2
            master?._foregroundView?.backgroundColor = self.master?.state_off_foregroundColor
            master?._foregroundImageViewOn?.alpha = 0.0
            master?._foregroundImageViewOff?.alpha = 1.0
        }
        
        refreshPositionPercent(animated: true)
    }
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let state = gestureRecognizer.state
        
        print(state.rawValue)
        if state == .ended {
            master?.isOn.toggle()
        }
    }
    
    @objc private func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: self)
        
        switch gestureRecognizer.state {
        case .began:
            touchStartPosition = gestureRecognizer.location(in: self).x
            initialPosition = center.x
            
        case .changed:
            let newPositionX = initialPosition + translation.x
            let limitedX = max(frame.width / 2, min( (superview?.frame.width ?? frame.width) - frame.width / 2, newPositionX)  )
            center = CGPoint(x: limitedX, y: center.y)
            refreshPositionPercent(animated: false)
            
        case .ended:
            let moveThreshold = superview!.frame.width / 6
            print (moveThreshold , center.x )
            
            if master?.isOn != true {
                if center.x > moveThreshold {
                    master?.isOn = true
                } else {
                    master?.isOn = false
                }
            } else {
                if center.x < superview!.frame.width - moveThreshold {
                    master?.isOn = false
                } else {
                    master?.isOn = true
                }
            }
            
            break
            
        default:
            break
        }
    }
}




func lerpColor(fromColor: UIColor, toColor: UIColor, weight: CGFloat) -> UIColor {
    let fromComponents = fromColor.components()
    let toComponents = toColor.components()

    let lerpedRed = (1 - weight) * fromComponents.red + weight * toComponents.red
    let lerpedGreen = (1 - weight) * fromComponents.green + weight * toComponents.green
    let lerpedBlue = (1 - weight) * fromComponents.blue + weight * toComponents.blue
    let lerpedAlpha = (1 - weight) * fromComponents.alpha + weight * toComponents.alpha

    return UIColor(red: lerpedRed, green: lerpedGreen, blue: lerpedBlue, alpha: lerpedAlpha)
}

extension UIColor {
    func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let uiColor = self
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}



class EdgeShadowLayer: CAGradientLayer {

    public enum Edge {
        case Top
        case Left
        case Bottom
        case Right
    }

    public init(forView view: UIView,
                edge: Edge = Edge.Top,
                shadowRadius radius: CGFloat = 20.0,
                toColor: UIColor = UIColor.white,
                fromColor: UIColor = UIColor.black) {
        super.init()
        self.colors = [fromColor.cgColor, toColor.cgColor]
        self.shadowRadius = radius

        let viewFrame = view.frame

        switch edge {
            case .Top:
                startPoint = CGPoint(x: 0.5, y: 0.0)
                endPoint = CGPoint(x: 0.5, y: 1.0)
                self.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: shadowRadius)
            case .Bottom:
                startPoint = CGPoint(x: 0.5, y: 1.0)
                endPoint = CGPoint(x: 0.5, y: 0.0)
                self.frame = CGRect(x: 0.0, y: viewFrame.height - shadowRadius, width: viewFrame.width, height: shadowRadius)
            case .Left:
                startPoint = CGPoint(x: 0.0, y: 0.5)
                endPoint = CGPoint(x: 1.0, y: 0.5)
                self.frame = CGRect(x: 0.0, y: 0.0, width: shadowRadius, height: viewFrame.height)
            case .Right:
                startPoint = CGPoint(x: 1.0, y: 0.5)
                endPoint = CGPoint(x: 0.0, y: 0.5)
                self.frame = CGRect(x: viewFrame.width - shadowRadius, y: 0.0, width: shadowRadius, height: viewFrame.height)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
