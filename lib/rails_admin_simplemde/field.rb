require 'rails_admin/config/fields/types/text'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Simplemde < RailsAdmin::Config::Fields::Types::Text
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types::register(self)
          include RailsAdmin::Engine.routes.url_helpers

          register_instance_option :tabbed do
            true
          end

          register_instance_option :html_attributes do
            {
              spellcheck: true
            }
          end

          ############ localize ######################
          register_instance_option :translations_field do
            (name.to_s + '_translations').to_sym
          end

          register_instance_option :localized? do
            @abstract_model.model.public_instance_methods.include?(translations_field)
          end

          register_instance_option :allowed_methods do
            localized? ? [translations_field] : [name]
          end

          register_instance_option :partial do
            localized? ? :simplemde_ms : :simplemde
          end
        end
      end
    end
  end
end
