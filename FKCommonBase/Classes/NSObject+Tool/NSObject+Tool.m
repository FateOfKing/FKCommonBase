//
//  NSObject+KDTool.m
//  iOSKdUser
//
//  Created by WYC on 2018/1/2.
//  Copyright © 2018年 KD. All rights reserved.
//

#import "NSObject+Tool.h"

@implementation NSObject (Tool)

+(NSString *)checkStringNull:(id)object
{
    if ([object isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    if (object == nil) {
        return @"";
    }
    if ([[NSString stringWithFormat:@"%@",object] isEqualToString:@"null"]) {
        return @"";
    }
    if ([[NSString stringWithFormat:@"%@",object] isEqualToString:@"(null)"]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",object];
    
}
+(BOOL)checkStringIsNull:(id _Nullable )object
{
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if (object == nil) {
        return YES;
    }
    if ([[NSString stringWithFormat:@"%@",object] isEqualToString:@"null"]) {
        return YES;
    }
    if ([[NSString stringWithFormat:@"%@",object] isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([NSString stringWithFormat:@"%@",object].length == 0) {
        return YES;
    }
    return NO;
}




-(NSAttributedString *)changeAttributedString:(NSArray *)rangesArray attributes:(NSArray *)attributes
{
    if (![self isKindOfClass:[NSString class]]) {
        return nil;
    }
    // 设置标签文字
    NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:(NSString *)self];
    
    for (int i = 0; i< rangesArray.count; i++) {
        // 获取标红的位置和长度
        NSRange range = [rangesArray[i] rangeValue];
        // 设置标签文字的属性
        [attrituteString setAttributes:attributes[i] range:range];
    }
    // 显示在Label上
    return attrituteString;
}


// 显示在Label上
+(NSMutableDictionary *)getAttributes:(NSArray *)attributes
{
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (id object in attributes) {
        if ([object isKindOfClass:[UIColor class]]) {
            [mutableDic setObject:object forKey:NSForegroundColorAttributeName];
        }
        if ([object isKindOfClass:[UIFont class]]) {
            [mutableDic setObject:object forKey:NSFontAttributeName];
        }
    }
    return mutableDic;
}




+(NSString *)getDateStringWithDateSince1970:(NSTimeInterval)time format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time/1000.000];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    [formatDate setDateFormat:format];
    return [formatDate stringFromDate:date];
}

+(NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format
{
    
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    [formatDate setDateFormat:format];
    return [formatDate stringFromDate:date];
}

+(void)setView:(UIView *)view BordeWidth:(CGFloat)width cornerRadius:(CGFloat)cornerRadius bordeColor:(UIColor *)color maskToBounds:(BOOL)maskToBounds
{
    view.layer.borderWidth = width;
    view.layer.cornerRadius = cornerRadius;
    view.layer.borderColor = color.CGColor;
    view.layer.masksToBounds = maskToBounds;
}
@end
