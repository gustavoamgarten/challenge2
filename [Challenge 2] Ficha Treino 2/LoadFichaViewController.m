//
//  LoadFichaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "LoadFichaViewController.h"
#import "DataStorage.h"
#import "Pessoa.h"

@interface LoadFichaViewController ()

@end

@implementation LoadFichaViewController

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
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DataStorage *repository = [DataStorage sharedRepository];
    [repository reloadData];
    
    NSArray *pessoas = [repository getPessoas];
    Pessoa *user = pessoas[0];
    
    if ([user.fichas count] != 0) {
        [self performSegueWithIdentifier:@"fichaAtiva" sender:self];
    }
}

- (IBAction)goCriarFicha:(UIButton *)sender {
    [self performSegueWithIdentifier:@"criarFicha" sender:self];
}

@end

