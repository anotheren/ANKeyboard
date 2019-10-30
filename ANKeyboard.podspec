Pod::Spec.new do |s|
    s.name = 'ANKeyboard'
    s.version = '1.5.2'
    s.license = 'MIT'
    s.summary = 'ANKeyboard'
    s.homepage = 'https://github.com/anotheren/ANKeyboard'
    s.authors = {
        'anotheren' => 'liudong.edward@gmail.com',
    }
    s.source = { :git => 'https://github.com/anotheren/ANKeyboard.git', :tag => s.version }
    s.ios.deployment_target = '10.0'
    s.swift_versions = ['5.0', '5.1']
    s.source_files = 'Sources/**/*.swift'
    s.resources = 'Sources/Resources/**/*'
    s.frameworks = 'Foundation'
    s.dependency 'SnapKit'
  end
