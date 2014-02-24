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

- (void)desenharGraficoDeLinhaComContexto:(CGContextRef)ctx
{
    
    float data[] = {0.0f,0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};
    
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    
    int maxGraphHeight = kGraphHeight - kOffsetY;
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * data[0]);
    
    for (int i = 1; i < sizeof(data); i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * data[i]);
    }
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //desenhar pontos sobre os dados
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
}

-(void)desenharPontosSobreOsDadosComContexto:(CGContextRef)ctx
{
    float data[] = {0.0f,0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};
   
    int maxGraphHeight = kGraphHeight - kOffsetY;
    
    for (int i = 1; i < sizeof(data) - 1; i++)
    {
        
        float x = kOffsetX + i * kStepX;
        float y = kGraphHeight - maxGraphHeight * data[i];
        CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
        CGContextAddEllipseInRect(ctx, rect);
    }
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //adiciona contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //float data[] = {0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};
    
    [self desenharGraficoDeLinhaComContexto:context];
    [self desenharPontosSobreOsDadosComContexto:context];
    [self preencherAreaSobreGraficoComContexto:context];
    [self desenharLinhasGuiaComContexto:context];
    [self colocarIdentificadoresVerticalComContexto:context];
}

-(void)preencherAreaSobreGraficoComContexto:(CGContextRef)ctx
{
    
    float data[] = {0.0f,0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};
    
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:0.5] CGColor]);
    
    int maxGraphHeight = kGraphHeight - kOffsetY;
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight);
    CGContextAddLineToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * data[0]);
    for (int i = 1; i < sizeof(data); i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * data[i]);
    }
    CGContextAddLineToPoint(ctx, kOffsetX + (sizeof(data) - 1) * kStepX, kGraphHeight);
    
    CGContextClosePath(ctx);
    
    
    CGContextDrawPath(ctx, kCGPathFill);
}


-(void)preencherAreaSobreGraficoComGradienteComContexto:(CGContextRef)ctx
{
    [self preencherAreaSobreGraficoComGradienteComContexto:ctx];
    
    CGGradientRef gradient;
    CGColorSpaceRef colorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.5, 0.0, 0.2,  // Start color
        1.0, 0.5, 0.0, 1.0}; // End color
    colorspace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, num_locations);
    
    CGPoint startPoint, endPoint;
    startPoint.x = kOffsetX;
    startPoint.y = kGraphHeight;
    endPoint.x = kOffsetX;
    endPoint.y = kOffsetY;
}

-(void)desenharLinhasGuiaComContexto:(CGContextRef)context
{
    
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

-(void)colocarIdentificadoresHorizontaisComContexto:(CGContextRef)context
{
    float data[] = {0.0f,0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};
    
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    
    CGContextSetTextMatrix(context, CGAffineTransformRotate(CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0), M_PI / 2));
    
    
    CGContextConcatCTM(context, flipVertical);  

    for (int i = 1; i < sizeof(data); i++)
    {
        
        NSString *theText = [NSString stringWithFormat:@"%d", i];
        CGContextShowTextAtPoint(context, kOffsetX + i * kStepX, kGraphBottom - 5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
}

-(void)colocarIdentificadoresVerticalComContexto:(CGContextRef)context
{
    float data[] = {0.0,50.0, 100.0, 150.0, 200.0, 250.0, 300.0};
    
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));//CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    
    CGContextSetTextMatrix(context, CGAffineTransformRotate(CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0), M_PI / 2));
    

    for (int i = 0; i < sizeof(data); i++)
    {
        NSString *theText = [NSString stringWithFormat:@"%f", data[i]];
        CGContextShowTextAtPoint(context, kOffsetX + i * kStepX, kGraphBottom -5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
