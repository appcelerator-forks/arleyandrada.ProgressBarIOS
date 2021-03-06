/**
 * MIT License
 * Copyright (c) 2014-present
 * ArlSoft Tecnologia <contato@arlsoft.com.br>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#import "BrComArlsoftProgressbarCircularView.h"

@implementation BrComArlsoftProgressbarCircularView

-(void)initializeState
{
    // This method is called right after allocating the view and
    // is useful for initializing anything specific to the view
    
    [super initializeState];
    
    self.animatedProgress = NO;
}

-(void)configurationSet
{
    // This method is called right after all view properties have
    // been initialized from the view proxy. If the view is dependent
    // upon any properties being initialized then this is the method
    // to implement the dependent functionality.
    
    [super configurationSet];
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];

    //Force to update view...
    CircularProgressView *view = [self progressView];
    CGFloat currentProgress = [view progress];
    if( self.animatedProgress )
    {
        [view setProgress:currentProgress animated:YES];
    } else {
        [view setProgress:currentProgress];
    }
}

-(CircularProgressView*)progressView
{
    if( progressView == nil )
    {
        progressView = [[CircularProgressView alloc] initWithFrame:[self frame]];
        [self addSubview:progressView];
    }
    return progressView;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (progressView != nil) {
        
        // You must call the special method 'setView:positionRect' against
        // the TiUtils helper class. This method will correctly layout your
        // child view within the correct layout boundaries of the new bounds
        // of your view.
        
        [TiUtils setView:progressView positionRect:bounds];
    }
}

-(void)setTextFont_:(id)font
{
    [[self progressView] setTextFont:[TiUtils fontValue:font].font];
}

-(void)setTextOpacity_:(id)opacity
{
    [[self progressView] setTextOpacity:[TiUtils floatValue:opacity]];
}

-(void)setTextColor_:(id)color
{
    [[self progressView] setTextColor:[TiUtils colorValue:color].color];
}

-(void)setProgressTintColor_:(id)color
{
    [[self progressView] setProgressTintColor:[TiUtils colorValue:color].color];
}

-(void)setTrackTintColor_:(id)color
{
    [[self progressView] setTrackTintColor:[TiUtils colorValue:color].color];
}

-(void)setProgressOpacity_:(id)opacity
{
    [[self progressView] setProgressOpacity:[TiUtils floatValue:opacity]];
}

-(void)setTrackOpacity_:(id)opacity
{
    [[self progressView] setTrackOpacity:[TiUtils floatValue:opacity]];
}

-(void)setRoundedCorners_:(id)roundedCorners
{
    BOOL corners = [TiUtils boolValue:roundedCorners def:YES];
    CircularProgressView *view = [self progressView];
    view.roundedCorners = corners;
}

-(void)setAnimatedProgress_:(id)animatedProgress
{
    self.animatedProgress = [TiUtils boolValue:animatedProgress def:YES];
}

-(void)setProgress_:(id)progress
{
    CircularProgressView *view = [self progressView];
    if( self.animatedProgress )
    {
        [view setProgress:[TiUtils floatValue:progress] animated:YES];
    } else {
        [view setProgress:[TiUtils floatValue:progress]];
    }
}

-(float)progress
{
    return [self progressView].progress;
}

-(void)setText_:(id)text
{
    CircularProgressView *view = [self progressView];
    [view setText:[TiUtils stringValue:text]];
}

-(NSString*)text
{
    return [self progressView].text;
}

-(void)setThicknessRatio_:(id)ratio
{
    CircularProgressView *view = [self progressView];
    view.thicknessRatio = [TiUtils floatValue:ratio];
}

-(float)thicknessRatio:(id)ratio
{
    return [self progressView].thicknessRatio;
}

@end
