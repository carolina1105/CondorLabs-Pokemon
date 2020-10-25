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
end

def shared
  pod 'KeychainSwift'
end

target 'Pokemon' do
  common
  shared
  pod 'LanguagesManager'
  pod 'NVActivityIndicatorView'
end

  target 'PokemonTests' do
  common
end

  target 'PokemonUITests' do
  common
end
