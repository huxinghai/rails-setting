class Settings
	cattr_accessor :defaults
	include SettingFunctional::Method
	extend SettingFunctional::Method
	
	def initialize(target = nil)
		@target = target
	end
end