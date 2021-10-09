module Api
  module V1
    class DietsController < ApplicationController
      
      require 'openfoodfacts'

      def index
        @products = Openfoodfacts::Product.search("Chocolate", locale: 'world', page_size: 3)
      end
    end
  end
end