require 'mongoid'

Mongoid.load!(File.expand_path("../../config/mongoid.yml", __FILE__))

class Setting
  include Mongoid::Document
  include Mongoid::Timestamps

  field :var, :type => String
  field :value, :type => String
  belongs_to :target, :polymorphic => true
end

class User
  include Mongoid::Document
  include Mongoid::Timestamps 

  include RailsSettings

  has_settings

  field :name, :type => String
  field :login, :type => String
  field :password, :type => String
  field :email, :type => String
end
