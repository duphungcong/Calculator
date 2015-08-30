//
//  NumberButton.h
//  Calculator
//
//  Created by du phung cong on 8/28/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberButton : UIButton

@property (nonatomic) int value;

- (NumberButton*)initWithFrame:(CGRect)frame andValue:(int)value;

@end
