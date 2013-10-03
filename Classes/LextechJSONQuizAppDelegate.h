//
//  LextechJSONQuizAppDelegate.h
//  LextechJSONQuiz
//
//  Created by David Rossi on 4/15/11.
//  Copyright 2011 Lextech Global Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LextechJSONQuizViewController;

@interface LextechJSONQuizAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *_window;
    LextechJSONQuizViewController *_viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LextechJSONQuizViewController *viewController;

@end

