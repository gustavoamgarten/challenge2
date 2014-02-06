//
//  AddExercicioViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddExercicioViewController.h"
#import "FinishAddExercicioViewController.h"

@interface AddExercicioViewController () <UITableViewDataSource>

@property (nonatomic) NSInteger numRows;
@property (nonatomic) Exerciciopadrao *exercicioPadrao;

@end

@implementation AddExercicioViewController

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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [[DataStorage sharedRepository] reloadData];
    self.numRows = [[[DataStorage sharedRepository] getFichasDeExercicioPadrao] count];
    return self.numRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addExercicioCell"];
    NSArray *exerciciosPadrao = [[DataStorage sharedRepository] getFichasDeExercicioPadrao];
    Exerciciopadrao *exPadrao = [exerciciosPadrao objectAtIndex:indexPath.row];
    
    float laranjaRed = 238/255;
    float laranjaGreen = 155/255;
    float laranjaBlue = 17/255;
    
    cell.textLabel.textColor = [UIColor colorWithRed:0.1137f green:0.3960f blue:0.4862f alpha:1];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:laranjaRed green:laranjaGreen blue:laranjaBlue alpha:1];
    cell.textLabel.text = exPadrao.nome;
    
    // Categoria 1 = Abdominal
    // Categoria 2 = Biceps
    // Categoria 3 = Costas
    // Categoria 4 = Peito
    // Categoria 5 = Perna
    // Categoria 6 = Triceps
    // Categoria 7 = Ombro
    // 238 255 17
    
    NSInteger cat = [exPadrao.categoria integerValue];
    
    switch (cat) {
        case 1:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Abdominal"];
            break;
        case 2:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Biceps"];
            break;
        case 3:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Costas"];
            break;
        case 4:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Peito"];
            break;
        case 5:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Perna"];
            break;
        case 6:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Triceps"];
            break;
        case 7:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Ombro"];
            break;
        default:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Outro"];
            break;
    }
    
//    if (indexPath.row % 2 == 0) {
//        cell.backgroundColor = [UIColor colorWithRed:0.1137f green:0.3960f blue:0.4862f alpha:1];
//    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *exerciciosPadrao = [[DataStorage sharedRepository] getFichasDeExercicioPadrao];
    Exerciciopadrao *exPadrao = [exerciciosPadrao objectAtIndex:indexPath.row];
    
    self.exercicioPadrao = exPadrao;
    NSLog(@"exercicioPadraoPassado: %@", self.exercicioPadrao);
    [self performSegueWithIdentifier:@"escolheuExercicio" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"escolheuExercicio"]) {
        FinishAddExercicioViewController *destController = segue.destinationViewController;
        destController.treinoViewController = self.treinoViewController;
        destController.exercicioPadrao = self.exercicioPadrao;
        destController.exercicios = self.exercicios;
    }
}

@end
