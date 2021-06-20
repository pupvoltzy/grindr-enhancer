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

%hook _TtC7grindrx11AppDelegate
	- (bool)application: (id)didFinishLaunchingWithOptions: (id)options {
		return NO;
	}
	- (void)applicationDidBecomeActive: (id)arg1 {
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

// Inneractive/Fyber ads
%hook IASDKCore
	- (void)initWithAppID: (id)appId {
		return;
	}
	- (void)initWithAppID: (id)appId: (id)FairBidSDKVersion {
		return;
	}
%end
%hook IASDKMopubAdapterConfiguration
	+ (void)initialize {
		return;
	}
%end

// AdColony Ads
%hook AdColony
	- (void)configureWithAppID: (id)appId: (id)zoneIDs: (id)options: (bool)forceIt: (id)completion {
		return;
	}
	+ (void)configureWithAppID: (id)appId: (id)zoneIDs: (id)options: (id)completion {
		return;
	}
%end

// Vungle Ads
%hook VungleSDK
	- (bool)startWithAppId: (id)appId: (id)placements: (id *)error {
		return NO;
	}
	- (bool)startWithAppId: (id)appId: (id *)error {
		return NO;
	}
	- (bool)didStartup {
		return NO;
	}
%end

%hook VungleRouter
	- (void)vungleSDKDidInitialize {
		return;
	}
%end

%hook VungleSDKInitializer
	- (bool)didInitialize {
		return NO;
	}
%end

// MoPub Ads
%hook MoPub
	- (void)initializeSdkWithConfiguration: (id)config: (id)completion {
		return;
	}
	- (bool)isSdkInitialized {
		return NO;
	}
%end

%hook GRInterstitialMoPub
	- (void)show {
		return;
	}
%end

// Hybid
%hook HyBid
	+ (void)initWithAppToken: (id)token: (id)completion {
		return;
	}
%end

// Braze (Appboy) Ads
%hook Appboy
	+ (bool)startWithApiKey: (id)apiKey: (id)inApplication: (id)withLaunchOptions: (id)withAppboyOptions {
		return NO;
	}
	+ (bool)startWithApiKey: (id)apiKey: (id)inApplication: (id)withLaunchOptions {
		return NO;
	}
	+ (bool)isSDKDisabled {
		return YES;
	}
%end

// AppsFlyer
%hook AppsFlyerUtils
	- (void)initialize {
		return;
	}
%end
%hook AppsFlyerRequestCache
	- (void)initialize {
		return;
	}
%end

// Smaato
%hook SmaatoSDK 
	+ (void)initSDKWithConfig: (id)config {
		return;
	}
%end

@interface _TtC7grindrx16ViewedMeUserCell : UITableViewCell
	- (id)initWithStyle: (NSInteger) style : (id)reuseIdentifier;
@end

// Redirect Blurred ViewedMeUserCell to standard (super/parent class)
%hook _TtC7grindrx23BlurredViewedMeUserCell
	- (id)initWithStyle: (NSInteger)style: (id)reuseIdentifier {
		return (_TtC7grindrx23BlurredViewedMeUserCell *)[[objc_getClass("_TtC7grindrx16ViewedMeUserCell") alloc] initWithStyle:style:reuseIdentifier];
	}
%end