//
//  CalculatorButton.m
//  Calculator
//
//  Created by du phung cong on 8/28/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "CalculatorButton.h"

@implementation CalculatorButton

- (CalculatorButton*)initWithFrame:(CGRect)frame
                          andValue:(int)value
                      andOperation:(NSString*)operation
                          andImageName:(NSString*)imageName {
    self = [super initWithFrame:frame];
    self.value = value;
    self.operation = operation;
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return self;
}

- (CalculatorButton*)initWithFrame:(CGRect)frame andValue:(int)value andImageName:(NSString*)imageName {
    return [self initWithFrame:frame andValue:value andOperation:nil andImageName:imageName];
}

- (CalculatorButton*)initWithFrame:(CGRect)frame andOperation:(NSString*)operation andImageName:(NSString*)imageName {
    return [self initWithFrame:frame andValue:-1 andOperation:operation andImageName:imageName];
}

@end
