class PizzasController < ApplicationController

  def index
    @pizzas = Pizza.all
    render layout: 'main'
  end

  def show
    # binding.pry
    @pizza = Pizza.find(params[:id])
  end

  def show_pizza
  @pizza = Pizza.find(params[:id])
  respond_to do |format|
    format.js
    end
  end

end
