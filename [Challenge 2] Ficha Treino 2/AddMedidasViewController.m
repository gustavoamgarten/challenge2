//
//  AddMedidasViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 07/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddMedidasViewController.h"

@interface AddMedidasViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pesoTextField;
@property (weak, nonatomic) IBOutlet UITextField *bracoTextField;
@property (weak, nonatomic) IBOutlet UITextField *cinturaTextField;
@property (weak, nonatomic) IBOutlet UITextField *coxaTextField;
@property (weak, nonatomic) IBOutlet UITextField *ombroTextField;
@property (weak, nonatomic) IBOutlet UITextField *panturrilhaTextField;
@property (weak, nonatomic) IBOutlet UITextField *antebracoTextField;
@property (weak, nonatomic) IBOutlet UITextField *quadrisTextField;
@property (weak, nonatomic) IBOutlet UITextField *porcentagemDeGorduraTextField;
@property (weak, nonatomic) IBOutlet UITextField *alturaTextField;

@property (weak, nonatomic) IBOutlet UIButton *btnSalvarMedidas;
@end

@implementation AddMedidasViewController

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

@end
