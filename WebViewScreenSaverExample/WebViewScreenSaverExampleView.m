#import "WebViewScreenSaverExampleView.h"
#import <WebKit/WebKit.h>

@interface WebViewScreenSaverExampleView ()
@property WebView *webView;
@end

@interface WebPreferences (WithWebGLEnabled)
- (void)setWebGLEnabled:(BOOL)enabled;
@end

@implementation WebViewScreenSaverExampleView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        _webView = [[WebView alloc] initWithFrame:[NSScreen mainScreen].frame];
        WebPreferences *wp = [_webView preferences];
        if ([wp respondsToSelector:@selector(setWebGLEnabled:)]) {
            [wp performSelector:@selector(setWebGLEnabled:) withObject:[NSNumber numberWithBool:YES]];
        }
        [self addSubview:_webView];
        [_webView setMainFrameURL:@"http://map.ipviking.com/"];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
