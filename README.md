# Rails::Setting

设置支持mysql,mongoid 多种数据库

## Installation

Add this line to your application's Gemfile:

    gem 'rails-setting',:github => "huxinghai1988/rails-setting"

And then execute:

    $ bundle

## Usage
1. 创建数据模型，例如

    mysql 数据库

        rails g model setting var:string value:string target_id:integer target_type:string

    or 

    mongodb 数据库

        class Setting
            include Mongoid::Document
            include Mongoid::Timestamps
            field :var, :type => String
            field :value, :type => String
            belongs_to :target, :polymorphic => true 
                
        end

2. 可以给某个用户设置,在用户模型添加下面两句   

    include RailsSetting
    
    has_settings

