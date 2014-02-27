//
//  GraphView.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 20/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GraphView.h"
@interface GraphView()
@property (nonatomic,strong)NSMutableArray *data;
@end

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)desenharGraficoDeLinhaComContexto:(CGContextRef)ctx comDados:(NSArray*)data
{
    NSArray *dado = [self arrayVetorizadosComDados:data];
    
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    
    //int maxGraphHeight = kGraphHeight - kOffsetY;
    int maxGraphHeight = kGraphHeight - kOffsetY - kGraphTop;
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * [dado[0] floatValue]);
    
    for (int i = 1; i < dado.count; i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * [dado[i] floatValue]);
    }
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //desenhar pontos sobre os dados
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
}

-(void)desenharPontosSobreOsDadosComContexto:(CGContextRef)ctx comDados:(NSArray*)data
{
    NSArray *dado = [self arrayVetorizadosComDados:data];
    //int maxGraphHeight = kGraphHeight - kOffsetY;
    int maxGraphHeight = kGraphHeight - kOffsetY - kGraphTop;
    
    for (int i = 1; i < dado.count - 1; i++)
    {
        
        float x = kOffsetX + i * kStepX;
        float y = kGraphHeight - maxGraphHeight * [dado[i] floatValue];
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
    
    self.data = [[NSMutableArray alloc]initWithObjects: [NSNumber numberWithFloat:119.3],
                                                        [NSNumber numberWithFloat:103.7],
                                                        [NSNumber numberWithFloat:98.4],
                                                        [NSNumber numberWithFloat:95.88],
                                                        [NSNumber numberWithFloat:92.85],
                                                        [NSNumber numberWithFloat:90.2],
                                                        [NSNumber numberWithFloat:87.85],
                                                        [NSNumber numberWithFloat:86.11],
                                                        [NSNumber numberWithFloat:85.75],
                                                        [NSNumber numberWithFloat:88.53],
                                                        [NSNumber numberWithFloat:89.44],
                                                        [NSNumber numberWithFloat:92.88],
                                                        [NSNumber numberWithFloat:85.77],
                                                        [NSNumber numberWithFloat:82.85],
                                                        [NSNumber numberWithFloat:78.55],
                                                        nil];
    
    [self desenharGraficoDeLinhaComContexto:context comDados:self.data];
    [self desenharPontosSobreOsDadosComContexto:context comDados:self.data];
    [self preencherAreaSobreGraficoComContexto:context comDados:self.data];
    [self desenharLinhasGuiaComContexto:context];
    //[self colocarIdentificadoresVerticalComContexto:context comDados:self.data];
    //[self colocarIdentificadoresHorizontaisComContexto:context comDados:self.data];
}

-(void)preencherAreaSobreGraficoComContexto:(CGContextRef)ctx comDados:(NSArray*)data
{
    
    //float data[] = {0.0f,0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};
    
    NSArray *dado = [self arrayVetorizadosComDados:data];
    
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:0.5] CGColor]);
    
    //int maxGraphHeight = kGraphHeight - kOffsetY;
    int maxGraphHeight = kGraphHeight - kOffsetY - kGraphTop;
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight);
    CGContextAddLineToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * [dado[0] floatValue]);
    for (int i = 1; i < dado.count; i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * [dado[i] floatValue]);
    }
    CGContextAddLineToPoint(ctx, kOffsetX + (dado.count - 1) * kStepX, kGraphHeight);
    
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
    //int qtdLinhasGuiaY = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    int qtdLinhasGuiaY = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    //desenhar linhas-guia no eixo Y
    for (int i = 0; i <= qtdLinhasGuiaY; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom - (kOffsetY *0) - i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - (kOffsetY*0) - i * kStepY);
    }
    
    //comit desenhos
    CGContextStrokePath(context);
    // Remove os dash
    CGContextSetLineDash(context, 0, NULL, 0);
}

