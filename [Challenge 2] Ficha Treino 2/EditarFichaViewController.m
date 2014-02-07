//
//  EditarFichaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/7/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "EditarFichaViewController.h"

@interface EditarFichaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *frequenciaTextField;
@property (weak, nonatomic) IBOutlet UITextField *intervaloTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *objetivoSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *periodoTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *periodoSegmentedControl;

@property (nonatomic) NSInteger frequencia;
@property (nonatomic) NSInteger intervalo;
@property (nonatomic) NSInteger objetivo;
@property (nonatomic) NSInteger periodoQuantidade;
@property (nonatomic) NSInteger periodoTipo;


@end

@implementation EditarFichaViewController

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
    
    self.frequenciaTextField.text = [NSString stringWithFormat:@"%@", self.ficha.frequencia];
    self.intervaloTextField.text = [NSString stringWithFormat:@"%@", self.ficha.intervalo];
    self.objetivoSegmentedControl.selectedSegmentIndex = [self.ficha.objetivo integerValue];
    self.periodoTextField.text = [NSString stringWithFormat:@"%@", self.ficha.periodoQuantidade];
    self.periodoSegmentedControl.selectedSegmentIndex = [self.ficha.periodoTipo integerValue];
    
    self.frequencia = [self.ficha.frequencia integerValue];
    self.intervalo = [self.ficha.intervalo integerValue];
    self.objetivo = [self.ficha.objetivo integerValue];
    self.periodoQuantidade = [self.ficha.periodoQuantidade integerValue];
    self.periodoTipo = [self.ficha.periodoTipo integerValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editFrequencia:(UITextField *)sender {
    self.frequencia = [sender.text integerValue];
}

- (IBAction)editIntervalo:(UITextField *)sender {
    self.intervalo = [sender.text integerValue];
}

- (IBAction)editObjetivo:(UISegmentedControl *)sender {
    self.objetivo = sender.selectedSegmentIndex;
}

- (IBAction)editPeriodoQuantidade:(UITextField *)sender {
    self.periodoQuantidade = [sender.text integerValue];
}

- (IBAction)editPeriodoTipo:(UISegmentedControl *)sender {
    self.periodoTipo = sender.selectedSegmentIndex;
}

- (IBAction)editFicha:(UIButton *)sender {
    [self.ficha editFichaFrequencia:self.frequencia editIntervalo:self.intervalo editObjetivo:self.objetivo editPeriodoQuantidade:self.periodoQuantidade editPeriodoTipo:self.periodoTipo];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
