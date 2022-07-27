#
# Be sure to run `pod lib lint HLTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HLTableView'
  s.version          = '2.0.0'
  s.summary          = '这是一个简单的UITableView封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        这是一个使用模型与UITableView进行关联的设计模式,进行对UITableView进行封装
                       DESC

  s.homepage         = 'https://github.com/hailong123/HLTableView'
  s.static_framework = true;
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sea' => '771145867@qq.com' }
  s.source           = { :git => 'https://github.com/hailong123/HLTableView.git', :tag => s.version.to_s }

  s.prefix_header_file    = 'HLTableView/Classes/HLTableViewPrefixHeader.pch'
  s.ios.deployment_target = '8.0'

  s.source_files        = 'HLTableView/Classes/**/*'
  s.public_header_files = 'HLTableView/Classes/**/*.h'

  # s.resources           = ['HLTableView/Assets/*']

  s.dependency 'Masonry'
  s.dependency 'MJRefresh'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  
end
