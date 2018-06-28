//
//  NSObject+KDTool.h
//  iOSKdUser
//
//  Created by WYC on 2018/1/2.
//  Copyright © 2018年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (Tool)




-(NSAttributedString *_Nullable)changeAttributedString:(NSArray *_Nullable)changeStrings attributes:(NSArray *_Nullable)attributes;


+(NSMutableDictionary *_Nonnull)getAttributes:(NSArray *_Nullable)attributes;




+(NSString *_Nonnull)checkStringNull:(id _Nullable )object;

+(BOOL)checkStringIsNull:(id _Nullable )object;




+(NSString *)getDateStringWithDateSince1970:(NSTimeInterval)time format:(NSString *)format;
+(NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format;

+(void)setView:(UIView *)view BordeWidth:(CGFloat)width cornerRadius:(CGFloat)cornerRadius bordeColor:(UIColor *)color maskToBounds:(BOOL)maskToBounds;

@end
