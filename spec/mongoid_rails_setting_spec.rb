require 'spec_helper'
require 'mongoid_model'
describe Settings do         
    before :each do          
        Settings.destroy_all        
    end

    context "setting value" do 
        it "test setting" do                 
            Settings.foo = "join"
            Settings.foo.should eq("join")
            Settings[:foo] = "Dom"
            Settings.foo.should eq("Dom")
        end

        it "test destroy a key setting" do
            Settings.foo = "abc"
            Settings.foo.should eq("abc")
            Settings.destroy(:foo)
            Settings.foo.should be_nil
        end

        it "test destroy all setting " do
            Settings.password = "join"
            Settings.foo = "dom1"
            Settings.foo1 = "dom2"
            Settings.all.length.should eq(3)
            Settings.destroy_all
            Settings.all.length.should eq(0)
        end
    end

    context "polymorphic setting value" do
        before :each do 
            User.destroy_all
            @user = User.create!(:name => "kk",:login=> 'kaka',:password => '123456',:email => "kaka@qq.com")
        end

        it "test setting" do                      
            @user.settings.foo = "join"            
            @user.settings.foo.should eq("join")
            @user.settings[:foo] = "kaka"
            @user.settings[:foo].should eq("kaka")
        end

        it "test destroy a key setting" do 
            @user.settings.password = "fdsafdsa"
            @user.settings.password.should eq("fdsafdsa")
            @user.settings.destroy(:password)
            @user.settings.password.should be_nil
        end

        it "test destroy all key" do 
            @user.settings.status = "yes"
            @user.settings.password = "fdsafdsa"
            @user.settings.foo = "kaka"
            @user.settings.all.length.should eq(3)
            @user.settings.destroy_all 
            @user.settings.all.length.should eq(0)
        end
    end
end
