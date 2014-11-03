//
//  rythmerAppDelegate.m
//  rythmer
//
//  Created by Michele Bert on 23/12/12.
//  Copyright 2012 Deltamax Automazione Srl. All rights reserved.
//

#import "rythmerappdelegate.h"

@implementation CRythmerAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	m_core=[[CCore alloc]init];
}

- (IBAction)reset:(NSMenuItem *)sender
{
	[m_core reset];
	NSLog(@"Reset counters");
	[m_fieldCnt setIntValue:0];
	[m_fieldDt setIntValue:0];
	[m_fieldTime setIntValue:0];
	[m_fieldBpm setDoubleValue:0.];
	[m_fieldBpm2 setDoubleValue:0.];
	[m_table reloadData];
	// [m_table scrollRowToVisible:0];
	[m_plot reset];
}	

- (IBAction)newAction:(NSMenuItem *)sender
{
	[self reset:sender];
}

- (IBAction)keyDown:(NSEvent*)sender
{
	[self beat];
	//NSLog(@"appDelegate received keyDown");
}

- (IBAction)beatMenu:(NSMenuItem *)sender
{
	[self beat];
}


- (void) beat
{
	unsigned int cnt=[m_core update];
	double bpm=[m_core getBpm];
	NSLog(@"beat %3d: %f",cnt,bpm);
	if(cnt>1)
	{
	  [m_fieldCnt setIntValue:cnt];
	  [m_fieldDt setIntValue:[m_core getDeltaTAtIndex:cnt-1]];
	  [m_fieldTime setIntValue:[m_core getTime]];
	  [m_fieldBpm setDoubleValue:bpm];
	  [m_fieldBpm2 setDoubleValue:bpm/2];
	  [m_table reloadData];
	  [m_table scrollRowToVisible:cnt-2];
	  [m_plot appendValue:bpm];
	}
}

- (int) numberOfRowsInTableView: (NSTableView*) tableView
{
	unsigned int cnt=[m_core getCnt];
	return cnt>0?cnt-1:0;
}

- (id) tableView: (NSTableView*) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (int) row
{
	NSString *ident=[tableColumn identifier];
	
	if([ident isEqual:@"Count"])
		return [NSString stringWithFormat:@"%u",row+1];
	else if([ident isEqual:@"Time"])
		return [NSString stringWithFormat:@"%f",[m_core getTimeAtIndex:row+1]/1000.];
	else if([ident isEqual:@"Delta"])
		return [NSString stringWithFormat:@"%f",[m_core getDeltaTAtIndex:row+1]/1000.];
	else if([ident isEqual:@"BPM"])
		return [NSString stringWithFormat:@"%f",[m_core getBpmAtIndex:row]];
	else if([ident isEqual:@"BPM/2"])
		return [NSString stringWithFormat:@"%f",[m_core getBpmAtIndex:row]/2.];
	return nil;
}



@end
