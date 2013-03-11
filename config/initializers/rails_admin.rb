# RailsAdmin config file. Generated on February 20, 2013 21:53
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  config.authorize_with :cancan

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app

    # Add the nestable action for each model
    nestable do
      visible do
        [::PiggybakTaxonomy::NavigationNode].include? bindings[:abstract_model].model
      end
    end
  end


  ###############

  config.current_user_method { current_user } # auto-generated

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Outpouring', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  config.model Product do
    navigation_label "Outpouring Application"
    list do
      field :title
      field :slug
    end
    edit do
      field :title
      field :slug
      field :description
      field :piggybak_sellable
      include_all_fields
    end
  end
  config.model User do
    navigation_label "Outpouring Application"
    list do
      field :email
      field :fullname
    end
  end
  config.model Role do
    navigation_label "Outpouring Application"
  end
end

