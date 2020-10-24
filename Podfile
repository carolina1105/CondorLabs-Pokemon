platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def common
  pod 'RxSwift' 
  pod 'RxCocoa'
  pod 'RxRealm'
  pod 'RealmSwift'
  pod 'Alamofire', '~> 5.1'
  pod 'Firebase'
  pod 'Firebase/Messaging'
  pod 'Firebase/Crashlytics'
  pod 'PureLayout'
  pod 'MarqueeLabel'
  pod 'ISEmojiView'
  pod 'Giphy'
  pod 'GoogleWebRTC'
  pod 'PusherSwift'
  pod 'SwiftyStoreKit'
end

def shared
  pod 'KeychainSwift'
end

target 'Pokemon' do
  common
  shared
  pod 'LanguagesManager'
  pod 'lottie-ios'
  pod 'TransitionButton'
  pod 'CropViewController'
  pod 'NVActivityIndicatorView'
end

  target 'PokemonTests' do
  common
  pod 'RxBlocking'
end

  target 'PokemonUITests' do
  common
  pod 'RxBlocking'
end
