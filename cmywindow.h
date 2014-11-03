//
//  CMyWindow.h
//
//  Created by Michele Bert on 28/12/12.
//  Copyright 2012 Deltamax Automazione Srl. All rights reserved.
//

#import "rythmerappdelegate.h"
#import <Cocoa/Cocoa.h>


@interface CMyWindow : NSWindow {
	CRythmerAppDelegate *m_delegate;
}
@property (assign) IBOutlet CRythmerAppDelegate *m_delegate;

- (IBAction)keyDown:(NSEvent *)sender;
@end

