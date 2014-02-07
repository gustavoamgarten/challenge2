//
//  KeyboardAnimation.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 07/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "KeyboardAnimation.h"


//tempo de animação para subir a tela
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
//para ser utilizado quando a caixa onde está contido o text field está parcialmente encoberta pelo teclado
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
//informações sobre o tamanho do teclado em pixels
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

CGFloat animatedDistance;

@interface KeyboardAnimation()//:id<UITextFieldDelegate>//()

@end
//animar o view controller para cima quando necessitar do teclado
@implementation KeyboardAnimation
+(void)textFieldDidBeginEditing:(UITextField *)textField from:(UIViewController*) viewController
{
    CGRect textFieldRect =
    [viewController.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [viewController.view.window convertRect:viewController.view.bounds fromView:viewController.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = viewController.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [viewController.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

+(void)textFieldDidEndedEditing:(UITextField *)textField from:(UIViewController*) viewController
{
    CGRect viewFrame = viewController.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [viewController.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}
@end