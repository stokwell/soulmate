# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  resource :dashboard, only: [:show] do
    collection do
      get 'search'
    end
  end
  resource :profile, only: %i[new show edit create update]
end
