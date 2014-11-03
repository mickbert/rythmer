//
//  CMyWindow.m
//
//  Created by Michele Bert on 28/12/12.
//  Copyright 2012 Deltamax Automazione Srl. All rights reserved.
//

#import "cmywindow.h"

@implementation CMyWindow
@synthesize m_delegate;
- (IBAction)keyDown:(NSEvent *)sender
{
	NSString *str=[sender charactersIgnoringModifiers];
	// NSLog(@"received keyDown with characters: %@",str);
	unsigned int i;
	for(i=0;i<1;++i)
	{
		unichar chr=[str characterAtIndex:i];
		if(chr==(unichar)'b' || chr==(unichar)'B')
		{
			[m_delegate keyDown:sender];
		} else {
			[super keyDown:sender];
		}
	}
}
@end
