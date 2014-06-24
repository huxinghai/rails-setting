module SettingFunctional
    module Method
        attr_accessor :target

        def []=(key, value)         
            add_key(key, value)
        end

        def [](key)
            get_key(key)
        end

        def destroy_all
            get_setting.first.destroy_all
        end

        def destroy(key)            
            get_setting(key).first.destroy_all
        end

        def all
            keys = get_setting.first
            temp = {} 
            keys.each do | k |              
                temp[k.var] = format(k.value)
            end
            temp
        end

        def method_missing(method_name, *args)
            rule_method(method_name, *args)
        end

        private
        def format(value)
            YAML.load(value)
        end

        def to_value(new_value)
            new_value.to_yaml
        end

        def get_key(key)
            temp = get_setting(key).first
            temp.first.nil? ? nil : format(temp.first.value)
        end

        def add_key(key, value)
            setting = get_setting(key)
            _setting = setting.first
            value = to_value(value)

            if _setting.first.nil? 
                RailsSettings.klasss.create!(setting.last.merge!({value: value})) 
            else
                _setting.first.update_attribute(:value, value)
            end
        end

        def rule_method(method_name, *args)
            method = method_name.to_s
            if self.respond_to?(method_name)
                super(method_name, *args)
            else
                if method =~ /=$/
                    add_key(method.gsub(/=$/,''), args.first)
                else
                    get_key(method)
                end
            end
        end

        def get_setting(key = nil)
            options = key.nil? ? {} : {:var => key.to_s}        
            options.merge!({:target_id => nil, :target_type => nil})
            options.merge!({:target_id => target.id, :target_type => target.class.name}) unless target.nil?
            
            temp = RailsSettings.klasss.where(options)
            [temp, options]
        end     
    end
end