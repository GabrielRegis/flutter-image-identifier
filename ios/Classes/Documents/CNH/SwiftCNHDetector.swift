import Vision

@available(iOS 16.0, *)
public class SwiftCNHDetector{
    
    public func detectCNHFromBase64String(imageBase64: String) -> CNH?{
        
        guard let dataDecoded : Data = Data(base64Encoded: imageBase64, options: .ignoreUnknownCharacters) else{
            return nil
        }
        
        let decodedimage = UIImage(data: dataDecoded)
        
        let imageRequestHandler = VNImageRequestHandler(cgImage: (decodedimage?.cgImage)!,options: [:])
        
        let request = VNRecognizeTextRequest()

        do {
            try imageRequestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
        
        guard let observations =
                request.results else {
            return nil
        }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            return observation.topCandidates(1).first?.string
        }
        let dataString = recognizedStrings.joined(separator: "||")
        let cnh = CNH.fromString(data: dataString)
        return cnh
    }
}
