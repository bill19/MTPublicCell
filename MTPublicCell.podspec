Pod::Spec.new do |s|
  s.name         = "MTPublicCell"
  s.version      = "0.0.1"
  s.summary      = " all kinds of categories for iOS developer "
  s.description  = <<-DESC
                      this project provide all kinds of categories for iOS developer 
                   DESC
  s.homepage     = "https://github.com/bill19/MTPublicCell"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "HaoSun" => "sunhao.private@foxmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/bill19/MTPublicCell.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "MTPublicCell/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "MTPublicCell/MTPublicHeader.h ","MTPublicCell/**/*.h"
  s.requires_arc = true
end
