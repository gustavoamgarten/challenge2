//
//  GraficoViewController.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 20/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AcompanhamentoFisicoViewController;

@interface GraficoViewController : UIViewController{
    UIScrollView *scroller;
}
@property (nonatomic, strong) AcompanhamentoFisicoViewController *rootController;


@property (nonatomic, retain) IBOutlet UIScrollView *scroller;

@end
