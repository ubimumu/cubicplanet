/// @description Draw
draw_self();
if (loading = true){
   draw_sprite_stretched(spr_shadow,0,0,0,1408,800);
   draw_sprite_ext(spr_loading,0,704,400,1,1,rot,c_white,1);
   rot -= 3;
   if (GoogleMobileAds_InterstitialStatus() = "Ready"){
      GoogleMobileAds_ShowInterstitial();
      alarm[0] = 10;
   }
}

