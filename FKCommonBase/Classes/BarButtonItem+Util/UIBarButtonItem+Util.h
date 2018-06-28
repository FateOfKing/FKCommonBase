//
//  UIBarButtonItem+Util.h
//  safe
//
//  Created by iCooliean on 14/12/31.
//  Copyright (c) 2014年 iCooliean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Util)
+(UIBarButtonItem *)createBarImageButton:(UIImage *)image target:(id)target action:(SEL)action;
+(UIBarButtonItem *)createBarButton:(NSString *)title  target:(id)target action:(SEL)action;
+(UIBarButtonItem *)createBarBackImageButton:(id)target;
+(UIBarButtonItem *)createBarBackImageButton:(UIImage *)image target:(id)target;
@end
