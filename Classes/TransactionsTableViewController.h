//
//  TransactionsTableViewController.h
//  LextechJSONQuiz
//
//  Created by Jaroslaw Szymczyk on 6/21/13.
//
//

#import <UIKit/UIKit.h>

@interface TransactionsTableViewController : UITableViewController
//{
//    NSMutableArray *transactions;
//}

@property (nonatomic, assign) NSMutableArray *transactions;

- (void)setCurrentTransactions:(NSMutableArray *)transact;
- (IBAction)goBackToReload:(id)sender;

@end
