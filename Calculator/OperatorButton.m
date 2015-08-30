//
//  OperatorButton.m
//  Calculator
//
//  Created by du phung cong on 8/28/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "OperatorButton.h"

@implementation OperatorButton

- (OperatorButton*)initWithFrame:(CGRect)frame andOperator:(NSString*)operator {
    self= [super initWithFrame:frame];
    if(self) {
        [self construct:operator];
    }
    
    return self;
}

- (void)construct:(NSString*)operator {
    self.operator = operator;
}
@end
