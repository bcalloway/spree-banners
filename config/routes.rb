map.connect "/banners/:placement",        :controller => :banners, :action => :index
map.connect "/banners/:placement/:path",  :controller => :banners, :action => :index

map.namespace :admin do |admin|
  # banners
  admin.resources :banners
  admin.banner_updatepos  '/banners/:id/update_positions', :controller => "banners", :action => 'update_positions'
  
  # banner_images
  admin.resources :banner_images
end