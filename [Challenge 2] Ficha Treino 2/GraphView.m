//
//  GraphView.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 20/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GraphView.h"


@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //adiciona contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //adiciona grid lines
    CGContextSetLineWidth(context, 0.6);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    //Diretivas para fazer linha pontilhada
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(context, 0.0, dash, 2);
    
    //determinar quantidade de linhas-guia no eixo X
    int qtdLinhasGuiaX = (kDefaultGraphWidth - kOffsetX) / kStepX;
    //desenhar linhas-guia no eixo X
    for (int i = 0; i < qtdLinhasGuiaX; i++)
    {
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    //determinar quantidade de linhas-guia no eixo Y
    int qtdLinhasGuiaY = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    //desenhar linhas-guia no eixo Y
    for (int i = 0; i <= qtdLinhasGuiaY; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom - kOffsetY - i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - kOffsetY - i * kStepY);
    }
    
    //comit desenhos
    CGContextStrokePath(context);
    // Remove os dash
    CGContextSetLineDash(context, 0, NULL, 0);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
