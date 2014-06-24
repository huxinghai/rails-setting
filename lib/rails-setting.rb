require "rails-setting/version"
require "rails-setting/setting_functional"
require "rails-setting/settings"
require "rails-setting/model_relaction"


module RailsSettings
  def self.klasss(model = nil)
    @klasss = model unless model.nil?
    if @klasss.nil? 
      if defined?(Setting).nil?
        raise "not defined setting model class..."
      else
        @klasss = Setting
      end
    end
    @klasss
  end
end

