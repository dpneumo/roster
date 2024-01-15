# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { 
      sessions:      'users/sessions',
      registrations: 'users/registrations',
    }   

  authenticate :user do
    namespace :admin do
      resources :users
    end

    post  'houses_filter',             to: 'houses_filter#index',        as: 'houses_filter'
    get   'house_annual_contribs/:id', to: 'house_contribs#annual',      as: 'house_annual_contribs'
    get   'house_detail_contribs/:id', to: 'house_contribs#detail',      as: 'house_detail_contribs'
    get   'house_occupants/:id',       to: 'house_occupants#occupants',  as: 'house_occupants'
    get   'house_owners/:id',          to: 'house_owners#owners',        as: 'house_owners'

    get   'contributions/new_for_house/:house_id', to: 'contributions#new_for_house',  as: 'new_contrib_for_house'
    get   'contributions/:id/edit_for_house',      to: 'contributions#edit_for_house', as: 'edit_contrib_for_house'

    get   'person_email_addrs/:id',    to: 'person_email_addrs#email_addrs', as: 'person_email_addrs'
    get   'person_phone_numbers/:id',  to: 'person_phone_numbers#ph_nums',   as: 'person_phone_numbers'
    get   'person_addresses/:id',      to: 'person_addresses#addresses',     as: 'person_addresses'
 
    get   '/people/occupant/:house_id', to: 'people#new_occupant', as: 'new_occupant'

    get   '/non_occupants',         to: 'non_occupants#index',     as: 'list_non_occupants'
    patch '/non_occupant/:id',      to: 'non_occupants#update',    as: 'update_non_occupant'

    get 'download', to: 'pages#download'
    get 'preview', to: 'pages#preview'

    resources :people do
      collection do
        get 'houses'
      end
    end

    resources :streets

    resources :addresses, :phones, :emails, 
              :person_phones, :person_addresses,
              :houses, :ownerships, :contributions,
              :positions
    root 'welcome#home', as: :root
  end

  unauthenticated do
    devise_scope :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
