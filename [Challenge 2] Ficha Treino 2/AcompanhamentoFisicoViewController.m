//
//  AcompanhamentoFisicoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 14/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AcompanhamentoFisicoViewController.h"
#import "AddMedidasViewController.h"
#import "DataStorage.h"
#import "MedidasGraficoViewController.h"

@interface AcompanhamentoFisicoViewController ()

@end

@implementation AcompanhamentoFisicoViewController

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
    
    //teste adicionar primeira pessoa da lista
    NSArray *pessoas =[[DataStorage sharedRepository]getPessoas];
    
    if(pessoas.count> 0)
        self.pessoaInfo = [[DataStorage sharedRepository]getPessoas][0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)adicionarDadosFisicos:(id)sender
{
    [self performSegueWithIdentifier:@"adicionarDadosFisicos" sender:self];
}

- (IBAction)visualizarDadosFisicos:(id)sender {
    [self performSegueWithIdentifier:@"visualizarDadosFisicos" sender:self];
}



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"adicionarDadosFisicos"])
    {
        AddMedidasViewController *destController = segue.destinationViewController;
    
        destController.pessoaInfo = self.pessoaInfo;
        destController.rootController = self;
    }
    else if([segue.identifier isEqualToString:@"visualizarDadosFisicos"])
    {
        MedidasGraficoViewController *destController = segue.destinationViewController;
        
        destController.rootController = self;
    }
}

@end
