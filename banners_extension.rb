# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'
  
class BannersExtension < Spree::Extension
  version "1.0"
  description "A Spree extension that allows you to manage random banner ads"
  url "http://github.com/bcalloway/spree-banners"

  
  def activate

    Spree::BaseHelper.class_eval do

      def show_banners(position, number)
        @banner = Banner.page_id_eq(current_page).placement_eq(position).first

        if @banner.nil?
          @banner = Banner.page_id_eq(1).placement_eq(position).first
        end

        if !@banner.nil?
          @images = BannerImage.banner_id_eq(@banner.id).all :order => "RAND()", :limit => number
          @ads = []
          @images.each do |image|
            if position == "sidebar"
              @ads.push("<li><a href=\"#{image.url}\" target=\"_blank\">#{image_tag image.ad.url(:sidebar), :width => "300", :height => "250"}</a></li>")
            else
              @ads.push("<li><a href=\"#{image.url}\" target=\"_blank\">#{image_tag image.ad.url(:footer), :width => "158", :height => "90"}</a></li>")
            end
          end

          return @ads
        else
          return nil
        end
      end
    end
    
  end
  
end