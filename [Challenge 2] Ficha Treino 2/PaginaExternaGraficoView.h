//
//  PaginaExternaGraficoView.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 26/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaginaExternaGraficoView : UIView

@property (strong, nonatomic)UIScrollView *scrollView;

-(void)deleteTextoComContexto:(CGContextRef) context;
-(void)deleteTexto;
-(void)ajustarScrollView:(UIInterfaceOrientation)orientation comBounds:(CGRect)bounds;

@end
