//
//  UIBarButtonItem+Util.m
//  safe
//
//  Created by iCooliean on 14/12/31.
//  Copyright (c) 2014年 iCooliean. All rights reserved.
//

#import "UIBarButtonItem+Util.h"
#import <objc/runtime.h>
int const BUTTON_HEIGHT = 30;
@implementation UIBarButtonItem (Util)
+(UIBarButtonItem *)createBarButton:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.text = title;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0,0,BUTTON_HEIGHT,BUTTON_HEIGHT);
    //    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    //[self.navigationController.navigationBar addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+(UIBarButtonItem *)createBarImageButton:(UIImage *)image target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0,0,BUTTON_HEIGHT,BUTTON_HEIGHT);
    //    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    //[self.navigationController.navigationBar addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+(UIBarButtonItem *)createBarBackImageButton:(UIImage *)image target:(id)target{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    objc_setAssociatedObject(button, "UINavigationController", target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [button addTarget:self action:@selector(selAction) forControlEvents:UIControlEventTouchUpInside];
//    [button performSelector:@selector(backAction:withNav:) withObject:self withObject:target];
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0,0,BUTTON_HEIGHT,BUTTON_HEIGHT);
    //    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    //[self.navigationController.navigationBar addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+(UIBarButtonItem *)createBarBackImageButton:(id)target{
    return [self createBarBackImageButton:[UIImage imageNamed:@"TopNavigationBack"] target:target];
}
+(void)backAction:(UIButton *)sender{
    id first = objc_getAssociatedObject(sender, "UINavigationController");
    UINavigationController *navi = (UINavigationController *)first;
    [navi popViewControllerAnimated:YES];
}
@end
