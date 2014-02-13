//
//  KeyboardAnimation.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 07/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyboardAnimation : NSObject

+(void)textFieldDidBeginEditing:(UITextField *)textField from:(UIViewController*) viewController;
+(void)textFieldDidEndedEditing:(UITextField *)textField from:(UIViewController*) viewController;
+(void)textFieldViewReset:(UIViewController*) viewController;
@end
