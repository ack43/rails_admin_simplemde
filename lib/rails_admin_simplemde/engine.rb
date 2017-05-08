module RailsAdminSimplemde
  class Engine < ::Rails::Engine
    isolate_namespace RailsAdmin

    initializer "RailsAdminSimplemde precompile hook" do |app|
      app.config.assets.precompile += ['rails_admin/ra.simplemde.js', 'rails_admin/ra.simplemde.css']
    end

  end
end
