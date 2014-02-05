//
//  CriarFichaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "CriarFichaViewController.h"
#import "Pessoa.h"
#import "DataStorage.h"

@interface CriarFichaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *frequenciaTextField;
@property (weak, nonatomic) IBOutlet UITextField *intervaloTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *objetivoSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *periodoTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *periodoTipoSegmentedControl;

@end

@implementation CriarFichaViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)criarFicha:(UIButton *)sender {
    [[DataStorage sharedRepository] reloadData];
    NSArray *pessoas = [[DataStorage sharedRepository] getPessoas];
    Pessoa *usuario = pessoas[0];
    
    [usuario addFichaComObjetivo:self.objetivoSegmentedControl.selectedSegmentIndex comFrequencia:[self.frequenciaTextField.text integerValue] comPeriodoQuantidade:[self.periodoTextField.text integerValue] comPeriodoTipo:self.periodoTipoSegmentedControl.selectedSegmentIndex comIntervalo:[self.intervaloTextField.text integerValue]];
    
    [self performSegueWithIdentifier:@"fichaCriada" sender:self];
}

@end
