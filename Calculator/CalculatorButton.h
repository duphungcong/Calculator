//
//  CalculatorButton.h
//  Calculator
//
//  Created by du phung cong on 8/28/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorButton : UIButton

@property (nonatomic) int value;
@property (nonatomic) NSString* operation;

- (CalculatorButton*)initWithFrame:(CGRect)frame andValue:(int)value andImageName:(NSString*)imageName;
- (CalculatorButton*)initWithFrame:(CGRect)frame andOperation:(NSString*)operation andImageName:(NSString*)imageName;

@end
