Pod::Spec.new do |s|
    s.name             = 'tdjson'
    s.version          = '1.4.0'
    s.summary          = 'TDLib JSON interface for iOS, macOS, watchOS and tvOS'

    s.description      = 'TDLib (Telegram Database library) is a cross-platform library for building Telegram clients. tdjson is a C interface for interaction with TDLib via JSON-serialized objects. Can be used to easily integrate TDLib with any programming language which supports calling C functions and is able to work with JSON.'

    s.homepage         = 'https://github.com/ky1vstar/tdjson'
    s.license          = { :type => 'BSL-1.0', :file => 'LICENSE_1_0.txt' }
    s.author           = 'Telegram', 'ky1vstar'
    s.source           = { :http => "https://github.com/ky1vstar/tdjson/releases/download/#{s.version}/tdjson.cocoapods.tar.gz" }

    s.platforms = { :ios => "9.0", :tvos => "9.0", :osx => "10.9", :watchos => "2.0" }
    s.requires_arc = true

    s.source_files        = 'Source/td/**/*.h', 'Source/*.swift'
    s.public_header_files = 'Source/td/**/*.h'
    s.library = 'c++', 'z', 'crypto', 'ssl', 'tdcore', 'tdactor', 'tdclient', 'tddb', 'tdjson_private', 'tdjson_static', 'tdnet', 'tdsqlite', 'tdutils'
    s.framework = 'Foundation'

    # iOS
    s.ios.preserve_paths         = 'iOS/*.a'
    s.ios.vendored_libraries     = 'iOS/*.a'

    # macOS
    s.osx.preserve_paths       = 'macOS/*.a'
    s.osx.vendored_libraries   = 'macOS/*.a'

    # watchOS
    s.watchos.preserve_paths     = 'watchOS/*.a'
    s.watchos.vendored_libraries = 'watchOS/*.a'

    # tvOS
    s.tvos.preserve_paths        = 'tvOS/*.a'
    s.tvos.vendored_libraries    = 'tvOS/*.a'
end
