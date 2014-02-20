//
//  GraficoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 20/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GraficoViewController.h"
#import "AcompanhamentoFisicoViewController.h"
#import "GraphView.h"

@interface GraficoViewController ()

@end

@implementation GraficoViewController
@synthesize scroller;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
