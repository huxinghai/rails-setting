# Rails::Setting

设置支持mysql,mongoid 多种数据库

## Installation

Add this line to your application's Gemfile:

    gem 'rails-setting',:github => "huxinghai1988/rails-setting"

And then execute:

    $ bundle

创建数据模型，例如:

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

可以给某个用户设置,在用户模型添加下面两句:   

    include RailsSettings
    has_settings


## Usage

设置语法:

    Settings.admin_password = 'kaka'
    Settings.foo            = 123

获取设置:
    
    Settings.foo # returns 123

获取所有设置: 
    
    Settings.all            # returns {'admin_password' => 'kaka', 'foo' => '123'}
