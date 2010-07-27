class BannersHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_tabs do
    %(<%= tab(:label => "Ad Banners", :route => :admin_banners) %>) 
  end

end