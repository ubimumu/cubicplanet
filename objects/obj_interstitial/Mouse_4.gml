/// @description Show the ad
if (loading = false){
   if (os_type = os_android){
      GoogleMobileAds_LoadInterstitial();
      loading = true;
   }
   if (os_type = os_windows){
      show_notification(spr_warning,"Sorry, videos are only available on mobile phones!");
   }
}

