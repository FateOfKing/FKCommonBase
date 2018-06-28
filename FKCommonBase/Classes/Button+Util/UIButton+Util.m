//
//  UIButton+Util.m
//  firesafe
//
//  Created by iCooliean on 14/9/27.
//  Copyright (c) 2014年 Cooliean. All rights reserved.
//

#import "UIButton+Util.h"
#import <objc/runtime.h>
@implementation UIButton (Util)
-(void)setDisable:(UIColor *)color{
    self.backgroundColor     = color;
    self.enabled             = false;
}
-(void)setEnable:(UIColor *)color{
    self.backgroundColor     = color;
    self.enabled             = true;
}
-(void)setRadius:(float) radius{
    self.layer.cornerRadius  = radius;
    self.layer.masksToBounds = YES;
}
-(void)setBorder:(float)width color:(UIColor *)color{
    self.layer.borderColor   = [color CGColor];
    self.layer.borderWidth   = width;
    self.layer.masksToBounds = YES;
}
-(void)backAction:(UIButton *)sender{
    id first = objc_getAssociatedObject(sender, "first");
    UINavigationController *navi = (UINavigationController *)first;
    [navi popViewControllerAnimated:YES];
}
- (void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)UIControlState{
//    CGSize titleSize = [title sizeWithFont:[UIFont systemFontOfSize:self.titleLabel.font.pointSize]];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    [self setTitle:title forState:UIControlState];
    CGFloat space = self.frame.size.width - titleSize.width - titleSize.height;
    CGFloat imageX = space/2 + (titleSize.width);
    UIImageView *myImage = [[UIImageView alloc]initWithFrame:CGRectMake(imageX+5, (self.frame.size.height-titleSize.height)/2, titleSize.height, titleSize.height)];
    [myImage setContentMode:UIViewContentModeScaleAspectFit];
    [myImage setImage:image];
    [self addSubview:myImage];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0,
                                              -space/2,
                                              0.0,
                                              0.0)];
}
-(void)setArrow{
    [self setImage:[UIImage imageNamed:@"AlbumReadAllArrow"] withTitle:self.currentTitle forState:UIControlStateNormal];
}

-(void)underLine:(NSString *)title{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [self setAttributedTitle:str forState:UIControlStateNormal];
}
@end
