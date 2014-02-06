//
//  LoadUserViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "LoadUserViewController.h"
#import "DataStorage.h"

@interface LoadUserViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation LoadUserViewController

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
    
    //    NSDate *currentDate = [NSDate date];
    //    [self.datePicker setMaximumDate:currentDate];
    //    CGAffineTransform s0 = CGAffineTransformMakeScale(0.5, 0.5);
    //    self.datePicker.transform = s0;
    
    [[DataStorage sharedRepository] reloadData];
    NSArray *pessoas = [[DataStorage sharedRepository] getPessoas];
    if ([pessoas count] > 0) {
        self.view.hidden = YES;
    } else {
        NSLog(@"Iniciar adicao de Exercicios Padrao");
        //Adiciona os exercícios padrão no banco de dados na primeira vez que o usuário utiliza o aplicativo.
        // Categoria 1 = Abdominal
        // Categoria 2 = Biceps
        // Categoria 3 = Costas
        // Categoria 4 = Peito
        // Categoria 5 = Perna
        // Categoria 6 = Triceps
        // Categoria 7 = Ombro
        [[DataStorage sharedRepository]addExercicioPadrao:@"Elevacao de Pernas" comCategoria:1];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Frontal" comCategoria:1];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Bike" comCategoria:1];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Com Inversão" comCategoria:1];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Rosca Inversa" comCategoria:2];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Rosca Concentrada" comCategoria:2];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Rosca Martelo" comCategoria:2];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Rosca Direta" comCategoria:2];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Rosca Alternada" comCategoria:2];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Remada Unilateral" comCategoria:3];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Puxada na Frente com Triângulo e Polia Alta" comCategoria:3];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Puxada na Frente com Polia Alta" comCategoria:3];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Puxada Alta com Braços Estendidos" comCategoria:3];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Crucifixo (ou Fly)" comCategoria:4];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Crossover (ou Pulley Cruzado)" comCategoria:4];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Supino Inclinado" comCategoria:4];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Supino Reto" comCategoria:4];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Cadeira Abdutora" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Cadeira Adutora" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Leg Press Horizontal" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Leg Press Inclinado" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Panturrilha em pé" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Panturrilha máquina" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Cadeira Flexora" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Cadeira Extensora" comCategoria:5];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Francês" comCategoria:6];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Kick Back" comCategoria:6];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Corda" comCategoria:6];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Pulley" comCategoria:6];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Testa" comCategoria:6];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Maquina" comCategoria:6];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Remada Alta" comCategoria:7];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Desenvolvimento com Halteres" comCategoria:7];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Elevação Frontal" comCategoria:7];
        [[DataStorage sharedRepository]addExercicioPadrao:@"Elevação Lateral" comCategoria:7];
    }
    
    [[DataStorage sharedRepository] reloadData];
    NSLog(@"Exercicios Padrao: %d", [[[DataStorage sharedRepository] getFichasDeExercicioPadrao] count]);

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DataStorage *repository = [DataStorage sharedRepository];
    [repository reloadData];
    
    NSArray *pessoas = [repository getPessoas];
    
    NSLog(@"pessoas: %d", [pessoas count]);
    
    if ([pessoas count] > 0) {
        NSLog(@"Aqui");
        [self performSegueWithIdentifier:@"comFicha" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)iniciarCadastro:(UIButton *)sender {
    [self performSegueWithIdentifier:@"iniciarCadastro" sender:self];
}

@end
