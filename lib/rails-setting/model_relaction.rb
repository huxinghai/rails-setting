module RailsSettings
    def self.included(base)
        base.extend(ClassMethods)
    end

    module ClassMethods
        def has_settings
            class_eval do
                def settings
                    Settings.new(self)
                end
            end
        end
    end
end