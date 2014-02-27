//
//  GraficoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 20/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GraficoViewController.h"
#import "AcompanhamentoFisicoViewController.h"
#import "GraphView.h"

@interface GraficoViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet GraphView *graphView;

@end

@implementation GraficoViewController
//@synthesize scroller;

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
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self.graphView setFrame:CGRectMake(0, 0, kDefaultGraphWidth, kGraphHeight)];
    
    [self.scrollView addSubview:self.graphView];
    self.scrollView.contentSize = CGSizeMake(self.graphView.frame.size.width, self.graphView.frame.size.height);
    
    //self.graphView.bounds.size;
    
    //self.scrollView.pagingEnabled = YES;
    //self.scrollView.scrollEnabled = YES;
    //self.scrollView.showsHorizontalScrollIndicator = YES;
    //self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.delegate = self;
    
    NSLog(@"\r\nscroll SUBS(%@)",self.scrollView.subviews);//frame.size.height,self.scroller.frame.size.width);
    NSLog(@"\r\nscroll(%f,%f)",self.scrollView.frame.size.height,self.scrollView.frame.size.width);
    NSLog(@"\r\ngraph(%f,%f)",self.graphView.frame.size.height,self.graphView.frame.size.width);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGPoint offset = self.scrollView.contentOffset;
    NSLog(@"x=%f y=%f",offset.x,offset.y);
    CGRect bounds = self.scrollView.bounds;
    NSLog(@"x=%f y%f w=%f h=%f",bounds.origin.x,bounds.origin.y,bounds.size.width,bounds.size.height);
}

@end
