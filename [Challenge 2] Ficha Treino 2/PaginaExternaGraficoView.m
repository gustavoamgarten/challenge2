//
//  PaginaExternaGraficoView.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 26/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "PaginaExternaGraficoView.h"
#import "GraphView.h"

@interface PaginaExternaGraficoView()

@property(nonatomic,strong)GraphView *graphView;
@property(nonatomic,strong)NSArray* data;
@property(nonatomic)CGContextRef context;
@property(nonatomic)CGRect rect;
@end

@implementation PaginaExternaGraficoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)deleteTextoComContexto:(CGContextRef) context
{
    //CGContextClearRect(self.context, self.frame);
    
    [self colocarIdentificadoresVerticalComContexto:context comDados:self.data];
}

-(void)deleteTexto
{
   // CGContextClearRect(self.context, self.bounds);
   // [self colocarIdentificadoresVerticalComContexto:self.context comDados:self.data];
    CGRect frameAtual = self.bounds;
    //[self.scrollView setFrame:CGRectMake(50, self.scrollView.bounds.origin.y, frameAtual.size.height, frameAtual.size.width)];
    frameAtual = self.scrollView.bounds;
    NSLog(@"\r\nScroll Bounds: o(%f,%f) s(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
}


-(void)ajustarScrollView:(UIInterfaceOrientation)orientation comBounds:(CGRect)bounds
{
    CGRect frameAtual = self.scrollView.bounds;
    
    NSLog(@"\r\nScroll Bounds BEFORE: o(%f,%f) s(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    [self.scrollView setFrame:CGRectMake(50, frameAtual.origin.y+kOffsetY, frameAtual.size.height, bounds.size.width)];
    frameAtual = self.scrollView.bounds;
    NSLog(@"\r\nScroll Bounds AFTER: o(%f,%f) s(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    //[self drawRect:self.rect];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //[super viewWillAppear:animated];
    
    
    //Cria o gráfico
    self.graphView = [[GraphView alloc]init];
    [self.graphView setFrame:CGRectMake(0, 0, kDefaultGraphWidth, kGraphHeight)];
    //ajusta a cor de fundo
    [self.graphView setBackgroundColor:[UIColor whiteColor]];
    
    //adiciona ao scrollview
    self.scrollView.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    [self.scrollView addSubview:self.graphView];
    NSLog(@"\r\nscroll SUBS(%@)",self.scrollView.subviews);//frame.size.height,self.scroller.frame.size.width);
    NSLog(@"\r\nscroll(%f,%f)",self.scrollView.frame.size.height,self.scrollView.frame.size.width);
    NSLog(@"\r\ngraph Content(%f,%f)",self.scrollView.contentSize.height,self.scrollView.contentSize.width);
    
    self.data = [[NSArray alloc]initWithObjects: [NSNumber numberWithFloat:119.3],
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
    
    
    self.context = UIGraphicsGetCurrentContext();
    [self colocarIdentificadoresVerticalComContexto:self.context comDados:self.data];
    self.rect = rect;
    //[self.scrollView setTranslatesAutoresizingMaskIntoConstraints:YES];
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
    int distanciaScroll = self.scrollView.frame.origin.y;
    
    for (int i = 0; i < valoresEixoY.count; i++)
    {
        //NSLog(@"%f",[valoresEixoY[i] floatValue]);
        NSString *theText = [NSString stringWithFormat:@"%03.1f", [valoresEixoY[i] floatValue]];
        CGContextShowTextAtPoint(context, 0+5, kGraphHeight -(3+ i * kStepY) + distanciaScroll, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
}

@end
