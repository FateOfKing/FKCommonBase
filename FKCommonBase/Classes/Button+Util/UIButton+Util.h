//
//  UIButton+Util.h
//  firesafe
//
//  Created by iCooliean on 14/9/27.
//  Copyright (c) 2014年 Cooliean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Util)
-(void)setDisable:(UIColor *)color;
-(void)setEnable:(UIColor *)color;
-(void)setRadius:(float) radius;
-(void)setBorder:(float) width color:(UIColor *)color;
-(void)backAction:(id)sender;
-(void)setArrow;
-(void)underLine:(NSString *)title;
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)UIControlState;
@end
