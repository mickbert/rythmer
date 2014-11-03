//
//  core.h
//  rythmer
//
//  Created by Michele Bert on 23/12/12.
//  Copyright 2012 Deltamax Automazione Srl. All rights reserved.
//

#import <sys/time.h>
#import <Cocoa/Cocoa.h>


@interface CCore : NSObject {
	struct timeval m_t1;
	struct timeval m_t2;
	unsigned long m_cnt;
	double m_bpm;
	unsigned long m_historyDt[1024];
	double m_historyBpm[1024];
}

-(unsigned long)getCnt;
-(double)getBpm;
-(double)getBpmAtIndex:(unsigned long)idx;
-(unsigned long)getTime;
-(unsigned long)getDeltaTAtIndex:(unsigned long)idx;
-(unsigned long)getTimeAtIndex:(unsigned long)idx;
-(id)init;
-(void)reset;
-(unsigned int)update;

@end
