//
//  UIColor+Hex.h
//  ProjectSample
//
//  Created by Windy on 2016/12/20.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(CGFloat)alpha;
+ (UIColor*)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha;

@end
