RailsAdmin.config do |config|

  ### Popular gems integration

  RailsAdmin.config do |config|
    config.authenticate_with do
      warden.authenticate! scope: :user
    end
    config.current_user_method(&:current_user)
  end

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard do
      # This will disable the record count bar 
      statistics false
    end              
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    history_index
    history_show
  end

  # By default all fields are visible, but they are not presented in any particular order. If you specifically declare fields, only defined fields will be visible and they will be presented in the order defined

  # Displaying and using only specific fields into the defined order.

  RailsAdmin.config do |config|
    config.model 'User' do
      list do
        field :id
        field :email
        field :sign_in_count
      end
      create do
        field :email do 
          help 'Required: Must provide email.'
        end
        field :password do 
          help 'Password must be at least 8 character long.'
        end
        field :password_confirmation do
          label "Confirm Password"
          help 'Must be matched with the password given above.'
        end
      end
      edit do
        field :email do 
          help 'Required: Must provide email.'
        end
        field :password do 
          help 'Password must be at least 8 character long.'
        end
        field :password_confirmation do
          label "Confirm Password"
          help 'Must be matched with the password given above.'
        end
      end
    end
  end

end