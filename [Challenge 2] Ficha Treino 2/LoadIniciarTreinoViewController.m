//
//  LoadIniciarTreinoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/4/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "LoadIniciarTreinoViewController.h"
#import "DataStorage.h"
#import "Pessoa.h"

@interface LoadIniciarTreinoViewController ()

@end

@implementation LoadIniciarTreinoViewController

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
	// Do any additional setup after loading the view.
    
    DataStorage *repository = [DataStorage sharedRepository];
    [repository reloadData];
    
    NSArray *pessoas = [repository getPessoas];
    Pessoa *user = pessoas[0];
    
    if ([user.fichas count] != 0) {
        self.view.hidden = YES;
        [self performSegueWithIdentifier:@"fichaAtiva" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end