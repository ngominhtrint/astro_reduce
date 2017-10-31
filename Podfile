# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Astro' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Astro
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'Alamofire',  '~> 4.5'
  pod 'AlamofireImage', '~> 3.3'
  pod 'AlamofireObjectMapper', '~> 5.0'
  pod 'SVProgressHUD'
  pod 'G3GridView'

  target 'AstroTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest', '~> 4.0'
  end

  target 'AstroUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end

end
