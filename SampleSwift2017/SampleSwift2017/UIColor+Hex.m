//
//  UIColor+Hex.m
//  ProjectSample
//
//  Created by Windy on 2016/12/20.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((CGFloat)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor*)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha{
    UIColor *color;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                     withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        color = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        // invalid hex string
        color = [UIColor blackColor];
    }
    return color;

}

@end
