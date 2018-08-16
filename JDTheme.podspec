

Pod::Spec.new do |s|

    s.name         = "JDTheme"
    s.version      = '0.0.3' 
    s.summary      = "JDLog"

    s.description  = <<-DESC
			JDRouter
                   DESC

    s.homepage     = "https://github.com/JDongKhan/JDTheme.git"

    s.license      = { :type => 'MIT', :file => 'LICENSE' }

    s.author             = { "wangjindong" => "419591321@qq.com" }
    s.platform     = :ios, "8.0"

    s.source       = { :git => "https://github.com/JDongKhan/JDTheme.git", :tag => s.version.to_s }


    s.frameworks = 'Foundation', 'UIKit'
    s.requires_arc = true


    s.source_files = 'JDTheme/JDTheme/**/*.{h,m}'
    s.public_header_files = 'JDTheme/JDTheme/**/*.h'


end
