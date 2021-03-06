//
//  CBPlotItem.m
//  iSignal
//
//  Created by Patrick Deng on 12-6-14.
//  Copyright (c) 2012年 CodeBeaver. All rights reserved.
//

#import "CBPlotItem.h"

#import "CBPlotGallery.h"

@implementation CBPlotItem

@synthesize defaultLayerHostingView;
@synthesize graphs;
@synthesize title;

+ (void)registerPlotItem:(id)item
{
	DLog(@"Regitester CBPlotItem sub class %@ into CBPlotGallery.", [item class]);
    
	Class itemClass = [item class];
	if ( itemClass ) 
    {
		// There's no autorelease pool here yet...
		CBPlotItem *plotItem = [[itemClass alloc] init];
		if (plotItem) 
        {
			[[CBPlotGallery sharedPlotGallery] addPlotItem:plotItem];
			[plotItem release];
		}
	}
}

- (id)init
{
	if ((self = [super init])) 
    {
		graphs = [[NSMutableArray alloc] init];
	}
    
	return self;
}

- (void)dealloc
{
	[self killGraph];
    
    [graphs release];
    [title release];
    
	[super dealloc];
}

- (void)addGraph:(CPTGraph *)graph toHostingView:(CPTGraphHostingView *)layerHostingView
{
	[graphs addObject:graph];
    
	if (layerHostingView) 
    {
		layerHostingView.hostedGraph = graph;
	}
}

- (void)addGraph:(CPTGraph *)graph
{
	[self addGraph:graph toHostingView:nil];
}

- (void)killGraph
{
	// Remove the CPTLayerHostingView
	if (defaultLayerHostingView) 
    {
		[defaultLayerHostingView removeFromSuperview];
        
		defaultLayerHostingView.hostedGraph = nil;
		[defaultLayerHostingView release];
		defaultLayerHostingView = nil;
	}
    
	[cachedImage release];
	cachedImage = nil;
    
	[graphs removeAllObjects];
}

// Override to generate data for the plot if needed
- (void)generateData
{
    
}

- (NSComparisonResult)titleCompare:(CBPlotItem *)other
{
	return [title caseInsensitiveCompare:other.title];
}

- (void)setTitleDefaultsForGraph:(CPTGraph *)graph withBounds:(CGRect)bounds
{
	graph.title = title;
	CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
	textStyle.color				   = [CPTColor grayColor];
	textStyle.fontName			   = @"Helvetica-Bold";
	textStyle.fontSize			   = round(bounds.size.height / (CGFloat)20.0);
	graph.titleTextStyle		   = textStyle;
	graph.titleDisplacement		   = CGPointMake(0.0f, round(bounds.size.height / (CGFloat)18.0) ); // Ensure that title displacement falls on an integral pixel
	graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
}

- (void)setPaddingDefaultsForGraph:(CPTGraph *)graph withBounds:(CGRect)bounds
{
	CGFloat boundsPadding = round(bounds.size.width / (CGFloat)20.0); // Ensure that padding falls on an integral pixel
    
	graph.paddingLeft = boundsPadding;
    
	if ( graph.titleDisplacement.y > 0.0 ) 
    {
		graph.paddingTop = graph.titleDisplacement.y * 2;
	}
	else 
    {
		graph.paddingTop = boundsPadding;
	}
    
	graph.paddingRight	= boundsPadding;
	graph.paddingBottom = boundsPadding;
}

-(UIImage *)image
{
	if (nil == cachedImage) 
    {
		CGRect imageFrame = CGRectMake(0, 0, 400, 300);
		UIView *imageView = [[UIView alloc] initWithFrame:imageFrame];
		[imageView setOpaque:YES];
		[imageView setUserInteractionEnabled:NO];
        
		[self renderInView:imageView withTheme:nil];
        
		UIGraphicsBeginImageContext(imageView.bounds.size);
		CGContextRef context = UIGraphicsGetCurrentContext();
        
		CGContextSetAllowsAntialiasing(context, true);
        
		for (UIView *subView in imageView.subviews) 
        {
			if ([subView isKindOfClass:[CPTGraphHostingView class]]) 
            {
				CPTGraphHostingView *hostingView = (CPTGraphHostingView *)subView;
				CGRect frame = hostingView.frame;
                
				CGContextSaveGState(context);
                
				CGContextTranslateCTM(context, frame.origin.x, frame.origin.y + frame.size.height);
				CGContextScaleCTM(context, 1.0, -1.0);
				[hostingView.hostedGraph layoutAndRenderInContext:context];
                
				CGContextRestoreGState(context);
			}
		}
        
		CGContextSetAllowsAntialiasing(context, false);
        
		cachedImage = UIGraphicsGetImageFromCurrentImageContext();
		[cachedImage retain];
		UIGraphicsEndImageContext();
        
		[imageView release];
	}
    
	return cachedImage;
}

- (void)applyTheme:(CPTTheme *)theme toGraph:(CPTGraph *)graph withDefault:(CPTTheme *)defaultTheme
{
	if (nil == theme) 
    {
		[graph applyTheme:defaultTheme];
	}
	else if (![theme isKindOfClass:[NSNull class]]) 
    {
		[graph applyTheme:theme];
	}
}

- (void)renderInView:(UIView *)hostingView withTheme:(CPTTheme *)theme
{
	[self killGraph];
    
    CGRect rect = hostingView.bounds;
    //TODO: Need remove hard code for CGRect
//    rect = CGRectMake(0,0,320,378);
    
	defaultLayerHostingView = [(CPTGraphHostingView *)[CPTGraphHostingView alloc] initWithFrame:rect];
    
	defaultLayerHostingView.collapsesLayers = NO;

	[hostingView addSubview:defaultLayerHostingView];
	[self renderInLayer:defaultLayerHostingView withTheme:theme];
    [self generateData];
}

- (void)renderInLayer:(CPTGraphHostingView *)layerHostingView withTheme:(CPTTheme *)theme
{
    //TODO: To be overrided
}

- (void)reloadData
{
	for (CPTGraph *g in graphs) 
    {
		[g reloadData];
	}
}

@end
