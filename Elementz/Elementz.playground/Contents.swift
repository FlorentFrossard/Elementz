
import SwiftUI
import PlaygroundSupport
import AVFoundation

struct Sounds {
    
    static var audioPlayer:AVAudioPlayer?
    
    static func playSounds(soundfile: String) {
        
        if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
            
            do {
                
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                
            } catch {
                
                print("Error")
            }
        }
    }
}

struct Buttons_Animations: View {
    
    
    @State private var playOcean = false
    @State private var playFire = false
    @State private var playRain = false
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Button(action: {
                
                self.playOcean.toggle()
               
                if self.playOcean {
                    Sounds.playSounds(soundfile: "Ocean.mp3")
                } else {
                    Sounds.audioPlayer?.stop()
                }
            })
            {
                Text("🌊")
                    .padding(30)
                    .background(Circle()
                        .fill(Color(#colorLiteral(red: 0.458646059, green: 0.7758479714, blue: 0.9854969382, alpha: 1)))
                        .shadow(radius: 8, x: 4, y: 4)
                        .scaleEffect(playOcean ? 10 : 1)
                        .animation(playOcean ? Animation.easeOut(duration: 4)
                        .delay(0.1)
                         .repeatForever(autoreverses: true) : .default))
                    .overlay(Circle()
                        .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), lineWidth: playOcean ? 7 : 0)
                        .scaleEffect(playOcean ? 10 : 1)
                        .opacity(playOcean ? 0 : 1)
                        .animation(playOcean ? Animation.easeOut(duration: 4)
                        .delay(0.1)
                         .repeatForever(autoreverses: true) : .default))
                    .opacity(playRain ? 0 : 1)
                    .opacity(playFire ? 0 : 1)
            }
            .offset(x: 0, y: playOcean ? 160 : 0)
            .offset(x: playRain ? -300 : 0, y: playRain ?  -200 : 0)
            .offset(x: playFire ? -300 : 0, y: playFire ?  -200 : 0)
 
            Spacer()
            
            Button(action: {
                
                self.playFire.toggle()
                if self.playFire {
                    Sounds.playSounds(soundfile: "Fireplace.mp3")
                } else {
                    Sounds.audioPlayer?.stop()
                }
            })
            {
                Text("🔥")
                    .padding(30)
                    .background(Circle()
                        .fill(Color(#colorLiteral(red: 1, green: 0.9824847579, blue: 0.3919955194, alpha: 1)))
                        .shadow(radius: 8, x: 4, y: 4)
                        .scaleEffect(playFire ? 2 : 1)
                        .animation(playFire ? Animation.easeOut(duration: 0.7)
                            .delay(0.1)
                            .repeatForever(autoreverses: true) : .default))
                    .overlay(Circle()
                            .stroke(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), lineWidth: playFire ? 8 : 0)
                            .scaleEffect(playFire ? 2 : 1)
                            .opacity( 1)
                            .animation(playFire ? Animation.easeOut(duration: 0.7)
                            .delay(0.1)
                            .repeatForever(autoreverses: true) : .default)
                    .overlay(Circle()
                            .stroke(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), lineWidth: playFire ? 5 : 0)
                            .scaleEffect(playFire ? 2 : 2)
                            .opacity( 1)
                            .animation(playFire ? Animation.easeOut(duration: 0.2)
                            .delay(0.1)
                            .repeatForever(autoreverses: true) : .default)))
                    .opacity(playOcean ? 0 : 1)
                    .opacity(playRain ? 0 : 1)
            }
            .offset(x: playOcean ? 300 : 0, y: playOcean ? -200 : 0)
            .offset(x: playRain ? 300 : 0, y: playRain ? -200 : 0)
            
            Spacer()
            
            Button(action: {
                
                self.playRain.toggle()
                
                if self.playRain {
                    Sounds.playSounds(soundfile: "RainForest.mp3")
                } else {
                    Sounds.audioPlayer?.stop()
                }
            })
            {
                Text("⛈")
                    .padding(30)
                    .background(Circle()
                        .fill(Color(#colorLiteral(red: 0.3119118512, green: 0.707485497, blue: 0.4195215106, alpha: 1)))
                        .shadow(radius: 8, x: 4, y: 4)
                        .scaleEffect(playRain ? 30 : 1))
                .overlay(Circle()
                        .stroke(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), lineWidth: playRain ? 25 : 1)
                        .scaleEffect(playRain ? 0 : 10)
                        .opacity(playRain ? 1 : 0)
                        .animation(playRain ? Animation.easeOut(duration: 3)
                            .delay(0.45)
                            .repeatForever(autoreverses: false) : .default)
                .overlay(Circle()
                        .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: playRain ? 20 : 1)
                        .scaleEffect(playRain ? 0 : 5)
                        .opacity(playRain ? 1 : 0)
                        .animation(playRain ? Animation.easeOut(duration: 3)
                            .delay(0.30)
                            .repeatForever(autoreverses: false) : .default))
                .overlay(Circle()
                        .stroke(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), lineWidth: playRain ? 10 : 1)
                        .scaleEffect(playRain ? 0 : 2.5)
                        .opacity(playRain ? 1 : 0)
                        .animation(playRain ? Animation.easeOut(duration: 3)
                            .delay(0.1)
                            .repeatForever(autoreverses: false) : .default)))
                    .opacity(playFire ? 0 : 1)
                    .opacity(playOcean ? 0 : 1)
            }
            .offset(x: 0, y: playRain ? -180 : 0)
            .offset(x: playOcean ? -300 : 0, y: playOcean ? -200 : 0)
            .offset(x: playFire ? 300 : 0, y: playFire  ? -200 : 0)
            
                    Spacer()
            }
            .frame(width: 500 , height: 700)
            .animation(.spring())
            .background(Color(#colorLiteral(red: 0.730656445, green: 0.8945474625, blue: 0.9225506783, alpha: 1)).opacity(0.5))

    }
}



// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(Buttons_Animations())
