#if os(iOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif

public enum AvatarViewCornerStyle {
    case rounded(CGFloat)
    case circular
    case flat
}


enum AvatarSource {
    case configuration
#if os(iOS)
    case image(UIImage)
#elseif os(macOS)
    case image(NSImage)
#endif
}

#if os(iOS)


public class Avatar: UIView {

    private lazy var imageView = UIImageView()

    public var cornerStyle: AvatarViewCornerStyle = .circular {
        didSet {
            setupView()
        }
    }

    public struct AvatarConfiguration {
        var source: AvatarSource
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        switch cornerStyle {
        case .rounded(let radius):
            layer.cornerRadius = radius
        case .circular:
            layer.cornerRadius = bounds.width / 2
        case .flat:
            layer.cornerRadius = 0.0
        }
    }

    public func apply(_ configuration: AvatarConfiguration) {
        switch configuration.source {
        case .configuration:
            <#code#>
        case .image(let image):
            imageView.clipsToBounds = true
            imageView.frame = bounds

            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            addSubview(imageView)
        }
    }
}

#endif