-(void)colocarIdentificadoresHorizontaisComContexto:(CGContextRef)context comDados:(NSArray*)data
{
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    
    CGContextSetTextMatrix(context, CGAffineTransformRotate(CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0), M_PI / 2));
    
    
    //CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, self.frame.size.height);
    //CGContextConcatCTM(context, flipVertical);

    for (int i = 1; i < data.count; i++)
    {
        
        NSString *theText = [NSString stringWithFormat:@"%d", i];
        CGContextShowTextAtPoint(context, kOffsetX + i * kStepX, kGraphBottom - 5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
}

-(float)maiorValorNosDados:(NSArray*)data
{
    float maiorValor = 0;
    
    if([data count]>0)
    {
        maiorValor = [data[0] floatValue];
    }
    
    for (int i=0; i<data.count; i++)
    {
        if(maiorValor < [data[i] floatValue])
            maiorValor = [data[i] floatValue];
    }
    
    return maiorValor;
}

-(float)menorValorNosDados:(NSArray*)data
{
    float menorValor = 0;
    
    if([data count]>0)
    {
        menorValor = [data[0] floatValue];
    }
    
    for (int i=0; i<data.count; i++)
    {
        if (menorValor > [data[i] floatValue])
            menorValor = [data[i] floatValue];
    }
    
    return menorValor;
}

-(void)colocarIdentificadoresVerticalComContexto:(CGContextRef)context comDados:(NSArray*)data
{
    float maiorValorY = 0;
    float menorValorY = 0;
    float variacaoEmY = 0;
    
    if([data count]>0)
    {
        maiorValorY = [data[0] floatValue];
        menorValorY = maiorValorY;
    }
    
    for (int i=0; i<data.count; i++)
    {
        if(maiorValorY < [data[i] floatValue])
            maiorValorY = [data[i] floatValue];
        if (menorValorY > [data[i] floatValue])
            menorValorY = [data[i] floatValue];
        
        NSLog(@"\r\nData:%f\r\nMaior:%f\r\nMenor:%f",[data[i] floatValue],maiorValorY,menorValorY);
        
    }
    
    variacaoEmY = maiorValorY;
    
    NSMutableArray *valoresEixoY = [[NSMutableArray alloc]init];
    
    //int maxGraphHeight = kGraphHeight - kOffsetY;
    int maxGraphHeight = kGraphHeight - kOffsetY - kGraphTop;
    
    float stepValoresY = (variacaoEmY/((maxGraphHeight)/kStepY));
    
    NSLog(@"step size:%d",((maxGraphHeight)/kStepY));
    for (int i = 0; i<=((maxGraphHeight)/kStepY); i++)
    {
        [valoresEixoY addObject:[NSNumber numberWithFloat:(stepValoresY * i)]];
    }
    
    if(valoresEixoY.count > 0)
    {
        valoresEixoY[[valoresEixoY count] -1] = [NSNumber numberWithFloat:maiorValorY];
    }
    
    CGContextSetTextMatrix(context,CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    
    //CGContextSetTextMatrix(context, CGAffineTransformRotate(CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0), M_PI / 2));
    
    
    
    //CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, self.frame.size.height);
    //CGContextConcatCTM(context, flipVertical);

    //for (int i = 0; i < sizeof(data); i++)
    for (int i = 0; i < valoresEixoY.count; i++)
    {
        //NSLog(@"%f",[valoresEixoY[i] floatValue]);
        NSString *theText = [NSString stringWithFormat:@"%03.1f", [valoresEixoY[i] floatValue]];
        CGContextShowTextAtPoint(context, 0+5, kGraphHeight -(3+ i * kStepY), [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
}

-(NSArray*)arrayVetorizadosComDados:(NSArray*)data
{
    float maiorValor = [self maiorValorNosDados:data];
    NSMutableArray* retorno = [[NSMutableArray alloc]init];
    
    for (int i =0; i<data.count; i++)
    {
        [retorno addObject:[NSNumber numberWithFloat:([data[i] floatValue]/maiorValor)]];
    }
    
    return retorno;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
