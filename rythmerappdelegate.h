//
//  rythmerAppDelegate.h
//  rythmer
//
//  Created by Michele Bert on 23/12/12.
//  Copyright 2012 Deltamax Automazione Srl. All rights reserved.
//

#import "core.h"
#import "cplot.h"
#import <Cocoa/Cocoa.h>


@interface CRythmerAppDelegate : NSObject <NSApplicationDelegate> {
  IBOutlet NSWindow *m_mainWindow;
  IBOutlet NSTableView *m_table;
  IBOutlet NSTextField *m_fieldCnt;
  IBOutlet NSTextField *m_fieldDt;
  IBOutlet NSTextField *m_fieldTime;
  IBOutlet NSTextField *m_fieldBpm;
  IBOutlet NSTextField *m_fieldBpm2;
	CCore *m_core;
	NSMutableArray *m_timeList;
	NSMutableArray *m_bpmList;
	IBOutlet CPlot *m_plot;
}


- (IBAction)newAction:(NSMenuItem *)sender;
- (IBAction)keyDown:(NSEvent*)sender;
- (IBAction)reset:(NSMenuItem *)sender;
- (IBAction)beatMenu:(NSMenuItem *)sender;
- (void)beat;
- (int) numberOfRowsInTableView: (NSTableView*) tableView;
- (id) tableView: (NSTableView*) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (int) row;



@end
