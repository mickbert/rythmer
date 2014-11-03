//
//  CPlot.m
//
//  Created by Michele Bert on 26/12/12.
//  Copyright 2012 BeGar. All rights reserved.
//

#import "CPlot.h"

@implementation CPlot

- (CPlot*)initWithFrame:(NSRect)frameRect
{
  m_data=malloc((m_size=1024)*sizeof(m_data[0]));
  m_cnt=0;
  m_window=30;
  return [super initWithFrame:frameRect];
}

- (IBAction)drawRect:(NSRect*)dirtyRect
{
  // NSGraphicsContext *gc=[NSGraphicsContext currentContext];
  NSBezierPath *path;
  NSRect frameRect = [self bounds];
        
  /* Draw axis */
  frameRect.origin.x+=30;
  frameRect.origin.y+=10;
  frameRect.size.width-=40;
  frameRect.size.height-=40;
  path=[NSBezierPath bezierPathWithRect:frameRect];
  if(m_cnt>0)
    {
      unsigned int i;
      unsigned int maxdata=m_data[0];
	  unsigned int mindata=m_data[0];
      for(i=1 ; i<m_cnt ; ++i)
	  {
        if(m_data[i]>maxdata)
          maxdata=m_data[i];
		if(m_data[i]<mindata)
			mindata=m_data[i];
	  }
		maxdata=maxdata*12/10;
		if(maxdata==mindata)
		{
			maxdata=mindata+60;
		}
        NSPoint p;
        p.x=frameRect.origin.x;
        p.y=frameRect.origin.y+(m_data[0]-mindata)*frameRect.size.height/(maxdata-mindata);
        [path moveToPoint:p];
        /* Draw line */
        for(i=1 ; i<m_cnt ; ++i)
          {
            p.x=frameRect.origin.x+i*frameRect.size.width/(m_cnt-1);
			p.y=frameRect.origin.y+(m_data[i]-mindata)*frameRect.size.height/(maxdata-mindata);
            [path lineToPoint:p];
          }
		//[path closePath];
    }
  [path stroke];

}

- (IBAction)keyDown:(NSEvent*)theEvent
{
  //[m_keyDownReceiver keyDown:theEvent];
  [super keyDown:theEvent];
}

- (int)appendValue:(double)value
{
	NSLog(@"%3d-%f",m_cnt,value); 
	m_data[m_cnt]=value;
	m_cnt=(m_cnt+1)%m_size;
	[self setNeedsDisplay:YES];
	return 1;
}

- (void)reset
{
  m_cnt=0;
  [self setNeedsDisplay:YES];
}

@end
