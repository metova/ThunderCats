Pod::Spec.new do |s|
  s.name         = "ThunderCats"
  s.version      = "3.0.0"
  s.summary      = "Useful categories"

  s.homepage = "http://metova.com"
  s.license  = { :type => "MIT", :file => "LICENSE" }
  s.authors  = {
    "Logan Gauthier" => "logan.gauthier@metova.com",
    "Kurt Treangen" => "kurt.treangen@metova.com",
    "William Grand" => "william.grand@metova.com",
    "Nick Griffith" => "nick.griffith@metova.com",
    "Abbey Jackson" => "abbey.jackson@metova.com",
    "Jonathon Richardson" => "jonathon.richardson@metova.com",
    "Beverly Massengill" => "beverly.massengill@metova.com"
  }

  s.platform = :ios, '8.0'
  s.ios.deployment_target = '8.0'

  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true

  s.source = { :git => "https://github.com/metova/ThunderCats.git", :tag => s.version.to_s }

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = [
      'ThunderCats/Core',
      'ThunderCats/Core/**/*.{h,m,swift}'
    ]
    core.public_header_files = [
      'ThunderCats/Core/**/*.h'
    ]
    core.exclude_files = [
      'ThunderCats/Core/Exclude'
    ]
  end

  s.subspec 'Photos' do |photos|
    photos.dependency 'ThunderCats/Core'
    photos.source_files = [
      'ThunderCats/Photos',
      'ThunderCats/Photos/**/*.{h,m,swift}'
    ]
    photos.public_header_files = [
      'ThunderCats/Photos/**/*.h'
    ]
    photos.exclude_files = [
      'ThunderCats/Photos/Exclude'
    ]
  end

end
