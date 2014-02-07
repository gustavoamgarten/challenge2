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
#import "BegymModel.h"
#import "IniciarTreinoCell.h"
#import "TreinoViewController.h"

@interface LoadIniciarTreinoViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) Ficha *ficha;
@property (nonatomic) NSInteger treinoSelecionado;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation LoadIniciarTreinoViewController

#pragma mark - método auxiliar
//método para puxar os dados do banco local e atualizar o view controller
-(void)atualizarMostradores
{
    DataStorage *repository = [DataStorage sharedRepository];
    [repository reloadData];
    
    NSArray *pessoas = [repository getPessoas];
    Pessoa *user = pessoas[0];
    
    NSArray* fichas = [user getFichas];
    Ficha *ficha = fichas[0];
    self.ficha = ficha;
    
    [self.collectionView reloadData];
}

#pragma mark - métodos de inicialização

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

    [self atualizarMostradores];
}

 -(void)viewWillAppear:(BOOL)animated
{
    [self atualizarMostradores];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.ficha getListaTreinos] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IniciarTreinoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"treinoCell" forIndexPath:indexPath];
    
    Treinos *treino = [[self.ficha getListaTreinos] objectAtIndex:indexPath.row];
    
    cell.nomeTreinoLabel.text = treino.nome;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.treinoSelecionado = indexPath.row;
    
    [self performSegueWithIdentifier:@"iniciarTreino" sender:self];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 20, 20, 20); //Return the margin of the Collection View.
    
    return inset;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 70); //Return the size of the cell.
}

#pragma mark - Outros métodos

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"iniciarTreino"]) {
        TreinoViewController *destController = segue.destinationViewController;
        destController.ficha = self.ficha;
        destController.treino = [[self.ficha getListaTreinos] objectAtIndex:self.treinoSelecionado];
    }
}

@end
