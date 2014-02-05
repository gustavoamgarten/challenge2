//
//  FichaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 1/28/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "FichaViewController.h"
#import "Pessoa.h"
#import "DataStorage.h"
#import "Ficha.h"
#import "Treinos.h"
#import "GerenciarTreinoViewController.h"
#import "TreinoCell.h"

@interface FichaViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *frequenciaLabel;
@property (weak, nonatomic) IBOutlet UILabel *intervaloLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodoLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodoTipo;
@property (weak, nonatomic) IBOutlet UILabel *objetivoLabel;

@property (strong, nonatomic) Ficha *ficha;

@end

@implementation FichaViewController

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
    
    self.automaticallyAdjustsScrollViewInsets = NO; //Prevents top space navigation controller puts in CollectionView.
    
    //Ajuste de dados da ficha
    [[DataStorage sharedRepository] reloadData];
    NSArray *pessoas = [[DataStorage sharedRepository] getPessoas];
    Pessoa *usuario = pessoas[0];
    
    NSArray* fichas = [usuario getFichas];
    Ficha *ficha = fichas[0];
    self.ficha = ficha;
    
    //Data
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    self.dataLabel.text = [dateFormatter stringFromDate:ficha.dataDaCriacao];
    
    //Frequencia
    self.frequenciaLabel.text = [NSString stringWithFormat:@"%@", ficha.frequencia];
    
    //Intervalo
    self.intervaloLabel.text = [NSString stringWithFormat:@"%@", ficha.intervalo];
    
    //Periodo
    NSInteger periodoTipo = [ficha.periodoTipo integerValue];
    
    if (periodoTipo == 0) {
        self.periodoTipo.text = [NSString stringWithFormat:@"(semanas)"];
    } else {
        self.periodoTipo.text = [NSString stringWithFormat:@"(meses)"];
    }
    
    self.periodoLabel.text = [NSString stringWithFormat:@"%@", ficha.periodoQuantidade];
    
    //Objetivo
    NSInteger objetivo = [ficha.objetivo integerValue];
    switch (objetivo) {
        case 0:
            self.objetivoLabel.text = [NSString stringWithFormat:@"Adaptação"];
            break;
        case 1:
            self.objetivoLabel.text = [NSString stringWithFormat:@"Hipertrofia"];
            break;
        case 2:
            self.objetivoLabel.text = [NSString stringWithFormat:@"Força"];
            break;
        case 3:
            self.objetivoLabel.text = [NSString stringWithFormat:@"Definição"];
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.ficha getListaTreinos] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TreinoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fichaCell" forIndexPath:indexPath];
    
    Treinos *treino = [[self.ficha getListaTreinos] objectAtIndex:indexPath.row];
    
    cell.nomeTreinoLabel.text = treino.nome;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 20, 20, 20); //Return the margin of the Collection View.
    
    return inset;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 70); //Return the size of the cell.
}

#pragma mark - Buttons

- (IBAction)editButton:(UIButton *)sender {
    NSLog(@"Cliquei no botao de Editar");
}

- (IBAction)novoTreinoButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goGerenciarTreino" sender:self];
}

#pragma mark - Outros métodos

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"goGerenciarTreino"]) {
        GerenciarTreinoViewController *destController = segue.destinationViewController;
        NSLog(@"Ficha: %@", self.ficha);
        
        destController.ficha = self.ficha;
    }
}

@end
