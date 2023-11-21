# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  resource :dashboard, only: [:show]
  resource :profile, only: %i[new show create update]
end
