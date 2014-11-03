//
//  CPlot.h
//
//  Created by Michele Bert on 26/12/12.
//  Copyright 2012 Deltamax Automazione Srl. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CPlot : NSView {
	unsigned int m_size;
	unsigned int m_cnt;
	double *m_data;
	unsigned int m_window;
	// id m_keyDownReceiver;
}
- (CPlot*)initWithFrame:(NSRect)frameRect;
- (IBAction)keyDown:(NSEvent*)theEvent;
- (IBAction)drawRect:(NSRect*)dirtyRect;
- (int)appendValue:(double)value;
- (void)reset;
@end

