//
//  UIImage-Alpha.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Alpha)

- (NSData *)ARGBData;
- (BOOL)isPointTransparent:(CGPoint)point;

@end
