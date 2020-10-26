platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def common
  pod 'RxRealm'
  pod 'RealmSwift'
  pod 'Alamofire', '~> 5.1'
end

target 'Pokemon' do
  common
  pod 'LanguagesManager'
  pod 'NVActivityIndicatorView'
end

  target 'PokemonTests' do
  common
end

  target 'PokemonUITests' do
  common
end
