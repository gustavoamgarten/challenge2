//
//  MedidasGraficoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 26/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "MedidasGraficoViewController.h"
#import "GraphView.h"
#import "PaginaExternaGraficoView.h"

@interface MedidasGraficoViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet PaginaExternaGraficoView *paginaExterna;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewExterno;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewInterno;

@end

@implementation MedidasGraficoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"\r\nViewRotate: %d",toInterfaceOrientation);
    switch (toInterfaceOrientation)
    {
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            break;
            
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        default:
            break;
    }
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self ajustarLayoutDosComponentes];
}
-(void)ajustarLayoutDosComponentes
{
    
    CGRect frameAtual = self.view.bounds;
    NSLog(@"\r\nFrame view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    frameAtual = self.scrollViewInterno.bounds;
    NSLog(@"\r\nScrollInterno view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    frameAtual = self.scrollViewExterno.bounds;
    NSLog(@"\r\nScrollExterno view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    
    CGSize sizeAtual = self.scrollViewExterno.contentSize;
    NSLog(@"\r\nScrollExterno Content: Size(%f,%f)",sizeAtual.height,sizeAtual.width);
    
    sizeAtual = self.paginaExterna.frame.size;
    NSLog(@"\r\nPaginaExterno Content: Size(%f,%f)",sizeAtual.height,sizeAtual.width);
    
    
    
    //CGRect
    frameAtual = self.view.bounds;
    NSLog(@"\r\nView total view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    
    int distanciaBordaHorizontal = 20;
    int distanciaBordaVertical = 8;
    //regular o tamanho do scrollview interno
    [self.scrollViewExterno setFrame:CGRectMake(self.scrollViewExterno.frame.origin.x, self.scrollViewExterno.frame.origin.y, self.view.frame.size.width - (distanciaBordaHorizontal*2), self.view.frame.size.height -(distanciaBordaVertical*2))];
    
    distanciaBordaHorizontal = 35;
    distanciaBordaVertical = 0;
    //regular o tamanho do scrollview interno
    [self.scrollViewInterno setFrame:CGRectMake(self.scrollViewInterno.frame.origin.x, self.scrollViewInterno.frame.origin.y, self.scrollViewExterno.frame.size.width - (distanciaBordaHorizontal*2), self.scrollViewInterno.frame.size.height-(distanciaBordaVertical*2))];
    
    //regular o content do scroll view externo(quadrado de informação disponível)
    self.scrollViewExterno.contentSize = CGSizeMake( self.scrollViewExterno.frame.size.width, self.paginaExterna.frame.size.height);
    
    
    
    frameAtual = self.view.bounds;
    NSLog(@"\r\nPOST Frame view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    frameAtual = self.scrollViewInterno.bounds;
    NSLog(@"\r\nPOST ScrollInterno view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    frameAtual = self.scrollViewExterno.bounds;
    NSLog(@"\r\nPOST ScrollExterno view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
    
    sizeAtual = self.scrollViewExterno.contentSize;
    NSLog(@"\r\nPOST ScrollExterno Content: Size(%f,%f)",sizeAtual.height,sizeAtual.width);
    
    sizeAtual = self.paginaExterna.frame.size;
    NSLog(@"\r\nPOST PaginaExterno Content: Size(%f,%f)",sizeAtual.height,sizeAtual.width);
    
    
    //CGRect
    frameAtual = self.view.bounds;
    NSLog(@"\r\nPOST View total view: origin(%f,%f) frame:(%f,%f)",frameAtual.origin.x,frameAtual.origin.y,frameAtual.size.height,frameAtual.size.width);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.paginaExterna.scrollView = self.scrollViewInterno;
    [self.scrollViewExterno setBackgroundColor:[UIColor whiteColor]];
    self.scrollViewExterno.contentSize = self.paginaExterna.frame.size;
    
    self.scrollViewExterno.delegate = self;
    
    [self ajustarLayoutDosComponentes];
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
