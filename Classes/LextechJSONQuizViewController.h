//
//  LextechJSONQuizViewController.h
//  LextechJSONQuiz
//
//  Created by David Rossi on 4/15/11.
//  Copyright 2011 Lextech Global Services. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TransactionsTableViewController.h"


@interface LextechJSONQuizViewController : UIViewController
{
	UIActivityIndicatorView *_loadingIndicator;
	
    // changed to mutable
	NSMutableArray *_transactions;
    
    IBOutlet TransactionsTableViewController *_transactionsTableView;

}

@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *loadingIndicator;

// changed to mutable
@property(nonatomic, retain) NSMutableArray *transactions;

@property(nonatomic, retain) TransactionsTableViewController *transactionsTableView;

- (IBAction)viewTransactions:(id)sender;

- (IBAction)refreshButtonPressed:(id)sender;
- (void)requestTransactionData;



@end

