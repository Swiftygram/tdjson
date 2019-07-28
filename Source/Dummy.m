//
//  Dummy.m
//  tdjson iOS
//
//  Created by KY1VSTAR on 7/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

#import <tdjson/tdjson.h>

// This class is needed to force Xcode to include static libraries.
// Not ideal decision, but I failed to find a better one.
@interface __tdjson_dummy_class : NSObject
@end

@implementation __tdjson_dummy_class

- (void)dummyMethod {
    td_json_client_create();
}

@end
