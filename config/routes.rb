# frozen_string_literal: true

Rails.application.routes.draw do
  root 'palindroms#index', as: 'home'
  get 'palindroms/result'
end