//
//  core.m
//  rythmer
//
//  Created by Michele Bert on 23/12/12.
//  Copyright 2012 BeGar srl. All rights reserved.
//

#import "core.h"
#import <sys/time.h>

@implementation CCore

-(unsigned long)getCnt
{
	return m_cnt;
}

-(double)getBpm
{
	return m_bpm;
}

-(double)getBpmAtIndex:(unsigned long)idx
{
	if(idx<m_cnt)
		return m_historyBpm[idx];
	return 0;
}


-(unsigned long)getTime
{
	unsigned long dt; //time in ms
	dt=(m_t2.tv_sec-m_t1.tv_sec)*1000;
	if(m_t2.tv_usec>m_t1.tv_usec)
	{
		dt+=(m_t2.tv_usec-m_t1.tv_usec)/1000;
	} else {
		dt+=(1000000+m_t2.tv_usec-m_t1.tv_usec)/1000-1000;
	}
	return dt;
}

-(unsigned long)getDeltaTAtIndex:(unsigned long)idx
{
	if(idx<m_cnt && idx>0)
		return m_historyDt[idx]-m_historyDt[idx-1];
	return 0;
}

-(unsigned long)getTimeAtIndex:(unsigned long)idx;
{
	if(idx<m_cnt)
		return m_historyDt[idx];
	return 0;
}

-(id)init
{
	m_cnt=0;
	return self;
}

-(void)reset
{
	m_cnt=0;
}


-(unsigned int)update
{
	gettimeofday(&m_t2,NULL);
	if(m_cnt>0)
	{
		unsigned long dt=[self getTime];
		if(dt>0)
		{
			m_bpm=60000.*m_cnt/dt;
			m_historyBpm[m_cnt-1]=m_bpm;
			m_historyDt[m_cnt]=dt;
		}
	} else {
		m_t1=m_t2;
		m_historyDt[m_cnt]=0;
	}
	m_cnt++;
	return m_cnt;
}

@end
