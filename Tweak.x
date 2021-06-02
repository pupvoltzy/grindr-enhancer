// Root View Controller
@interface _TtC7grindrx27RootContainerViewController : UIView
	- (void)addBannerAdHideFactor: (NSInteger)adHideFactor;
	- (void)removeBannerAdHideFactor: (NSInteger)adHideFactor;
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
	- (void)removeBannerAdHideFactor: (NSInteger)adHideFactor {
		[self addBannerAdHideFactor:1];
		return;
	}

	// Do nothing when updating the ad view
	- (void)updateAdView {
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

%hook _TtC7grindrx9AdManager
	- (bool)isEnabled {
		return NO;
	}

	- (void)setIsEnabled: (bool)isEnabled {
		return;
	}
%end

%hook GRAdManager
	- (bool)isEnabled {
		return NO;
	}

	- (void)setEnabled: (bool)enabled {
		return;
	}
%end

%hook GRAdBannerController
	- (bool)isBannerContentLoaded {
		return NO;
	}
%end

%hook GRInterstitialVideoAd
	- (bool)isShowingBlockingModal {
		return NO;
	}
%end

%hook GRInterstitialMoPub
	- (bool)isShowingBlockingModal {
		return NO;
	}
%end

// Fyber ads
%hook IASDKCore
	- (void)initWithAppID: (id)appId {
		return;
	}
	- (void)initWithAppID: (id)appId: (id)FairBidSDKVersion {
		return;
	}
%end

// AdColony Ads
%hook AdColony
	- (void)configureWithAppID: (id)appId: (id)zoneIDs: (id)options: (bool)forceIt: (id)completion {
		return;
	}
	- (void)configureWithAppID: (id)appId: (id)zoneIDs: (id)options: (id)completion {
		return;
	}
%end

// Vungle Ads
%hook VungleSDK
	- (bool)startWithAppId: (id)appId: (id)placements: (id *)error {
		return false;
	}
	- (bool)startWithAppId: (id)appId: (id *)error {
		return false;
	}
%end

%hook VungleRouter
	- (void)vungleSDKDidInitialize {
		return;
	}
%end

%hook VungleSDKInitializer
	- (bool)didInitialize {
		return false;
	}
%end

// MoPub Ads
%hook MoPub
	- (void)initializeSdkWithConfiguration: (id)config: (id)completion {
		return;
	}
%end