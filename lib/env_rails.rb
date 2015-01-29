require "env_rails/version"

module EnvRails
  class Railtie < Rails::Railtie
    config.after_initialize do
      ENV.each do |key, value|
        if key =~ /\ARAILS_CONFIG((__[a-z_]+)+)\Z/
          config_path = $1.split('__')[1 .. -1]
          parameter_name = config_path.pop

          # Find or create the parameter container
          config_container = config
          while config_path.any?
            selector = config_path.shift
            unless sub_container = EnvRails.get_value(config_container, selector)
              # If it doesn't exist, a new hash is created
              sub_container = {}
              EnvRails.set_value(config_container, selector, sub_container)
            end
            config_container = sub_container
          end

          # Assume integer values it they look like one
          if value =~ /\A[0-9]+\Z/
            value = value.to_i
          end

          EnvRails.set_value(config_container, parameter_name, value)
        end
      end
    end
  end

  private

  def self.get_value(object, key)
    if object.respond_to?(:[])
      object[key.to_sym]
    else
      object.send(key)
    end
  end

  def self.set_value(object, key, value)
    if object.respond_to?(:[]=)
      object[key.to_sym] = value
    else
      object.send("#{key}=", value)
    end
  end
end
