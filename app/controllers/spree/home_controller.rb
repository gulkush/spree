module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def home

    end

    def about
      #render_text "About us"
    end

    def contact
    end

    def faq
    end

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end