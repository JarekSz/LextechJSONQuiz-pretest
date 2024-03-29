//
//  LextechJSONQuizViewController.m
//  LextechJSONQuiz
//
//  Created by David Rossi on 4/15/11.
//  Copyright 2011 Lextech Global Services. All rights reserved.
//

#import "LextechJSONQuizViewController.h"
#import "JSONKit.h"

@implementation LextechJSONQuizViewController

//@synthesize loadingIndicator =      _loadingIndicator;
//@synthesize transactions =          _transactions;
//@synthesize transactionsTableView = _transactionsTableView;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	[self requestTransactionData];
}


- (IBAction)viewTransactions:(id)sender
{
    if (nil == _transactionsTableView) {
        _transactionsTableView = [[TransactionsTableViewController alloc] initWithNibName: @"TransactionsTableViewController" bundle: nil];
    }
    
    [self presentModalViewController:_transactionsTableView animated:YES];
    
    [_transactionsTableView setCurrentTransactions:_transactions];

    self.transactionsTableView = nil;
}

- (IBAction)refreshButtonPressed:(id)sender
{
	[self requestTransactionData];
}


- (void)requestTransactionData
{
	//
    //start indicator
    [self.loadingIndicator startAnimating];

	//connect to http://mobiletest.lextech.com/jsontest.php and download transaction data
    NSString *fileName = @"http://mobiletest.lextech.com/jsontest.php";
    
    NSDictionary *dictJSON = nil;
    @try
    {
        NSURL *requestURL = [NSURL URLWithString:fileName];
        
        NSData *requestData = [NSData dataWithContentsOfURL:requestURL];
        
        NSError *error = nil;
        
        dictJSON = [NSJSONSerialization JSONObjectWithData:requestData
                                                   options:0
                                                     error:&error];
        
        if (error) {
            
            NSException *e = [[NSException alloc] initWithName:@"EXCEPTION" reason:error.description userInfo:nil];
            
            @throw e;
        }
        
        _transactions = [[NSMutableArray alloc] init];

        for (NSArray *string in [dictJSON allValues])
        {
            [_transactions addObjectsFromArray:string];
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception: %@", exception.description);
        
        _transactions = [[NSMutableArray alloc] init];
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"000", @"ID",
                                    @"No description", @"description",
                                    @"0.00", @"price", nil];
        
        [_transactions addObject:dictionary];
    }
    @finally
    {
        //
        //Show some details
        NSUInteger count = dictJSON.count;
        NSLog(@"The dictionary contains %lu items", (unsigned long)count);
        
        for (NSString *s in [dictJSON allValues]) {
            NSLog(@"%@", s);
        }
    }
        
	//
    //stop indicator
    [self.loadingIndicator stopAnimating];
}


#pragma mark -


- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	self.transactions = nil;
	self.loadingIndicator = nil;
    self.transactionsTableView = nil;
}


- (void)dealloc 
{
	[_transactions release];
	[_loadingIndicator release];
    [_transactionsTableView release];
	
    [super dealloc];
}

@end
