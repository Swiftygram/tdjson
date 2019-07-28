Pod::Spec.new do |s|
    s.name             = 'tdjson-{lowercased_platform}'
    s.version          = '{version}'
    s.summary          = 'TDLib JSON interface for {platform}'

    s.description      = 'TDLib (Telegram Database library) is a cross-platform library for building Telegram clients. tdjson is a C interface for interaction with TDLib via JSON-serialized objects. Can be used to easily integrate TDLib with any programming language which supports calling C functions and is able to work with JSON.'

    s.homepage         = 'https://bitbucket.org/ky1vstar/tdjson/'
    s.license          = { :type => 'BSL-1.0', :file => 'LICENSE_1_0.txt' }
    s.author           = 'Telegram', 'ky1vstar'
    s.source           = { :http => "https://bitbucket.org/ky1vstar/tdjson/raw/master/{platform}/tdjson.#{s.version}.zip" }

    s.platform = :{lowercased_platform}
    s.deployment_target = '8.0'
    s.vendored_frameworks = 'tdjson.framework'
    s.requires_arc = true

end
