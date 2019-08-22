import AVKit

extension UIImage {

    static func generateThumbnail(url: URL) -> UIImage {
        do {
            let asset = AVURLAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imageGenerator.copyCGImage(at: .zero,
                                                         actualTime: nil)

            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            let image = UIImage(named: "placeholder_video_image")?.withRenderingMode(.alwaysTemplate)
            guard let defaultThumbnail = image else { return UIImage() }
            return defaultThumbnail
        }
    }
}
