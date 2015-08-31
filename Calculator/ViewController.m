//
//  ViewController.m
//  Calculator
//
//  Created by du phung cong on 8/27/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    float _x;
    float _y;
    float _buttonWidth;
    float _buttonHeight;
    
    float _currentResult;
    float _storedResult;
    float _currentNumber;
    float _storedNumber;
    
    BOOL _dotActive;
    BOOL _negativeActive;

    NSString* _currentOperator;
    NSString* _lastOperator;
    
    int _count;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _buttonWidth = self.view.frame.size.width / 6;
    _buttonHeight = _buttonWidth / 1.18367;
    _x = self.view.center.x - (2 * _buttonWidth);
    _y = self.view.center.y - (2 * _buttonHeight);
    
    _currentResult = 0;
    _storedResult = 0;
    _currentNumber = 0;
    _storedNumber = 0;
    
    _dotActive = false;
    _negativeActive = false;
    
    _currentOperator = @"";
    _lastOperator = @"";
    
    _count = 1;
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(_x, _y - _buttonHeight * 1.3, _buttonWidth * 4, _buttonHeight * 1.3)];
    label.tag = 1;
    label.backgroundColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont boldSystemFontOfSize:40.0f];
    label.textColor = [UIColor whiteColor];
    
    CalculatorButton* ac = [[CalculatorButton alloc] initWithFrame:CGRectMake(_x, _y, _buttonWidth, _buttonHeight) andOperation:@"ac" andImageName:@"ac.png"];
    CalculatorButton* negative = [[CalculatorButton alloc] initWithFrame:CGRectMake(ac.frame.origin.x + ac.frame.size.width, _y, _buttonWidth, _buttonHeight) andOperation:@"+/-" andImageName:@"negative.png"];
    CalculatorButton* percent = [[CalculatorButton alloc] initWithFrame:CGRectMake(negative.frame.origin.x + negative.frame.size.width, _y, _buttonWidth, _buttonHeight) andOperation:@"%" andImageName:@"percent.png"];
    CalculatorButton* divide = [[CalculatorButton alloc] initWithFrame:CGRectMake(percent.frame.origin.x + percent.frame.size.width, _y, _buttonWidth, _buttonHeight) andOperation:@"/" andImageName:@"divide.png"];
    
    CalculatorButton* number7 = [[CalculatorButton alloc] initWithFrame:CGRectMake(_x, ac.frame.origin.y + ac.frame.size.height, _buttonWidth, _buttonHeight) andValue:7 andImageName:@"number7.png"];
    CalculatorButton* number8 = [[CalculatorButton alloc] initWithFrame:CGRectMake(number7.frame.origin.x + number7.frame.size.width, number7.frame.origin.y, _buttonWidth, _buttonHeight) andValue:8 andImageName:@"number8.png"];
    CalculatorButton* number9 = [[CalculatorButton alloc] initWithFrame:CGRectMake(number8.frame.origin.x + number8.frame.size.width, number7.frame.origin.y, _buttonWidth, _buttonHeight) andValue:9 andImageName:@"number9.png"];
    CalculatorButton* multiple = [[CalculatorButton alloc] initWithFrame:CGRectMake(number9.frame.origin.x + number9.frame.size.width, number7.frame.origin.y, _buttonWidth, _buttonHeight) andOperation:@"x" andImageName:@"multiple.png"];
    
    CalculatorButton* number4 = [[CalculatorButton alloc] initWithFrame:CGRectMake(_x, number7.frame.origin.y + number7.frame.size.height, _buttonWidth, _buttonHeight) andValue:4 andImageName:@"number4.png"];
    CalculatorButton* number5 = [[CalculatorButton alloc] initWithFrame:CGRectMake(number4.frame.origin.x + number4.frame.size.width, number4.frame.origin.y, _buttonWidth, _buttonHeight) andValue:5 andImageName:@"number5.png"];
    CalculatorButton* number6 = [[CalculatorButton alloc] initWithFrame:CGRectMake(number5.frame.origin.x + number5.frame.size.width, number4.frame.origin.y, _buttonWidth, _buttonHeight) andValue:6 andImageName:@"number6.png"];
    CalculatorButton* minus = [[CalculatorButton alloc] initWithFrame:CGRectMake(number6.frame.origin.x + number6.frame.size.width, number4.frame.origin.y, _buttonWidth, _buttonHeight) andOperation:@"-" andImageName:@"minus.png"];
    
    CalculatorButton* number1 = [[CalculatorButton alloc] initWithFrame:CGRectMake(_x, number4.frame.origin.y + number4.frame.size.height, _buttonWidth, _buttonHeight) andValue:1 andImageName:@"number1.png"];
    CalculatorButton* number2 = [[CalculatorButton alloc] initWithFrame:CGRectMake(number1.frame.origin.x + number1.frame.size.width, number1.frame.origin.y, _buttonWidth, _buttonHeight) andValue:2 andImageName:@"number2.png"];
    CalculatorButton* number3 = [[CalculatorButton alloc] initWithFrame:CGRectMake(number2.frame.origin.x + number2.frame.size.width, number1.frame.origin.y, _buttonWidth, _buttonHeight) andValue:3 andImageName:@"number3.png"];
    CalculatorButton* plus = [[CalculatorButton alloc] initWithFrame:CGRectMake(number3.frame.origin.x + number3.frame.size.width, number1.frame.origin.y, _buttonWidth, _buttonHeight) andOperation:@"+" andImageName:@"plus.png"];
    
    CalculatorButton* number0 = [[CalculatorButton alloc] initWithFrame:CGRectMake(_x, number1.frame.origin.y + number1.frame.size.height, number1.frame.size.width + number2.frame.size.width, _buttonHeight) andValue:0 andImageName:@"number0.png"];
    CalculatorButton* dot = [[CalculatorButton alloc] initWithFrame:CGRectMake(number0.frame.origin.x + number0.frame.size.width, number0.frame.origin.y, _buttonWidth, _buttonHeight) andOperation:@"." andImageName:@"dot.png"];
    CalculatorButton* equal = [[CalculatorButton alloc] initWithFrame:CGRectMake(dot.frame.origin.x + dot.frame.size.width, number0.frame.origin.y, _buttonWidth, _buttonHeight) andOperation:@"=" andImageName:@"equal.png"];
    
    [number0 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number1 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number2 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number3 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number4 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number5 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number6 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number7 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number8 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    [number9 addTarget:self action:@selector(pushNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    [ac addTarget:self action:@selector(clearValue) forControlEvents:UIControlEventTouchUpInside];
    [plus addTarget:self action:@selector(performAction:) forControlEvents:UIControlEventTouchUpInside];
    [minus addTarget:self action:@selector(performAction:) forControlEvents:UIControlEventTouchUpInside];
    [multiple addTarget:self action:@selector(performAction:) forControlEvents:UIControlEventTouchUpInside];
    [divide addTarget:self action:@selector(performAction:) forControlEvents:UIControlEventTouchUpInside];
    [equal addTarget:self action:@selector(performAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [negative addTarget:self action:@selector(negativeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [percent addTarget:self action:@selector(percentAction:) forControlEvents:UIControlEventTouchUpInside];

    [dot addTarget:self action:@selector(dotAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:label];
    
    [self.view addSubview:ac];
    [self.view addSubview:negative];
    [self.view addSubview:percent];
    [self.view addSubview:divide];
    
    [self.view addSubview:number7];
    [self.view addSubview:number8];
    [self.view addSubview:number9];
    [self.view addSubview:multiple];
    
    [self.view addSubview:number4];
    [self.view addSubview:number5];
    [self.view addSubview:number6];
    [self.view addSubview:minus];
    
    [self.view addSubview:number1];
    [self.view addSubview:number2];
    [self.view addSubview:number3];
    [self.view addSubview:plus];
    
    [self.view addSubview:number0];
    [self.view addSubview:dot];
    [self.view addSubview:equal];
}

- (IBAction)pushNumber:(id)sender {
    CalculatorButton* button = (CalculatorButton*) sender;
    
    if([_currentOperator isEqual:@"="]) {
        [self clearValue];
    }
    
    if(_dotActive) {
        if(_currentNumber == 0) {
            _count = 1;
        }
        _currentNumber = _currentNumber + (float)button.value / [self powerX:10 withY:_count];
        _count++;
    }
    else {
        _currentNumber = _currentNumber * 10 + button.value;
        _count = 1;
    }
    
    [self showValue:_currentNumber];
    
}

- (void)pushResult {
    if([_lastOperator isEqual:@""]) {
        _currentResult = _storedNumber;
    }
    if([_lastOperator isEqual:@"+"]) {
        _currentResult = _storedResult + _storedNumber;
    }
    if([_lastOperator isEqual:@"-"]) {
        _currentResult = _storedResult - _storedNumber;
    }
    if([_lastOperator isEqual:@"x"]) {
        _currentResult = _storedResult * _storedNumber;
    }
    if([_lastOperator isEqual:@"/"]) {
        _currentResult = _storedResult / _storedNumber;
    }
    
    _storedResult = _currentResult;
    [self showValue:_currentResult];
}

- (IBAction)performAction:(id)sender {
    CalculatorButton* button = (CalculatorButton*) sender;
    
    _lastOperator = _currentOperator;
    _currentOperator = button.operation;
    
    if([_currentOperator isEqual:@"="] && [_lastOperator isEqual:@"+"]) {
        _currentResult = _storedResult + _currentNumber;
    }
    if([_currentOperator isEqual:@"="] && [_lastOperator isEqual:@"-"]) {
        _currentResult = _storedResult - _currentNumber;
    }
    if([_currentOperator isEqual:@"="] && [_lastOperator isEqual:@"x"]) {
        _currentResult = _storedResult * _currentNumber;
    }
    if([_currentOperator isEqual:@"="] && [_lastOperator isEqual:@"/"]) {
        _currentResult = _storedResult / _currentNumber;
    }
    
    _storedNumber = _currentNumber;
    _currentNumber = 0;
    _dotActive = false;
    [self pushResult];
    
}

- (IBAction)dotAction:(id)sender {
    if(_dotActive) {
        _dotActive = false;
    }
    else {
        _dotActive = true;
    }
}

- (IBAction)negativeAction:(id)sender {
    if([_currentOperator isEqual:@"="]) {
        _currentResult = _currentResult * -1;
        [self showValue:_currentResult];
    }
    else {
        _currentNumber = _currentNumber * -1;
        [self showValue:_currentNumber];
    }
}

- (IBAction)percentAction:(id)sender {
    if([_currentOperator isEqual:@"="]) {
        _currentResult = _currentResult / 100;
        [self showValue:_currentResult];
    }
    else {
        _currentNumber = _currentNumber / 100;
        [self showValue:_currentNumber];
    }
}

- (void)clearValue {
    _currentNumber = 0;
    _currentResult = 0;
    _storedNumber = 0;
    _storedResult = 0;
    _currentOperator = @"";
    _lastOperator = @"";
    _dotActive = false;
    [self showValue:_currentResult];
}

- (void)showValue:(float)value {
    int intValue = (int)value;
    UIView* view = [self.view viewWithTag:1];
    if(view && [view isMemberOfClass:[UILabel class]]) {
        UILabel* label = (UILabel*) view;
        if([self abcX:value - (float)intValue] < 0.0000001) {
            label.text = [NSString stringWithFormat:@"%d", intValue];
        }
        else {
            label.text = [NSString stringWithFormat:@"%.6f", value];
        }
    }
}

- (int)powerX:(int)x withY:(int)y {
    
    int i;
    int result;
    
    result = 1;
    
    for(i = 0; i < y ; i++) {
        result = result * x;
    }
    
    return result;
}

- (float)abcX:(float)x {
    if(x >= 0) {
        return x;
    }
    else {
        return x * -1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
