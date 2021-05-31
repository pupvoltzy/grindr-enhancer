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

	- (void)setIsEnabled:(bool)isEnabled {
		return;
	}
%end

%hook GRAdManager
	- (bool)isEnabled {
		return NO;
	}

	- (void)setEnabled:(bool)enabled {
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



%hook IAViewUnitController
	- (void)showAdInParentView:(id)parentView {
		return;
	}
%end

%hook IANativeUnitController
	- (void)showAdInNativeRenderer:(id)nativeRenderer {
		return;
	}
%end

%hook IAFullscreenUnitController
	- (void)showAdAnimated:(bool) completion: (id)adId {
		return;
	}
%end

%hook IABaseView
	- (bool)isAdReportingEnabled {
		return NO;
	}

	- (void)setAdReportingEnabled: (bool)enabled {
		return;
	}
%end

%hook IAAdSourceController
	- (bool)enabled {
		return NO;
	}

	- (void)setEnabled: (bool)enabled {
		return;
	}
%end

%hook IAServerAdSource
	- (bool)enabled {
		return NO;
	}

	- (void)setEnabled: (bool)enabled {
		return;
	}
%end

%hook AdColonyInterstitial
	- (bool)showWithPresentingViewController:(id)viewController {
		return NO;
	}
%end

%hook AdColonyAdOptions
	- (bool)showPrePopup {
		return NO;
	}

	- (bool)showPostPopup {
		return NO;
	}
%end

%hook AdColony
	- (bool)showingInterstitial {
		return NO;
	}
%end

%hook AdColonyZone
	- (void)setEnabled: (bool)enabled {
		return;
	}
%end

%hook AdColonyInstanceMediationOptions
	- (bool)showPrePopup {
		return NO;
	}

	- (bool)showPostPopup {
		return NO;
	}
%end

%hook VungleRouter
	- (void)vungleWillShowAdForPlacementID:(id)placementId {
		return;
	}
%end

%hook VungleAdLegacy
	- (bool)ctaDisplayOntouch {
		return NO;
	}

	- (bool)ctaEnabled {
		return NO;
	}
%end

%hook MPBannerAdManager
	- (bool)requestingAdapterIsReadyToBePresented {
		return NO;
	}
	
	- (bool)adActionInProgress {
		return NO;
	}
	
	- (bool)hasRequestedAtLeastOneAd {
		return NO;
	}
%end

%hook MPFullscreenAdAdapter
	- (bool)hasAdAvailable {
		return NO;
	}
	- (void)setHasAdAvailable:(bool)available {
		return;
	}
	- (bool)hasSuccessfullyLoaded {
		return NO;
	}
	- (void)setHasSuccessfullyLoaded:(bool)loaded {
		return;
	}
%end

%hook MPFullscreenAdViewController
	- (void)viewWillAppear:(bool)willAppear {
		return;
	}
%end