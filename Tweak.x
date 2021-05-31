// Root View Controller
@interface _TtC7grindrx27RootContainerViewController : UIView
-(void)addBannerAdHideFactor:(NSInteger)adHideFactor;
-(void)removeBannerAdHideFactor:(NSInteger)adHideFactor;
@end

%hook _TtC7grindrx27RootContainerViewController

// Block ads on the main screen
- (BOOL)isNoAds {
    return YES;
}

// Block bottom banner ads
- (BOOL)isBannerAdAllowed {
    return NO;
}

// Ensure the ad height is 0
- (CGFloat)bannerAdHeight {
    return 0;
}

// Ensure that the ad height doesn't come back
- (void)removeBannerAdHideFactor:(NSInteger)adHideFactor {
	[self addBannerAdHideFactor:1];
	return;
}

%end

// Cascade View Controller (Messages)
%hook _TtC7grindrx25BaseCascadeViewController

- (BOOL)canDisplayBannerAds {
	return NO;
}
- (BOOL)presentingFullScreenAd {
	return NO;
}
- (BOOL)displayingBannerAd {
	return NO;
}
- (BOOL)shouldPresentInterstitialAd {
	return NO;
}

%end