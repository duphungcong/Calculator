//
//  NumberButton.m
//  Calculator
//
//  Created by du phung cong on 8/28/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "NumberButton.h"

@implementation NumberButton

- (NumberButton*)initWithFrame:(CGRect)frame andValue:(int)value {
    self = [super initWithFrame:frame];
    if(self) {
        [self construct:value];
    }
    
    return self;
}

- (void)construct:(int)value {
    self.value = value;
}

@end
