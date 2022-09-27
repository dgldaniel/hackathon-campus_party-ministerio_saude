# frozen_string_literal: true
namespace :dev do
  desc "TODO"
  task setup: :environment do
    %x(rails db:environment:set RAILS_ENV=development db:drop db:create db:migrate db:seed)
    %x(rails store_records_on_cache:handle_store_cache)
  end
end
